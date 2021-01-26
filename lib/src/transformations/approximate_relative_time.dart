import 'package:humanizer/humanizer.dart';
import 'package:meta/meta.dart';

/// A transformation to convert a [Duration] representing an offset of time from "now", into an approximate,
/// human-friendly description.
///
/// This transformation produces a humanized description of the input [Duration], which represents some offset from
/// "now". Positive values are considered to be in the future and negative values in the past.
///
/// The input [Duration] is used to calculate a value for each supported [Unit]. The highest unit to have a non-zero
/// value is considered the "primary" unit, and the next smaller unit is the "secondary" regardless of whether it has a
/// non-zero value. In the case of the primary unit being the smallest supported unit (seconds), there is no secondary
/// unit.
///
/// The [granularity] argument determines whether only the primary unit affects the output, or whether the secondary
/// unit is used to provide a lengthier, but more refined description. For example, a [Duration] of 1 hour and 5 minutes
/// will be described at "an hour from now" for a primary-only granularity, or "just over an hour from now" for a
/// primary and secondary granularity.
///
/// Prior to transformation, the calculated tally of units can optionally be rounded by setting [round] is `true`.
/// Rounding involves examining the highest unit value _not_ included in the output (i.e. the secondary unit value if
/// [granularity] is [Granularity.primaryUnit], or the tertiary unit value if [granularity] is
/// [Granularity.primaryAndSecondaryUnits]) to see whether it equals or exceeds the midpoint of that unit. If so, the
/// next highest unit value is incremented (and all lower unit values are truncated to zero).
///
/// The table below gives some examples of how given inputs are transformed when using the specified configuration:
///
/// | Duration | Granularity | Round | Output |
/// |-|-|-|-|
/// | 0 seconds | N/A | N/A | `now` |
/// | 1 second | N/A | N/A | `a second from now` |
/// | -1 second | N/A | N/A | `a second ago` |
/// | 3 seconds | N/A | N/A | `3 seconds from now` |
/// | 1 minute, 30 seconds | `primaryUnit` | `false` | `a minute from now` |
/// | 1 minute, 30 seconds | `primaryUnit` | `true` | `2 minutes from now` |
/// | 1 minute, 5 seconds | `primaryAndSecondaryUnits` | N/A | `just over a minute from now` |
/// | 1 minute, 55 seconds | `primaryAndSecondaryUnits` | N/A | `just under 2 minutes from now` |
/// | 1 hour, 29 minutes, 30 seconds | `primaryUnit` | `true` | `an hour from now` |
/// | 1 hour, 30 minutes, 30 seconds | `primaryUnit` | `true` | `2 hours from now` |
/// | 1 hour, 29 minutes, 29 seconds | `primaryAndSecondaryUnits` | `true` | `over an hour from now` |
/// | 1 hour, 29 minutes, 30 seconds | `primaryAndSecondaryUnits` | `true` | `under 2 hours from now` |
///
/// ```
/// final transformation = ApproximateRelativeTimeTransformation(
///   granularity: Granularity.primaryAndSecondaryUnits,
///   round: true,
/// );
///
/// // 'over an hour from now'
/// transformation.transform(Duration(hours: 1, minutes: 29, seconds: 29), 'en_US');
///
/// // 'under 2 hours from now'
/// transformation.transform(Duration(hours: 1, minutes: 29, seconds: 30), 'en_US');
///
/// // 'an hour ago'
/// transformation.transform(Duration(hours: -1), 'en_US');
/// ```
@immutable
class ApproximateRelativeTimeTransformation extends Transformation<Duration, String> {
  const ApproximateRelativeTimeTransformation({
    required this.granularity,
    required this.round,
  });

  /// The [Granularity] to which the input [DateTime] will be humanized.
  final Granularity granularity;

  /// Whether to round the input [Duration] prior to humanizing it.
  final bool round;

