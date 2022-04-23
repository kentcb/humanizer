import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';
import 'package:humanizer/src/units_of_measurement/temperature_constants.dart';
import 'package:meta/meta.dart';

/// A unit of measurement representing a temperature.
class Temperature extends UnitOfMeasurement<TemperatureUnit, Temperature> {
  /// Creates a [Temperature] given a [unit] and rational [value] for that unit.
  Temperature.fromUnits(TemperatureUnit unit, Rational value)
      : super.fromUnits(unit, value);

  /// Creates a [Temperature] representing the specified number of [nanokelvins].
  factory Temperature.fromNanokelvins(Rational nanokelvins) =>
      Temperature.fromUnits(TemperatureUnit.nanokelvin, nanokelvins);

  /// Creates a [Temperature] representing the specified number of [microkelvins].
  factory Temperature.fromMicrokelvins(Rational microkelvins) =>
      Temperature.fromUnits(TemperatureUnit.microkelvin, microkelvins);

  /// Creates a [Temperature] representing the specified number of [millikelvins].
  factory Temperature.fromMillikelvins(Rational millikelvins) =>
      Temperature.fromUnits(TemperatureUnit.millikelvin, millikelvins);

  /// Creates a [Temperature] representing the specified number of [centikelvins].
  factory Temperature.fromCentikelvins(Rational centikelvins) =>
      Temperature.fromUnits(TemperatureUnit.centikelvin, centikelvins);

  /// Creates a [Temperature] representing the specified number of [decikelvins].
  factory Temperature.fromDecikelvins(Rational decikelvins) =>
      Temperature.fromUnits(TemperatureUnit.decikelvin, decikelvins);

  /// Creates a [Temperature] representing the specified number of [kelvins].
  factory Temperature.fromKelvins(Rational kelvins) =>
      Temperature.fromUnits(TemperatureUnit.kelvin, kelvins);

  /// Creates a [Temperature] representing the specified number of [celsius].
  factory Temperature.fromCelsius(Rational celsius) =>
      Temperature.fromUnits(TemperatureUnit.celsius, celsius);

  /// Creates a [Temperature] representing the specified number of [fahrenheit].
  factory Temperature.fromFahrenheit(Rational fahrenheit) =>
      Temperature.fromUnits(TemperatureUnit.fahrenheit, fahrenheit);

  /// A [Temperature] of zero kelvins.
  static final zero = Temperature.fromNanokelvins(Rationals.zero);

  static final _defaultFormat = TemperatureFormat();

  static final _kelvinToCelsiusBaseline = Rational.fromInt(27315, 100);
  static final _kelvinToFahrenheitFactor = Rational.fromInt(18, 10);
  static final _kelvinToFahrenheitOffset = Rational.fromInt(32);
  static final _fahrenheitToKelvinFactor =
      Rational.fromInt(5) / Rational.fromInt(9);

  /// Gets the number of nanokelvins in this [Temperature], including the fractional portion.
  Rational get nanokelvins => getUnits(TemperatureUnit.nanokelvin);

  /// Gets the number of microkelvins in this [Temperature], including the fractional portion.
  Rational get microkelvins => getUnits(TemperatureUnit.microkelvin);

  /// Gets the number of millikelvins in this [Temperature], including the fractional portion.
  Rational get millikelvins => getUnits(TemperatureUnit.millikelvin);

  /// Gets the number of centikelvins in this [Temperature], including the fractional portion.
  Rational get centikelvins => getUnits(TemperatureUnit.centikelvin);

  /// Gets the number of decikelvins in this [Temperature], including the fractional portion.
  Rational get decikelvins => getUnits(TemperatureUnit.decikelvin);

  /// Gets the number of kelvins in this [Temperature], including the fractional portion.
  Rational get kelvins => getUnits(TemperatureUnit.kelvin);

  /// Gets the number of celsius in this [Temperature], including the fractional portion.
  Rational get celsius => getUnits(TemperatureUnit.celsius);

  /// Gets the number of fahrenheit in this [Temperature], including the fractional portion.
  Rational get fahrenheit => getUnits(TemperatureUnit.fahrenheit);

  /// Creates a [TemperatureRate] with the specified [period] from this value.
  TemperatureRate per(Duration period) => TemperatureRate._(
        value: this,
        period: period,
      );

  @override
  String toString() => _defaultFormat.format(this);

  @override
  Rational getUnits(TemperatureUnit unit) {
    switch (unit) {
      case TemperatureUnit.celsius:
        // C = k - 273.15
        return baseValue - _kelvinToCelsiusBaseline;
      case TemperatureUnit.fahrenheit:
        // F = (k - 273.15) x (9/5) + 32
        return (baseValue - _kelvinToCelsiusBaseline) *
                _kelvinToFahrenheitFactor +
            _kelvinToFahrenheitOffset;
      default:
        return baseValue / unit._kelvinCount;
    }
  }

  @override
  @protected
  Temperature createValue(Rational baseValue) =>
      Temperature.fromKelvins(baseValue);

