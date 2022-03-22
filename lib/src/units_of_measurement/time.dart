import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/decimals.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';
import 'package:meta/meta.dart';
import 'package:rational/rational.dart';

/// A unit of measurement representing time.
class Time extends UnitOfMeasurement<TimeUnit, Time> {
  /// Creates a [Time] given a [unit] and decimal [value] for that unit.
  Time.fromUnits(TimeUnit unit, Rational value) : super.fromUnits(unit, value);

  /// Creates a [Time] representing the specified number of [nanoseconds].
  factory Time.fromNanoseconds(Rational nanoseconds) => Time.fromUnits(TimeUnit.nanosecond, nanoseconds);

  /// Creates a [Time] representing the specified number of [microseconds].
  factory Time.fromMicroseconds(Rational microseconds) => Time.fromUnits(TimeUnit.microsecond, microseconds);

  /// Creates a [Time] representing the specified number of [milliseconds].
  factory Time.fromMilliseconds(Rational milliseconds) => Time.fromUnits(TimeUnit.millisecond, milliseconds);

  /// Creates a [Time] representing the specified number of [centiseconds].
  factory Time.fromCentiseconds(Rational centiseconds) => Time.fromUnits(TimeUnit.centisecond, centiseconds);

  /// Creates a [Time] representing the specified number of [deciseconds].
  factory Time.fromDeciseconds(Rational deciseconds) => Time.fromUnits(TimeUnit.decisecond, deciseconds);

  /// Creates a [Time] representing the specified number of [seconds].
  factory Time.fromSeconds(Rational seconds) => Time.fromUnits(TimeUnit.second, seconds);

  /// Creates a [Time] representing the specified number of [decaseconds].
  factory Time.fromDecaseconds(Rational decaseconds) => Time.fromUnits(TimeUnit.decasecond, decaseconds);

  /// Creates a [Time] representing the specified number of [minutes].
  factory Time.fromMinutes(Rational minutes) => Time.fromUnits(TimeUnit.minute, minutes);

  /// Creates a [Time] representing the specified number of [hours].
  factory Time.fromHours(Rational hours) => Time.fromUnits(TimeUnit.hour, hours);

  /// Creates a [Time] representing the specified number of [days].
  factory Time.fromDays(Rational days) => Time.fromUnits(TimeUnit.day, days);

  /// Creates a [Time] representing the specified number of [weeks].
  factory Time.fromWeeks(Rational weeks) => Time.fromUnits(TimeUnit.week, weeks);

  /// Creates a [Time] representing the specified number of [fortnights].
  factory Time.fromFortnights(Rational fortnights) => Time.fromUnits(TimeUnit.fortnight, fortnights);

  /// Creates a [Time] representing the specified number of [months].
  factory Time.fromMonths(Rational months) => Time.fromUnits(TimeUnit.month, months);

  /// Creates a [Time] representing the specified number of [quarters].
  factory Time.fromQuarters(Rational quarters) => Time.fromUnits(TimeUnit.quarter, quarters);

  /// Creates a [Time] representing the specified number of [years].
  factory Time.fromYears(Rational years) => Time.fromUnits(TimeUnit.year, years);

  /// Creates a [Time] representing the specified number of [decades].
  factory Time.fromDecades(Rational decades) => Time.fromUnits(TimeUnit.decade, decades);

  /// Creates a [Time] representing the specified number of [centuries].
  factory Time.fromCenturies(Rational centuries) => Time.fromUnits(TimeUnit.century, centuries);

  /// A [Time] of zero duration.
  static final zero = Time.fromSeconds(Rationals.zero);

  static final _defaultFormat = TimeFormat();

  /// Gets the number of nanoseconds in this [Time], including any fractional portion.
  Rational get nanoseconds => getUnits(TimeUnit.nanosecond);

  /// Gets the number of microseconds in this [Time], including any fractional portion.
  Rational get microseconds => getUnits(TimeUnit.microsecond);

  /// Gets the number of milliseconds in this [Time], including any fractional portion.
  Rational get milliseconds => getUnits(TimeUnit.millisecond);

  /// Gets the number of centiseconds in this [Time], including any fractional portion.
  Rational get centiseconds => getUnits(TimeUnit.centisecond);

  /// Gets the number of deciseconds in this [Time], including any fractional portion.
  Rational get deciseconds => getUnits(TimeUnit.decisecond);

  /// Gets the number of seconds in this [Time], including any fractional portion.
  Rational get seconds => getUnits(TimeUnit.second);