  @override
  String transform(Duration input, String locale) {
    final tense = input.isNegative ? _Tense.past : _Tense.future;
    input = input.abs();

    var timeRange = TimeRange.fromDuration(input);

    // Perform rounding as dictated by [round] and [granularity].
    if (round) {
      var roundTo = timeRange.mostSignificantUnit;

      if (granularity == Granularity.primaryAndSecondaryUnits) {
        roundTo = roundTo.nextSmaller ?? roundTo;
      }

      timeRange = timeRange.round(roundTo);
    }

    // Then transform the rounded value.
    final result = _transformFrom(
      timeRange,
      granularity,
      tense,
      locale,
    );
    return result;
  }

  static String _transformFrom(
    TimeRange timeRange,
    Granularity granularity,
    _Tense tense,
    String locale,
  ) {
    final primaryUnit = timeRange.mostSignificantUnit;
    final secondaryUnit = granularity == Granularity.primaryUnit ? null : primaryUnit.nextSmaller;
    var primaryValue = timeRange.valueOfUnit(primaryUnit);
    final secondaryValue = secondaryUnit == null ? null : timeRange.valueOfUnit(secondaryUnit);
    final relativity = tense == _Tense.past ? 'ago' : 'from now';

    var secondaryQuantifierText = '';

    if (secondaryUnit != null && secondaryValue != null) {
      final secondaryQuantifier = secondaryUnit.getSecondaryQuantifier(secondaryValue);

      if (secondaryQuantifier == _SecondaryQuantifier.under || secondaryQuantifier == _SecondaryQuantifier.justUnder) {
        // If the secondary value is close enough to the next primary value, we increment the primary value so that
        // things read correctly.
        primaryValue += 1;
      }

      secondaryQuantifierText = secondaryQuantifier.toLocalizedString(locale);
    }

    if (primaryUnit == Unit.second && primaryValue == 0) {
      return 'now';
    } else if (primaryUnit == Unit.second) {
      final period = primaryValue == 1 ? 'a second' : '${primaryValue} seconds';
      return '$period $relativity';
    } else if (primaryUnit == Unit.minute) {
      final period = primaryValue == 1 ? 'a minute' : '${primaryValue} minutes';
      return '$secondaryQuantifierText$period $relativity';
    } else if (primaryUnit == Unit.hour) {
      final period = primaryValue == 1 ? 'an hour' : '${primaryValue} hours';
      return '$secondaryQuantifierText$period $relativity';
    } else if (primaryUnit == Unit.day) {
      if (primaryValue == 1 && (secondaryValue ?? 0) == 0) {
        if (tense == _Tense.past) {
          return 'yesterday';
        } else {
          return 'tomorrow';
        }
      } else {
        final period = primaryValue == 1 ? 'a day' : '${primaryValue} days';
        return '$secondaryQuantifierText$period $relativity';
      }
    } else if (primaryUnit == Unit.week) {
      final period = primaryValue == 1 ? 'a week' : '${primaryValue} weeks';
      return '$secondaryQuantifierText$period $relativity';
    } else if (primaryUnit == Unit.month) {
      final period = primaryValue == 1 ? 'a month' : '${primaryValue} months';
      return '$secondaryQuantifierText$period $relativity';
    } else if (primaryUnit == Unit.year) {
      final period = primaryValue == 1 ? 'a year' : '${primaryValue} years';
      return '$secondaryQuantifierText$period $relativity';
    }

    return '';
  }
}

/// Defines levels of granularity a [DateTime] can be humanized by a [ApproximateRelativeTimeTransformation].
enum Granularity {
  /// Only the primary unit is considered when humanizing.
  primaryUnit,

  /// Both the primary and secondary units are considered when humanizing.
  primaryAndSecondaryUnits,
}

/// Defines the units that are calculated when humanizing a [DateTime] with a [ApproximateRelativeTimeTransformation].
enum Unit {
  /// A unit roughly equating to a year, which is averaged to `365.25` days.
  year,

  /// A unit roughly equating to a month, which is averaged to `30.4375` days.
  month,

  /// A unit equating to a week, which is 7 days.
  week,

  /// A unit equating to a day.
  day,

  /// A unit equating to an hour.
  hour,