  @override
  @protected
  Rational getBaseValue(TemperatureUnit unit, Rational value) {
    switch (unit) {
      case TemperatureUnit.celsius:
        // k = C + 273.15
        return value + _kelvinToCelsiusBaseline;
      case TemperatureUnit.fahrenheit:
        // k = (F - 32) x (5/9) + 273.15
        return (value - _kelvinToFahrenheitOffset) * _fahrenheitToKelvinFactor +
            _kelvinToCelsiusBaseline;
      default:
        return value * unit._kelvinCount;
    }
  }
}

/// Defines supported units of temperature.
enum TemperatureUnit {
  /// A unit representing nanokelvins.
  nanokelvin,

  /// A unit representing microkelvins.
  microkelvin,

  /// A unit representing millikelvins.
  millikelvin,

  /// A unit representing centikelvins.
  centikelvin,

  /// A unit representing decikelvins.
  decikelvin,

  /// A unit representing kelvins.
  kelvin,

  /// A unit representing celsius.
  celsius,

  /// A unit representing fahrenheit.
  fahrenheit,
}

/// Provides convenience sets of commonly used [TemperatureUnit]s.
class TemperatureUnits {
  /// Contains all defined [TemperatureUnit]s.
  static const all = <TemperatureUnit>{
    TemperatureUnit.nanokelvin,
    TemperatureUnit.microkelvin,
    TemperatureUnit.millikelvin,
    TemperatureUnit.centikelvin,
    TemperatureUnit.decikelvin,
    TemperatureUnit.kelvin,
    TemperatureUnit.celsius,
    TemperatureUnit.fahrenheit,
  };

  /// Contains kelvin [TemperatureUnit]s.
  static const kelvin = <TemperatureUnit>{
    TemperatureUnit.nanokelvin,
    TemperatureUnit.microkelvin,
    TemperatureUnit.millikelvin,
    TemperatureUnit.centikelvin,
    TemperatureUnit.decikelvin,
    TemperatureUnit.kelvin,
  };

  /// Contains only the [TemperatureUnit.celsius] [TemperatureUnit].
  static const celsius = <TemperatureUnit>{
    TemperatureUnit.celsius,
  };

  /// Contains only the [TemperatureUnit.fahrenheit] [TemperatureUnit].
  static const fahrenheit = <TemperatureUnit>{
    TemperatureUnit.fahrenheit,
  };
}

/// Contains extensions for [TemperatureUnit].
extension TemperatureUnitExtensions on TemperatureUnit {
  Rational get _kelvinCount {
    switch (this) {
      case TemperatureUnit.nanokelvin:
        return kelvinsInNanokelvin;
      case TemperatureUnit.microkelvin:
        return kelvinsInMicrokelvin;
      case TemperatureUnit.millikelvin:
        return kelvinsInMillikelvin;
      case TemperatureUnit.centikelvin:
        return kelvinsInCentikelvin;
      case TemperatureUnit.decikelvin:
        return kelvinsInDecikelvin;
      case TemperatureUnit.kelvin:
        return kelvinsInKelvin;
      default:
        throw UnsupportedError('Cannot determine kelvins in $this');
    }
  }

  /// Gets a localized name for this unit.
  String getName({
    required String locale,
  }) {
    switch (this) {
      // SI.
      case TemperatureUnit.nanokelvin:
        return 'nanokelvin';
      case TemperatureUnit.microkelvin:
        return 'microkelvin';
      case TemperatureUnit.millikelvin:
        return 'millikelvin';
      case TemperatureUnit.centikelvin:
        return 'centikelvin';
      case TemperatureUnit.decikelvin:
        return 'decikelvin';
      case TemperatureUnit.kelvin:
        return 'kelvin';

      // Celsius.
      case TemperatureUnit.celsius:
        return 'Celsius';

      // Fahrenheit.
      case TemperatureUnit.fahrenheit:
        return 'Fahrenheit';
    }
  }

  /// Gets a localized symbol for this unit.
  String getSymbol({
    required String locale,
  }) {
    switch (this) {
      // SI.
      case TemperatureUnit.nanokelvin:
        return 'nK';
      case TemperatureUnit.microkelvin:
        return 'μK';
      case TemperatureUnit.millikelvin:
        return 'mK';
      case TemperatureUnit.centikelvin:
        return 'cK';
      case TemperatureUnit.decikelvin:
        return 'dK';
      case TemperatureUnit.kelvin:
        return 'K';

      // Celsius.
      case TemperatureUnit.celsius:
        return '°C';

      // Fahrenheit.
      case TemperatureUnit.fahrenheit:
        return '°F';
    }
  }

  /// Gets the pattern specifier for this unit.
  String get patternSpecifier => getSymbol(
        locale: 'en',
      );
}

/// Represents a rate of change in [Temperature].
class TemperatureRate extends UnitOfMeasurementRate<Temperature> {
  const TemperatureRate._({
    required Temperature value,
    required Duration period,
  }) : super(
          value: value,
          period: period,
        );

  static final _defaultFormat = TemperatureRateFormat();

  @override
  String toString() => _defaultFormat.format(this);
}