  /// Gets the number of decaseconds in this [Time], including any fractional portion.
  Rational get decaseconds => getUnits(TimeUnit.decasecond);

  /// Gets the number of minutes in this [Time], including any fractional portion.
  Rational get minutes => getUnits(TimeUnit.minute);

  /// Gets the number of hours in this [Time], including any fractional portion.
  Rational get hours => getUnits(TimeUnit.hour);

  /// Gets the number of days in this [Time], including any fractional portion.
  Rational get days => getUnits(TimeUnit.day);

  /// Gets the number of weeks in this [Time], including any fractional portion.
  Rational get weeks => getUnits(TimeUnit.week);

  /// Gets the number of fortnights in this [Time], including any fractional portion.
  Rational get fortnights => getUnits(TimeUnit.fortnight);

  /// Gets the number of months in this [Time], including any fractional portion.
  Rational get months => getUnits(TimeUnit.month);

  /// Gets the number of quarters in this [Time], including any fractional portion.
  Rational get quarters => getUnits(TimeUnit.quarter);

  /// Gets the number of years in this [Time], including any fractional portion.
  Rational get years => getUnits(TimeUnit.year);

  /// Gets the number of decades in this [Time], including any fractional portion.
  Rational get decades => getUnits(TimeUnit.decade);

  /// Gets the number of centuries in this [Time], including any fractional portion.
  Rational get centuries => getUnits(TimeUnit.century);

  /// Creates a [TimeRate] with the specified [period] from this value.
  TimeRate per(Duration period) => TimeRate._(
        value: this,
        period: period,
      );

  @override
  Rational getUnits(TimeUnit unit) => baseValue / unit._secondCount;

  @override
  String toString() => _defaultFormat.format(this);

  @override
  @protected
  Time createValue(Rational baseValue) => Time.fromSeconds(baseValue);

  @override
  @protected
  Rational getBaseValue(TimeUnit unit, Rational value) => value * unit._secondCount;
}

/// Defines supported units of time.
enum TimeUnit {
  /// A unit representing nanoseconds.
  nanosecond,

  /// A unit representing microseconds.
  microsecond,

  /// A unit representing milliseconds.
  millisecond,

  /// A unit representing centiseconds.
  centisecond,

  /// A unit representing deciseconds.
  decisecond,

  /// A unit representing seconds.
  second,

  /// A unit representing decaseconds.
  decasecond,

  /// A unit representing minutes.
  minute,

  /// A unit representing hours.
  hour,

  /// A unit representing days.
  day,

  /// A unit representing weeks.
  week,

  /// A unit representing fortnights.
  fortnight,

  /// A unit representing months.
  month,

  /// A unit representing quarters.
  quarter,

  /// A unit representing years.
  year,

  /// A unit representing decades.
  decade,

  /// A unit representing centuries.
  century,
}

/// Provides convenience sets of commonly used [TimeUnit]s.
class TimeUnits {
  /// Contains all defined [TimeUnit]s.
  static const all = <TimeUnit>{
    TimeUnit.nanosecond,
    TimeUnit.microsecond,
    TimeUnit.millisecond,
    TimeUnit.centisecond,
    TimeUnit.decisecond,
    TimeUnit.second,
    TimeUnit.decasecond,
    TimeUnit.minute,
    TimeUnit.hour,
    TimeUnit.day,
    TimeUnit.week,
    TimeUnit.fortnight,
    TimeUnit.month,
    TimeUnit.quarter,
    TimeUnit.year,
    TimeUnit.decade,
    TimeUnit.century,
  };

  /// Contains commonly used [TimeUnit]s.
  static const common = <TimeUnit>{
    TimeUnit.millisecond,
    TimeUnit.second,
    TimeUnit.minute,
    TimeUnit.hour,
    TimeUnit.day,
    TimeUnit.week,
    TimeUnit.month,
    TimeUnit.year,
  };
}

/// Contains extensions for [TimeUnit].
extension TimeUnitExtensions on TimeUnit {
  static final _secondsInNanosecond = rs('0.000000001');
  static final _secondsInMicrosecond = rs('0.000001');
  static final _secondsInMillisecond = rs('0.001');
  static final _secondsInCentisecond = rs('0.01');
  static final _secondsInDecisecond = rs('0.1');
  static final _secondsInSecond = Rationals.one;
  static final _secondsInDecasecond = ri(10);
  static final _secondsInMinute = ri(60);
  static final _secondsInHour = ri(3600);
  static final _secondsInDay = ri(86400);
  static final _secondsInWeek = ri(604800);
  static final _secondsInFortnight = ri(1209600);
  static final _secondsInMonth = rs('2628002.88');
  static final _secondsInQuarter = rs('7884008.64');
  static final _secondsInYear = ri(31557600);
  static final _secondsInDecade = ri(315576000);
  static final _secondsInCentury = ri(3155760000);