  /// A unit equating to a minute.
  minute,

  /// A unit equating to a second.
  second,
}

extension _UnitExtensions on Unit {
  Unit? get nextSmaller {
    switch (this) {
      case Unit.year:
        return Unit.month;
      case Unit.month:
        return Unit.week;
      case Unit.week:
        return Unit.day;
      case Unit.day:
        return Unit.hour;
      case Unit.hour:
        return Unit.minute;
      case Unit.minute:
        return Unit.second;
      case Unit.second:
        return null;
    }
  }

  _SecondaryQuantifier getSecondaryQuantifier(int value) {
    if (value == 0) {
      return _SecondaryQuantifier.none;
    }

    switch (this) {
      case Unit.month:
        if (value < 3) {
          return _SecondaryQuantifier.justOver;
        } else if (value < 6) {
          return _SecondaryQuantifier.over;
        } else if (value < 9) {
          return _SecondaryQuantifier.under;
        } else {
          return _SecondaryQuantifier.justUnder;
        }
      case Unit.week:
        // This is not ideal because the first week of a month is classified as quantifier "none", the second as "over",
        // and the third and fourth as "under", so it's not an even spread.
        if (value == 1) {
          return _SecondaryQuantifier.over;
        } else if (value >= 2) {
          return _SecondaryQuantifier.under;
        }

        return _SecondaryQuantifier.none;
      case Unit.day:
        if (value < 2) {
          return _SecondaryQuantifier.justOver;
        } else if (value < 4) {
          return _SecondaryQuantifier.over;
        } else if (value < 6) {
          return _SecondaryQuantifier.under;
        } else {
          return _SecondaryQuantifier.justUnder;
        }
      case Unit.hour:
        if (value < 6) {
          return _SecondaryQuantifier.justOver;
        } else if (value < 12) {
          return _SecondaryQuantifier.over;
        } else if (value < 18) {
          return _SecondaryQuantifier.under;
        } else {
          return _SecondaryQuantifier.justUnder;
        }
      case Unit.minute:
        if (value < 15) {
          return _SecondaryQuantifier.justOver;
        } else if (value < 30) {
          return _SecondaryQuantifier.over;
        } else if (value < 45) {
          return _SecondaryQuantifier.under;
        } else {
          return _SecondaryQuantifier.justUnder;
        }
      case Unit.second:
        if (value < 15) {
          return _SecondaryQuantifier.justOver;
        } else if (value < 30) {
          return _SecondaryQuantifier.over;
        } else if (value < 45) {
          return _SecondaryQuantifier.under;
        } else {
          return _SecondaryQuantifier.justUnder;
        }
      default:
        throw UnsupportedError('Cannot get secondary quantifier for units: $this');
    }
  }
}

enum _Tense {
  past,
  future,
}

enum _SecondaryQuantifier {
  none,
  justOver,
  over,
  under,
  justUnder,
}

extension _SecondaryQuantifierExtensions on _SecondaryQuantifier {
  String toLocalizedString(String locale) {
    switch (this) {
      case _SecondaryQuantifier.none:
        return '';
      case _SecondaryQuantifier.justOver:
        return 'just over ';
      case _SecondaryQuantifier.over:
        return 'over ';
      case _SecondaryQuantifier.under:
        return 'under ';
      case _SecondaryQuantifier.justUnder:
        return 'just under ';
    }
  }
}

@visibleForTesting
@immutable
class TimeRange {
  TimeRange.fromDuration(this.duration) {
    _calculateUnits();
  }

  static const averageDaysInYear = 365.25;
  static const averageDaysInMonth = averageDaysInYear / 12;
  static const daysInWeek = 7;

  final Duration duration;

  late final int years;
  late final int months;
  late final int weeks;
  late final int days;
  late final int hours;
  late final int minutes;
  late final int seconds;

