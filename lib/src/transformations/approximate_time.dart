import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';
import 'package:meta/meta.dart';
import 'package:rational/rational.dart';

/// A transformation to convert a [Duration] representing an offset of time into an approximate, human-friendly
/// description.
///
/// This transformation produces a humanized description of an input [Duration], which is used to calculate a value for
/// each supported [TimeUnit]. The highest unit to have a non-zero value is considered the "primary" unit, and the next
/// smaller unit is the "secondary" regardless of whether it has a non-zero value. In the case of the primary unit being
/// the smallest supported unit (seconds), there is no secondary unit.
///
/// If [isRelativeToNow] is `true`, the input [Duration] is assumed to be relative to now, which allows for additional
/// context to be included in the output. A negative input is considered to be in the past, whilst a positive input is
/// in the future. For example, an output of `'tomorrow'` only makes sense when the input is relative to now. If
/// [isRelativeToNow] is `false`, a simpler output will be produced making no assumptions about the relativity of the
/// input. In addition, the sign of the input is ignored.
///
/// The [granularity] argument determines whether only the primary unit affects the output, or whether the secondary
/// unit is used to provide a lengthier, but more refined description. For example, a [Duration] of 1 hour and 5 minutes
/// will be described at `'an hour from now'` for a primary-only granularity, or `'just over an hour from now'` for a
/// primary and secondary granularity (assuming [isRelativeToNow] is `true` in both examples).
///
/// Prior to transformation, the calculated tally of units can optionally be rounded by setting [round] is `true`.
/// Rounding involves examining the highest unit value _not_ included in the output (i.e. the secondary unit value if
/// [granularity] is [Granularity.primaryUnit], or the tertiary unit value if [granularity] is
/// [Granularity.primaryAndSecondaryUnits]) to see whether it equals or exceeds the midpoint of that unit. If so, the
/// next highest unit value is incremented (and all lower unit values are truncated to zero).
///
/// The table below gives some examples of how given inputs are transformed when using the specified configuration:
///
/// | Duration | Granularity | Round | Is Relative to Now | Output |
/// |-|-|-|-|
/// | 0 seconds | N/A | N/A | `true` | `now` |
/// | 0 seconds | N/A | N/A | `false` | `zero` |
/// | 1 second | N/A | N/A | `true` | `a second from now` |
/// | 1 second | N/A | N/A | `false` | `1 second` |
/// | -1 second | N/A | N/A | `true` | `a second ago` |
/// | -1 second | N/A | N/A | `false` | `1 second` |
/// | 3 seconds | N/A | N/A | `true` | `3 seconds from now` |
/// | 3 seconds | N/A | N/A | `false` | `3 seconds` |
/// | 1 minute, 30 seconds | `primaryUnit` | `false` | `true` | `a minute from now` |
/// | 1 minute, 30 seconds | `primaryUnit` | `true` | `true` | `2 minutes from now` |
/// | 1 minute, 5 seconds | `primaryAndSecondaryUnits` | N/A | `true` | `just over a minute from now` |
/// | 1 minute, 55 seconds | `primaryAndSecondaryUnits` | N/A | `true` | `just under 2 minutes from now` |
/// | 1 hour, 29 minutes, 30 seconds | `primaryUnit` | `true` | `true` | `an hour from now` |
/// | 1 hour, 30 minutes, 30 seconds | `primaryUnit` | `true` | `true` | `2 hours from now` |
/// | 1 hour, 29 minutes, 29 seconds | `primaryAndSecondaryUnits` | `true` | `true` | `over an hour from now` |
/// | 1 hour, 29 minutes, 30 seconds | `primaryAndSecondaryUnits` | `true` | `true` / `under 2 hours from now` |
///
/// ```
/// final transformation = ApproximateTimeTransformation(
///   granularity: Granularity.primaryAndSecondaryUnits,
///   round: true,
///   isRelativeToNow: true,
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
class ApproximateTimeTransformation extends Transformation<Duration, String> {
  const ApproximateTimeTransformation({
    required this.granularity,
    required this.round,
    required this.isRelativeToNow,
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

  /// If `true`, the input [Duration] will be interpreted as relative to now. Doing so allows the output to be tailored
  /// under that assumption, such as producing `'now'` or `'tomorrow'`.
  final bool isRelativeToNow;

  @override
  String transform(Duration input, String locale) {
    final sign = input.isNegative ? _Sign.negative : _Sign.positive;
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
      isRelativeToNow,
      granularity,
      sign,
      locale,
    );
    return result;
  }

  static String _transformFrom(
    Time time,
    bool isRelativeToNow,
    Granularity granularity,
    _Sign sign,
    String locale,
  ) {
    final primaryUnit = time.getLargestUnit(permissibleUnits: _supportedTimeUnits);
    final secondaryUnit = granularity == Granularity.primaryUnit ? null : primaryUnit.nextSmaller;

    final primaryValue = time.getUnits(primaryUnit);
    var truncatedPrimaryValue = primaryValue.toBigInt();
    BigInt? truncatedSecondaryValue;
    String? secondaryQuantifierText;

    if (secondaryUnit != null) {
      final remainingTime = time - Time.fromUnits(primaryUnit, rbi(truncatedPrimaryValue));
      final secondaryValue = remainingTime.getUnits(secondaryUnit);
      truncatedSecondaryValue = secondaryValue.toBigInt();
      final fraction = primaryValue - Rational(primaryValue.truncate());
      var secondaryQuantifier = _SecondaryQuantifier.none;

      if (fraction != Rationals.zero) {
        if (fraction >= Rationals.threeQuarters) {
          secondaryQuantifier = _SecondaryQuantifier.justUnder;
        } else if (fraction >= Rationals.half) {
          secondaryQuantifier = _SecondaryQuantifier.under;
        } else if (fraction >= Rationals.quarter) {
          secondaryQuantifier = _SecondaryQuantifier.over;
        } else {
          secondaryQuantifier = _SecondaryQuantifier.justOver;
        }
      }

      if (secondaryQuantifier == _SecondaryQuantifier.under || secondaryQuantifier == _SecondaryQuantifier.justUnder) {
        // If the secondary value is close enough to the next primary value, we increment the primary value so that
        // things read correctly.
        truncatedPrimaryValue += BigInt.one;
      }

      secondaryQuantifierText = secondaryQuantifier.toLocalizedString(locale);
    }

    if (!isRelativeToNow && time == Time.zero) {
      return 'zero';
    } else if (isRelativeToNow && primaryUnit == TimeUnit.second && truncatedPrimaryValue == BigInt.zero) {
      return 'now';
    } else if (isRelativeToNow &&
        primaryUnit == TimeUnit.day &&
        truncatedPrimaryValue == BigInt.one &&
        (truncatedSecondaryValue ?? 0) == 0) {
      return sign == _Sign.negative ? 'yesterday' : 'tomorrow';
    } else {
      final primaryUnitName = primaryUnit.getName(locale: locale).toPluralFormForQuantity(
            quantity: truncatedPrimaryValue.toInt(),
            includeQuantity: false,
            locale: locale,
          );

      return <String>[
        if (secondaryQuantifierText != null) secondaryQuantifierText,
        if (isRelativeToNow && truncatedPrimaryValue == BigInt.one)
          // TODO: should be generalized and localized??
          if (primaryUnit == TimeUnit.hour) 'an' else 'a'
        else
          truncatedPrimaryValue.toString(),
        primaryUnitName,
        if (isRelativeToNow)
          if (sign == _Sign.negative) 'ago' else 'from now',
      ].join(' ');
    }
  }
}

/// Defines levels of granularity a [DateTime] can be humanized by a [ApproximateTimeTransformation].
enum Granularity {
  /// Only the primary unit is considered when humanizing.
  primaryUnit,

  /// Both the primary and secondary units are considered when humanizing.
  primaryAndSecondaryUnits,
}

enum _Sign {
  positive,
  negative,
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
        return 'just over';
      case _SecondaryQuantifier.over:
        return 'over';
      case _SecondaryQuantifier.under:
        return 'under';
      case _SecondaryQuantifier.justUnder:
        return 'just under';
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
