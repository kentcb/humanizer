import 'package:decimal/decimal.dart';
import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/decimals.dart';
import 'package:meta/meta.dart';

/// A transformation to convert a [Duration] representing an offset of time from "now", into an approximate,
/// human-friendly description.
///
/// This transformation produces a humanized description of the input [Duration], which represents some offset from
/// "now". Positive values are considered to be in the future and negative values in the past.
///
/// The input [Duration] is used to calculate a value for each supported [TimeUnit]. The highest unit to have a non-zero
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

  static final _supportedTimeUnits = <TimeUnit>{
    TimeUnit.second,
    TimeUnit.minute,
    TimeUnit.hour,
    TimeUnit.day,
    TimeUnit.week,
    TimeUnit.month,
    TimeUnit.year,
  };

  /// The [Granularity] to which the input [DateTime] will be humanized.
  final Granularity granularity;

  /// Whether to round the input [Duration] prior to humanizing it.
  final bool round;

  @override
  String transform(Duration input, String locale) {
    final tense = input.isNegative ? _Tense.past : _Tense.future;
    input = input.abs();

    var time = input.inSeconds.seconds();

    // Perform rounding as dictated by [round] and [granularity].
    if (round) {
      var roundTo = time.getLargestUnit(permissibleUnits: _supportedTimeUnits);

      if (granularity == Granularity.primaryAndSecondaryUnits) {
        roundTo = roundTo.nextSmaller ?? roundTo;
      }

      time = time.round(roundTo);
    }

    // Then transform the rounded value.
    final result = _transformFrom(
      time,
      granularity,
      tense,
      locale,
    );
    return result;
  }

  static String _transformFrom(
    Time time,
    Granularity granularity,
    _Tense tense,
    String locale,
  ) {
    final primaryUnit = time.getLargestUnit(permissibleUnits: _supportedTimeUnits);
    final secondaryUnit = granularity == Granularity.primaryUnit ? null : primaryUnit.nextSmaller;

    final primaryValue = time.getUnits(primaryUnit);
    var truncatedPrimaryValue = primaryValue.toInt();
    int? truncatedSecondaryValue;
    var secondaryQuantifierText = '';

    if (secondaryUnit != null) {
      final remainingTime = time - Time.fromUnits(primaryUnit, di(truncatedPrimaryValue));
      final secondaryValue = remainingTime.getUnits(secondaryUnit);
      truncatedSecondaryValue = secondaryValue.toInt();
      final fraction = primaryValue - primaryValue.truncate();
      var secondaryQuantifier = _SecondaryQuantifier.none;

      if (fraction != Decimal.zero) {
        if (fraction >= Decimals.threeQuarters) {
          secondaryQuantifier = _SecondaryQuantifier.justUnder;
        } else if (fraction >= Decimals.half) {
          secondaryQuantifier = _SecondaryQuantifier.under;
        } else if (fraction >= Decimals.quarter) {
          secondaryQuantifier = _SecondaryQuantifier.over;
        } else {
          secondaryQuantifier = _SecondaryQuantifier.justOver;
        }
      }

      if (secondaryQuantifier == _SecondaryQuantifier.under || secondaryQuantifier == _SecondaryQuantifier.justUnder) {
        // If the secondary value is close enough to the next primary value, we increment the primary value so that
        // things read correctly.
        truncatedPrimaryValue += 1;
      }

      secondaryQuantifierText = secondaryQuantifier.toLocalizedString(locale);
    }

    final relativity = tense == _Tense.past ? 'ago' : 'from now';

    if (primaryUnit == TimeUnit.second && truncatedPrimaryValue == 0) {
      return 'now';
    } else if (primaryUnit == TimeUnit.day && truncatedPrimaryValue == 1 && (truncatedSecondaryValue ?? 0) == 0) {
      return tense == _Tense.past ? 'yesterday' : 'tomorrow';
    } else {
      final primaryUnitName = primaryUnit.getName(locale: locale).toPluralFormForQuantity(
            quantity: truncatedPrimaryValue,
            includeQuantity: false,
            locale: locale,
          );
      // TODO: should be generalized and localized??
      final article = primaryUnit == TimeUnit.hour ? 'an' : 'a';
      final period =
          truncatedPrimaryValue == 1 ? '$article $primaryUnitName' : '$truncatedPrimaryValue $primaryUnitName';
      return '$secondaryQuantifierText$period $relativity';
    }
  }
}

/// Defines levels of granularity a [DateTime] can be humanized by a [ApproximateRelativeTimeTransformation].
enum Granularity {
  /// Only the primary unit is considered when humanizing.
  primaryUnit,

  /// Both the primary and secondary units are considered when humanizing.
  primaryAndSecondaryUnits,
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

extension _TimeUnitExtensions on TimeUnit {
  TimeUnit? get nextSmaller {
    switch (this) {
      case TimeUnit.century:
        return TimeUnit.decade;
      case TimeUnit.decade:
        return TimeUnit.year;
      case TimeUnit.year:
        return TimeUnit.month;
      case TimeUnit.month:
        return TimeUnit.week;
      case TimeUnit.week:
        return TimeUnit.day;
      case TimeUnit.day:
        return TimeUnit.hour;
      case TimeUnit.hour:
        return TimeUnit.minute;
      case TimeUnit.minute:
        return TimeUnit.second;
      default:
        return null;
    }
  }
}