  Unit get mostSignificantUnit {
    if (years > 0) {
      return Unit.year;
    } else if (months > 0) {
      return Unit.month;
    } else if (weeks > 0) {
      return Unit.week;
    } else if (days > 0) {
      return Unit.day;
    } else if (hours > 0) {
      return Unit.hour;
    } else if (minutes > 0) {
      return Unit.minute;
    } else {
      return Unit.second;
    }
  }

  int valueOfUnit(Unit unit) {
    switch (unit) {
      case Unit.year:
        return years;
      case Unit.month:
        return months;
      case Unit.week:
        return weeks;
      case Unit.day:
        return days;
      case Unit.hour:
        return hours;
      case Unit.minute:
        return minutes;
      case Unit.second:
        return seconds;
    }
  }

  @override
  bool operator ==(Object other) {
    if (!(other is TimeRange)) {
      return false;
    }

    return duration == other.duration;
  }

  @override
  int get hashCode {
    var hash = 17;
    hash = hash * 23 + duration.hashCode;
    return hash;
  }

  @override
  String toString() => '$duration';

  /// Ensures that the largest non-zero unit is [roundTo], rounding it up if the next smallest unit exceeds its
  /// midpoint.
  TimeRange round(Unit roundTo) {
    var roundedYears = years;
    var roundedMonths = months;
    var roundedWeeks = weeks;
    var roundedDays = days;
    var roundedHours = hours;
    var roundedMinutes = minutes;
    var roundedSeconds = seconds;

    switch (roundTo) {
      case Unit.year:
        if (roundedMonths >= 6) {
          ++roundedYears;
        }

        roundedMonths = roundedWeeks = roundedDays = roundedHours = roundedMinutes = roundedSeconds = 0;
        break;
      case Unit.month:
        if (roundedWeeks >= 2) {
          ++roundedMonths;
        }

        roundedWeeks = roundedDays = roundedHours = roundedMinutes = roundedSeconds = 0;
        break;
      case Unit.week:
        if (roundedDays >= 4) {
          ++roundedWeeks;
        }

        roundedDays = roundedHours = roundedMinutes = roundedSeconds = 0;
        break;
      case Unit.day:
        if (roundedHours >= 12) {
          ++roundedDays;
        }

        roundedHours = roundedMinutes = roundedSeconds = 0;
        break;
      case Unit.hour:
        if (roundedMinutes >= 30) {
          ++roundedHours;
        }

        roundedMinutes = roundedSeconds = 0;
        break;
      case Unit.minute:
        if (roundedSeconds >= 30) {
          ++roundedMinutes;
        }

        roundedSeconds = 0;
        break;
      case Unit.second:
        break;
    }

    final roundedDuration = Duration(
      days: (roundedYears * averageDaysInYear +
              roundedMonths * averageDaysInMonth +
              roundedWeeks * daysInWeek +
              roundedDays)
          .ceil(),
      hours: roundedHours,
      minutes: roundedMinutes,
      seconds: roundedSeconds,
    );
    final result = TimeRange.fromDuration(roundedDuration);

    return result;
  }

  void _calculateUnits() {
    var runningDuration = duration;

    years = runningDuration.inDays ~/ averageDaysInYear;
    runningDuration -= Duration(days: (years * averageDaysInYear).toInt());

    months = runningDuration.inDays ~/ averageDaysInMonth;
    runningDuration -= Duration(days: (months * averageDaysInMonth).toInt());

    weeks = runningDuration.inDays ~/ daysInWeek;
    runningDuration -= Duration(days: weeks * daysInWeek);

    days = runningDuration.inDays;
    runningDuration -= Duration(days: days);

    hours = runningDuration.inHours;
    runningDuration -= Duration(hours: hours);

    minutes = runningDuration.inMinutes;
    runningDuration -= Duration(minutes: minutes);

    seconds = runningDuration.inSeconds;
    runningDuration -= Duration(seconds: seconds);

    assert(years >= 0);
    assert(months >= 0);
    assert(weeks >= 0);
    assert(days >= 0);
    assert(hours >= 0 && hours < 24);
    assert(minutes >= 0 && minutes < 60);
    assert(seconds >= 0 && seconds < 60);
  }
}