  Rational get _secondCount {
    switch (this) {
      case TimeUnit.nanosecond:
        return _secondsInNanosecond;
      case TimeUnit.microsecond:
        return _secondsInMicrosecond;
      case TimeUnit.millisecond:
        return _secondsInMillisecond;
      case TimeUnit.centisecond:
        return _secondsInCentisecond;
      case TimeUnit.decisecond:
        return _secondsInDecisecond;
      case TimeUnit.second:
        return _secondsInSecond;
      case TimeUnit.decasecond:
        return _secondsInDecasecond;
      case TimeUnit.minute:
        return _secondsInMinute;
      case TimeUnit.hour:
        return _secondsInHour;
      case TimeUnit.day:
        return _secondsInDay;
      case TimeUnit.week:
        return _secondsInWeek;
      case TimeUnit.fortnight:
        return _secondsInFortnight;
      case TimeUnit.month:
        return _secondsInMonth;
      case TimeUnit.quarter:
        return _secondsInQuarter;
      case TimeUnit.year:
        return _secondsInYear;
      case TimeUnit.decade:
        return _secondsInDecade;
      case TimeUnit.century:
        return _secondsInCentury;
    }
  }

  /// Gets a localized name for this unit.
  String getName({
    required String locale,
  }) {
    switch (this) {
      case TimeUnit.nanosecond:
        return 'nanosecond';
      case TimeUnit.microsecond:
        return 'microsecond';
      case TimeUnit.millisecond:
        return 'millisecond';
      case TimeUnit.centisecond:
        return 'centisecond';
      case TimeUnit.decisecond:
        return 'decisecond';
      case TimeUnit.second:
        return 'second';
      case TimeUnit.decasecond:
        return 'decasecond';
      case TimeUnit.minute:
        return 'minute';
      case TimeUnit.hour:
        return 'hour';
      case TimeUnit.day:
        return 'day';
      case TimeUnit.week:
        return 'week';
      case TimeUnit.fortnight:
        return 'fortnight';
      case TimeUnit.month:
        return 'month';
      case TimeUnit.quarter:
        return 'quarter';
      case TimeUnit.year:
        return 'year';
      case TimeUnit.decade:
        return 'decade';
      case TimeUnit.century:
        return 'century';
    }
  }

  /// Gets a localized symbol for this unit.
  String getSymbol({
    required String locale,
  }) {
    switch (this) {
      case TimeUnit.nanosecond:
        return 'ns';
      case TimeUnit.microsecond:
        return 'μs';
      case TimeUnit.millisecond:
        return 'ms';
      case TimeUnit.centisecond:
        return 'cs';
      case TimeUnit.decisecond:
        return 'ds';
      case TimeUnit.second:
        return 's';
      case TimeUnit.decasecond:
        return 'das';
      case TimeUnit.minute:
        return 'min';
      case TimeUnit.hour:
        return 'hr';
      case TimeUnit.day:
        return 'd';
      case TimeUnit.week:
        return 'wk';
      case TimeUnit.fortnight:
        return 'fn';
      case TimeUnit.month:
        return 'mo';
      case TimeUnit.quarter:
        return 'qr';
      case TimeUnit.year:
        return 'yr';
      case TimeUnit.decade:
        return 'dec';
      case TimeUnit.century:
        return 'c';
    }
  }

  /// Gets the pattern specifier for this unit.
  String get patternSpecifier => getSymbol(
        locale: 'en',
      );
}

/// Represents a rate of change in [Time].
class TimeRate extends UnitOfMeasurementRate<Time> {
  const TimeRate._({
    required Time value,
    required Duration period,
  }) : super(
          value: value,
          period: period,
        );

  static final _defaultFormat = TimeRateFormat();

  @override
  String toString() => _defaultFormat.format(this);
}