/// Allows a [Length] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax, which you can combine with the
/// [TemperatureUnit] pattern specifiers as required:
///
/// | | Unit | Specifier |
/// |:-|:-|:-|
/// | **S.I.** | nanokelvin | `nK` |
/// | | microkelvin | `μK` |
/// | | millikelvin | `mK` |
/// | | centikelvin | `cK` |
/// | | decikelvin | `dK` |
/// | | kelvin | `K` |
/// | **Celsius** | Degrees Celsius | `°C` |
/// | **Fahrenheit** | Degrees Fahrenheit | `°F` |
///
/// ```
/// final temperature = 42.celsius();
///
/// // '42°C'
/// final result1 = TemperatureFormat().format(temperature);
///
/// // '42 Celsius'
/// final result2 = TemperatureFormat(pattern: '0.## U').format(temperature);
///
/// // '107.6 °F'
/// final result3 = TemperatureFormat(
///   pattern: '##0.## u:°F',
///   permissibleValueUnits: TemperatureUnits.all,
/// ).format(temperature);
/// ```
///
/// See also:
/// * [UnitOfMeasurementFormat]
class TemperatureFormat extends _BaseTemperatureFormat<Temperature> {
  TemperatureFormat({
    String pattern =
        '0.##${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}',
    Set<TemperatureUnit> permissibleValueUnits = TemperatureUnits.celsius,
    String? locale,
  }) : super._(
          pattern: pattern,
          permissibleValueUnits: permissibleValueUnits,
          permissibleRateUnits: const <RateUnit>{},
          locale: locale,
        );

  @override
  TemperatureUnit getLargestUnit(Temperature input) =>
      input.getLargestUnit(permissibleUnits: permissibleValueUnits);

  @override
  Rational getUnitQuantity(Temperature input, TemperatureUnit unit) =>
      input.getUnits(unit);

  @override
  Temperature scaleToRateUnit(Temperature input, RateUnit rateUnit) =>
      throw UnsupportedError('Cannot scale Temperature to a RateUnit');
}

/// Allows a [TemperatureRate] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax and [TemperatureFormat] for
/// temperature-specific notes.
///
/// ```
/// final temperatureRate = 42.kelvins().per(const Duration(minutes: 1));
///
/// // '2246.85°C/hr'
/// final result1 = TemperatureRateFormat().format(temperatureRate);
///
/// // '2246.85 Celsius per hour'
/// final result2 = TemperatureRateFormat(pattern: "0.## U 'per' R").format(temperatureRate);
///
/// // '42,000,000 μK/min'
/// final result3 = TemperatureRateFormat(
///   pattern: "###,##0.## u:μK'/'r:min",
///   permissibleValueUnits: TemperatureUnits.kelvin,
/// ).format(temperatureRate);
/// ```
///
/// See also:
/// * [UnitOfMeasurementFormat]
/// * [TemperatureFormat]
class TemperatureRateFormat extends _BaseTemperatureFormat<TemperatureRate> {
  TemperatureRateFormat({
    String pattern =
        "0.##${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}'/'${UnitOfMeasurementFormat.rateUnitSymbolFormatSpecifier}",
    Set<TemperatureUnit> permissibleValueUnits = TemperatureUnits.celsius,
    Set<RateUnit> permissibleRateUnits = RateUnits.hourOrLess,
    String? locale,
  }) : super._(
          pattern: pattern,
          permissibleValueUnits: permissibleValueUnits,
          permissibleRateUnits: permissibleRateUnits,
          locale: locale,
        );

  @override
  TemperatureUnit getLargestUnit(TemperatureRate input) =>
      input.value.getLargestUnit(permissibleUnits: permissibleValueUnits);

  @override
  Rational getUnitQuantity(TemperatureRate input, TemperatureUnit unit) =>
      input.value.getUnits(unit);

  @override
  TemperatureRate scaleToRateUnit(TemperatureRate input, RateUnit rateUnit) {
    final scaledPeriod = rateUnit.duration;
    final scale = Rational.fromInt(scaledPeriod.inMicroseconds) /
        Rational.fromInt(input.period.inMicroseconds);
    final result =
        Temperature.fromKelvins(input.value.kelvins * scale).per(scaledPeriod);
    return result;
  }
}

abstract class _BaseTemperatureFormat<TInput>
    extends UnitOfMeasurementFormat<TInput, TemperatureUnit> {
  _BaseTemperatureFormat._({
    required String pattern,
    required this.permissibleValueUnits,
    required this.permissibleRateUnits,
    required String? locale,
  }) : super(
          pattern: pattern,
          locale: locale,
        );

  final Set<TemperatureUnit> permissibleValueUnits;
  final Set<RateUnit> permissibleRateUnits;

  @override
  String getPatternSpecifierFor(TemperatureUnit valueUnit) =>
      valueUnit.patternSpecifier;

  @override
  Set<RateUnit> getPermissibleRateUnits() => permissibleRateUnits;

  @override
  Set<TemperatureUnit> getPermissibleValueUnits() => permissibleValueUnits;

  @override
  String getUnitName(TemperatureUnit unit, String locale) =>
      unit.getName(locale: locale);

  @override
  String getUnitSymbol(TemperatureUnit unit, String locale) =>
      unit.getSymbol(locale: locale);
}