/// Allows a [Time] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax, which you can combine with the [TimeUnit]
/// pattern specifiers as required:
///
/// | Specifier | Description |
/// |-|-|
/// | `ns` | nanosecond |
/// | `μs` | microsecond |
/// | `ms` | millisecond |
/// | `cs` | centisecond |
/// | `ds` | decisecond |
/// | `s` | second |
/// | `das` | decasecond |
/// | `min` | minute |
/// | `hr` | hour |
/// | `d` | day |
/// | `wk` | week |
/// | `fn` | fortnight |
/// | `mo` | month |
/// | `qr` | quarter |
/// | `yr` | year |
/// | `dec` | decade |
/// | `c` | century |
///
/// ```
/// final time = 42.minutes();
///
/// // '42min'
/// final result1 = TimeFormat().format(time);
///
/// // '42 minutes'
/// final result2 = TimeFormat(pattern: '0.## U').format(time);
///
/// // '2,520,000 ms'
/// final result3 = TimeFormat(pattern: '###,##0.## u:ms').format(time);
/// ```
///
/// See also:
/// * [UnitOfMeasurementFormat]
class TimeFormat extends _BaseTimeFormat<Time> {
  TimeFormat({
    String pattern = '0.##${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}',
    Set<TimeUnit> permissibleValueUnits = TimeUnits.common,
    String? locale,
  }) : super._(
          pattern: pattern,
          permissibleValueUnits: permissibleValueUnits,
          permissibleRateUnits: const <RateUnit>{},
          locale: locale,
        );

  @override
  TimeUnit getLargestUnit(Time input) => input.getLargestUnit(permissibleUnits: permissibleValueUnits);

  @override
  Rational getUnitQuantity(Time input, TimeUnit unit) => input.getUnits(unit);

  @override
  Time scaleToRateUnit(Time input, RateUnit rateUnit) => throw UnsupportedError('Cannot scale Time to a RateUnit');
}

/// Allows a [TimeRate] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax and [TimeFormat] for time-specific notes.
///
/// ```
/// final timeRate = 42.seconds().per(const Duration(minutes: 1));
///
/// // '42s/min'
/// final result1 = TimeRateFormat().format(timeRate);
///
/// // '42 seconds per minute'
/// final result2 = TimeRateFormat(pattern: "0.## U 'per' R").format(timeRate);
///
/// // '700,000 μs/s'
/// final result3 = TimeRateFormat(
///   pattern: "###,##0.## u:μs'/'r:s",
///   permissibleValueUnits: TimeUnits.all,
/// ).format(timeRate);
/// ```
///
/// See also:
/// * [UnitOfMeasurementFormat]
/// * [TimeFormat]
class TimeRateFormat extends _BaseTimeFormat<TimeRate> {
  TimeRateFormat({
    String pattern =
        "0.##${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}'/'${UnitOfMeasurementFormat.rateUnitSymbolFormatSpecifier}",
    Set<TimeUnit> permissibleValueUnits = TimeUnits.common,
    Set<RateUnit> permissibleRateUnits = RateUnits.hourOrLess,
    String? locale,
  }) : super._(
          pattern: pattern,
          permissibleValueUnits: permissibleValueUnits,
          permissibleRateUnits: permissibleRateUnits,
          locale: locale,
        );

  @override
  TimeUnit getLargestUnit(TimeRate input) => input.value.getLargestUnit(permissibleUnits: permissibleValueUnits);

  @override
  Rational getUnitQuantity(TimeRate input, TimeUnit unit) => input.value.getUnits(unit);

  @override
  TimeRate scaleToRateUnit(TimeRate input, RateUnit rateUnit) {
    final scaledPeriod = rateUnit.duration;
    final scale = di(scaledPeriod.inMicroseconds) / di(input.period.inMicroseconds);
    final result = Time.fromSeconds(input.value.seconds * scale).per(scaledPeriod);
    return result;
  }
}

abstract class _BaseTimeFormat<TInput> extends UnitOfMeasurementFormat<TInput, TimeUnit> {
  _BaseTimeFormat._({
    required String pattern,
    required this.permissibleValueUnits,
    required this.permissibleRateUnits,
    required String? locale,
  }) : super(
          pattern: pattern,
          locale: locale,
        );

  final Set<TimeUnit> permissibleValueUnits;
  final Set<RateUnit> permissibleRateUnits;

  @override
  String getPatternSpecifierFor(TimeUnit valueUnit) => valueUnit.patternSpecifier;

  @override
  Set<RateUnit> getPermissibleRateUnits() => permissibleRateUnits;

  @override
  Set<TimeUnit> getPermissibleValueUnits() => permissibleValueUnits;

  @override
  String getUnitName(TimeUnit unit, String locale) => unit.getName(locale: locale);

  @override
  String getUnitSymbol(TimeUnit unit, String locale) => unit.getSymbol(locale: locale);
}
