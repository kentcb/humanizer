import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/length_constants.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';
import 'package:meta/meta.dart';

/// A unit of measurement representing a one-dimensional length.
class Length extends UnitOfMeasurement<LengthUnit, Length> {
  /// Creates a [Length] given a [unit] and rational [value] for that unit.
  Length.fromUnits(LengthUnit unit, Rational value)
      : super.fromUnits(unit, value);

  /// Creates a [Length] representing the specified number of [nanometers].
  factory Length.fromNanometers(Rational nanometers) =>
      Length.fromUnits(LengthUnit.nanometer, nanometers);

  /// Creates a [Length] representing the specified number of [micrometers].
  factory Length.fromMicrometers(Rational micrometers) =>
      Length.fromUnits(LengthUnit.micrometer, micrometers);

  /// Creates a [Length] representing the specified number of [thous].
  factory Length.fromThous(Rational thous) =>
      Length.fromUnits(LengthUnit.thou, thous);

  /// Creates a [Length] representing the specified number of [millimeters].
  factory Length.fromMillimeters(Rational millimeters) =>
      Length.fromUnits(LengthUnit.millimeter, millimeters);

  /// Creates a [Length] representing the specified number of [centimeters].
  factory Length.fromCentimeters(Rational centimeters) =>
      Length.fromUnits(LengthUnit.centimeter, centimeters);

  /// Creates a [Length] representing the specified number of [inches].
  factory Length.fromInches(Rational inches) =>
      Length.fromUnits(LengthUnit.inch, inches);

  /// Creates a [Length] representing the specified number of [decimeters].
  factory Length.fromDecimeters(Rational decimeters) =>
      Length.fromUnits(LengthUnit.decimeter, decimeters);

  /// Creates a [Length] representing the specified number of [feet].
  factory Length.fromFeet(Rational feet) =>
      Length.fromUnits(LengthUnit.foot, feet);

  /// Creates a [Length] representing the specified number of [yards].
  factory Length.fromYards(Rational yards) =>
      Length.fromUnits(LengthUnit.yard, yards);

  /// Creates a [Length] representing the specified number of [meters].
  factory Length.fromMeters(Rational meters) =>
      Length.fromUnits(LengthUnit.meter, meters);

  /// Creates a [Length] representing the specified number of [decameters].
  factory Length.fromDecameters(Rational decameters) =>
      Length.fromUnits(LengthUnit.decameter, decameters);

  /// Creates a [Length] representing the specified number of [hectometers].
  factory Length.fromHectometers(Rational hectometers) =>
      Length.fromUnits(LengthUnit.hectometer, hectometers);

  /// Creates a [Length] representing the specified number of [kilometers].
  factory Length.fromKilometers(Rational kilometers) =>
      Length.fromUnits(LengthUnit.kilometer, kilometers);

  /// Creates a [Length] representing the specified number of [miles].
  factory Length.fromMiles(Rational miles) =>
      Length.fromUnits(LengthUnit.mile, miles);

  /// Creates a [Length] representing the specified number of [megameters].
  factory Length.fromMegameters(Rational megameters) =>
      Length.fromUnits(LengthUnit.megameter, megameters);

  /// Creates a [Length] representing the specified number of [gigameters].
  factory Length.fromGigameters(Rational gigameters) =>
      Length.fromUnits(LengthUnit.gigameter, gigameters);

  /// A [Length] of size zero.
  static final zero = Length.fromNanometers(Rationals.zero);

  static final _defaultFormat = LengthFormat();

  /// Gets the number of nanometers in this [Length], including any fractional portion.
  Rational get nanometers => getUnits(LengthUnit.nanometer);

  /// Gets the number of micrometers in this [Length], including any fractional portion.
  Rational get micrometers => getUnits(LengthUnit.micrometer);

  /// Gets the number of thous in this [Length], including any fractional portion.
  Rational get thous => getUnits(LengthUnit.thou);

  /// Gets the number of millimeters in this [Length], including any fractional portion.
  Rational get millimeters => getUnits(LengthUnit.millimeter);

  /// Gets the number of centimeters in this [Length], including any fractional portion.
  Rational get centimeters => getUnits(LengthUnit.centimeter);

  /// Gets the number of inches in this [Length], including any fractional portion.
  Rational get inches => getUnits(LengthUnit.inch);

  /// Gets the number of decimeters in this [Length], including any fractional portion.
  Rational get decimeters => getUnits(LengthUnit.decimeter);

  /// Gets the number of feet in this [Length], including any fractional portion.
  Rational get feet => getUnits(LengthUnit.foot);

  /// Gets the number of yards in this [Length], including any fractional portion.
  Rational get yards => getUnits(LengthUnit.yard);

  /// Gets the number of meters in this [Length], including any fractional portion.
  Rational get meters => getUnits(LengthUnit.meter);

  /// Gets the number of decameters in this [Length], including any fractional portion.
  Rational get decameters => getUnits(LengthUnit.decameter);

  /// Gets the number of hectometers in this [Length], including any fractional portion.
  Rational get hectometers => getUnits(LengthUnit.hectometer);

  /// Gets the number of kilometers in this [Length], including any fractional portion.
  Rational get kilometers => getUnits(LengthUnit.kilometer);

  /// Gets the number of miles in this [Length], including any fractional portion.
  Rational get miles => getUnits(LengthUnit.mile);

  /// Gets the number of megameters in this [Length], including any fractional portion.
  Rational get megameters => getUnits(LengthUnit.megameter);

  /// Gets the number of gigameters in this [Length], including any fractional portion.
  Rational get gigameters => getUnits(LengthUnit.gigameter);

  /// Creates a [LengthRate] with the specified [period] from this value.
  LengthRate per(Duration period) => LengthRate._(
        value: this,
        period: period,
      );

  @override
  Rational getUnits(LengthUnit unit) => baseValue / unit._meterCount;

  @override
  String toString() => _defaultFormat.format(this);

  @override
  @protected
  Length createValue(Rational baseValue) => Length.fromMeters(baseValue);

  @override
  @protected
  Rational getBaseValue(LengthUnit unit, Rational value) =>
      value * unit._meterCount;
}

/// Defines supported units of length.
enum LengthUnit {
  /// A unit representing nanometers.
  nanometer,

  /// A unit representing micrometers.
  micrometer,

  /// A unit representing thous.
  thou,

  /// A unit representing millimeters.
  millimeter,

  /// A unit representing centimeters.
  centimeter,

  /// A unit representing inchs.
  inch,

  /// A unit representing decimeters.
  decimeter,

  /// A unit representing foots.
  foot,

  /// A unit representing yards.
  yard,

  /// A unit representing meters.
  meter,

  /// A unit representing decameters.
  decameter,

  /// A unit representing hectometers.
  hectometer,

  /// A unit representing kilometers.
  kilometer,

  /// A unit representing miles.
  mile,

  /// A unit representing megameters.
  megameter,

  /// A unit representing gigameters.
  gigameter,
}

/// Provides convenience sets of commonly used [LengthUnit]s.
class LengthUnits {
  /// Contains all defined [LengthUnit]s.
  static const all = <LengthUnit>{
    // SI.
    LengthUnit.nanometer,
    LengthUnit.micrometer,
    LengthUnit.millimeter,
    LengthUnit.centimeter,
    LengthUnit.decimeter,
    LengthUnit.meter,
    LengthUnit.decameter,
    LengthUnit.hectometer,
    LengthUnit.kilometer,
    LengthUnit.megameter,
    LengthUnit.gigameter,

    // Imperial.
    LengthUnit.thou,
    LengthUnit.inch,
    LengthUnit.foot,
    LengthUnit.yard,
    LengthUnit.mile,
  };

  /// Contains International System of Units (SI) [LengthUnit]s.
  static const si = <LengthUnit>{
    LengthUnit.nanometer,
    LengthUnit.micrometer,
    LengthUnit.millimeter,
    LengthUnit.centimeter,
    LengthUnit.decimeter,
    LengthUnit.meter,
    LengthUnit.decameter,
    LengthUnit.hectometer,
    LengthUnit.kilometer,
    LengthUnit.megameter,
    LengthUnit.gigameter,
  };

  /// Contains imperial [LengthUnit]s.
  static const imperial = <LengthUnit>{
    LengthUnit.thou,
    LengthUnit.inch,
    LengthUnit.foot,
    LengthUnit.yard,
    LengthUnit.mile,
  };

  /// Contains commonly used International System of Units (SI) [LengthUnit]s.
  static const commonSi = <LengthUnit>{
    LengthUnit.nanometer,
    LengthUnit.millimeter,
    LengthUnit.centimeter,
    LengthUnit.meter,
    LengthUnit.kilometer,
  };

  /// Contains commonly used imperial [LengthUnit]s.
  static const commonImperial = <LengthUnit>{
    LengthUnit.inch,
    LengthUnit.foot,
    LengthUnit.yard,
    LengthUnit.mile,
  };
}

/// Contains extensions for [LengthUnit].
extension LengthUnitExtensions on LengthUnit {
  Rational get _meterCount {
    switch (this) {
      // SI.
      case LengthUnit.nanometer:
        return metersInNanometer;
      case LengthUnit.micrometer:
        return metersInMicrometer;
      case LengthUnit.millimeter:
        return metersInMillimeter;
      case LengthUnit.centimeter:
        return metersInCentimeter;
      case LengthUnit.decimeter:
        return metersInDecimeter;
      case LengthUnit.meter:
        return metersInMeter;
      case LengthUnit.decameter:
        return metersInDecameter;
      case LengthUnit.hectometer:
        return metersInHectometer;
      case LengthUnit.kilometer:
        return metersInKilometer;
      case LengthUnit.megameter:
        return metersInMegameter;
      case LengthUnit.gigameter:
        return metersInGigameter;

      // Imperial.
      case LengthUnit.thou:
        return metersInThou;
      case LengthUnit.inch:
        return metersInInch;
      case LengthUnit.foot:
        return metersInFoot;
      case LengthUnit.yard:
        return metersInYard;
      case LengthUnit.mile:
        return metersInMile;
    }
  }

  /// Gets a localized name for this unit.
  String getName({
    required String locale,
  }) {
    switch (this) {
      // SI.
      case LengthUnit.nanometer:
        return 'nanometer';
      case LengthUnit.micrometer:
        return 'micrometer';
      case LengthUnit.millimeter:
        return 'millimeter';
      case LengthUnit.centimeter:
        return 'centimeter';
      case LengthUnit.decimeter:
        return 'decimeter';
      case LengthUnit.meter:
        return 'meter';
      case LengthUnit.decameter:
        return 'decameter';
      case LengthUnit.hectometer:
        return 'hectometer';
      case LengthUnit.kilometer:
        return 'kilometer';
      case LengthUnit.megameter:
        return 'megameter';
      case LengthUnit.gigameter:
        return 'gigameter';

      // Imperial.
      case LengthUnit.thou:
        return 'thou';
      case LengthUnit.inch:
        return 'inch';
      case LengthUnit.foot:
        return 'foot';
      case LengthUnit.yard:
        return 'yard';
      case LengthUnit.mile:
        return 'mile';
    }
  }

  /// Gets a localized symbol for this unit.
  String getSymbol({
    required String locale,
  }) {
    switch (this) {
      // SI.
      case LengthUnit.nanometer:
        return 'nm';
      case LengthUnit.micrometer:
        return 'μm';
      case LengthUnit.millimeter:
        return 'mm';
      case LengthUnit.centimeter:
        return 'cm';
      case LengthUnit.decimeter:
        return 'dm';
      case LengthUnit.meter:
        return 'm';
      case LengthUnit.decameter:
        return 'dam';
      case LengthUnit.hectometer:
        return 'hm';
      case LengthUnit.kilometer:
        return 'km';
      case LengthUnit.megameter:
        return 'Mm';
      case LengthUnit.gigameter:
        return 'Gm';

      // Imperial.
      case LengthUnit.thou:
        return 'thou';
      case LengthUnit.inch:
        return 'in';
      case LengthUnit.foot:
        return 'ft';
      case LengthUnit.yard:
        return 'yd';
      case LengthUnit.mile:
        return 'mi';
    }
  }

  /// Gets the pattern specifier for this unit.
  String get patternSpecifier => getSymbol(
        locale: 'en',
      );
}

/// Represents a rate of change in [Length] (a.k.a. a speed).
class LengthRate extends UnitOfMeasurementRate<Length> {
  const LengthRate._({
    required Length value,
    required Duration period,
  }) : super(
          value: value,
          period: period,
        );

  static final _defaultFormat = LengthRateFormat();

  @override
  String toString() => _defaultFormat.format(this);
}

/// Allows a [Length] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax, which you can combine with the [LengthUnit]
/// pattern specifiers as required:
///
/// | | Unit | Specifier |
/// |:-|:-|:-|
/// | **S.I.** | nanometer | `nm` |
/// | | micrometer | `μm` |
/// | | millimeter | `mm` |
/// | | centimeter | `cm` |
/// | | decimeter | `dm` |
/// | | meter | `m` |
/// | | decameter | `dam` |
/// | | hectometer | `hm` |
/// | | kilometer | `km` |
/// | | megameter | `Mm` |
/// | | gigameter | `Gm` |
/// | **Imperial** | thou | `thou` |
/// | | inch | `in` |
/// | | foot | `ft` |
/// | | yard | `yd` |
/// | | mile | `mi` |
///
/// ```
/// final length = 42.kilometers();
///
/// // '42km'
/// final result1 = LengthFormat().format(length);
///
/// // '42 kilometers'
/// final result2 = LengthFormat(pattern: '0.## U').format(length);
///
/// // '42,000 m'
/// final result3 = LengthFormat(pattern: '###,##0.## u:m').format(length);
/// ```
///
/// See also:
/// * [UnitOfMeasurementFormat]
class LengthFormat extends _BaseLengthFormat<Length> {
  LengthFormat({
    String pattern =
        '0.##${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}',
    Set<LengthUnit> permissibleValueUnits = LengthUnits.commonSi,
    String? locale,
  }) : super._(
          pattern: pattern,
          permissibleValueUnits: permissibleValueUnits,
          permissibleRateUnits: const <RateUnit>{},
          locale: locale,
        );

  @override
  LengthUnit getLargestUnit(Length input) =>
      input.getLargestUnit(permissibleUnits: permissibleValueUnits);

  @override
  Rational getUnitQuantity(Length input, LengthUnit unit) =>
      input.getUnits(unit);

  @override
  Length scaleToRateUnit(Length input, RateUnit rateUnit) =>
      throw UnsupportedError('Cannot scale Length to a RateUnit');
}

/// Allows a [LengthRate] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax and [LengthFormat] for length-specific notes.
///
/// ```
/// final lengthRate = 42.meters().per(const Duration(seconds: 1));
///
/// // '42m/s'
/// final result1 = LengthRateFormat().format(lengthRate);
///
/// // '42 meters per second'
/// final result2 = LengthRateFormat(pattern: "0.## U 'per' R").format(lengthRate);
///
/// // '8,267.72 ft/min'
/// final result3 = LengthRateFormat(
///   pattern: "###,##0.## u:ft'/'r:min",
///   permissibleValueUnits: LengthUnits.imperial,
/// ).format(lengthRate);
/// ```
///
/// See also:
/// * [UnitOfMeasurementFormat]
/// * [LengthFormat]
class LengthRateFormat extends _BaseLengthFormat<LengthRate> {
  LengthRateFormat({
    String pattern =
        "0.##${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}'/'${UnitOfMeasurementFormat.rateUnitSymbolFormatSpecifier}",
    Set<LengthUnit> permissibleValueUnits = LengthUnits.commonSi,
    Set<RateUnit> permissibleRateUnits = RateUnits.hourOrLess,
    String? locale,
  }) : super._(
          pattern: pattern,
          permissibleValueUnits: permissibleValueUnits,
          permissibleRateUnits: permissibleRateUnits,
          locale: locale,
        );

  @override
  LengthUnit getLargestUnit(LengthRate input) =>
      input.value.getLargestUnit(permissibleUnits: permissibleValueUnits);

  @override
  Rational getUnitQuantity(LengthRate input, LengthUnit unit) =>
      input.value.getUnits(unit);

  @override
  LengthRate scaleToRateUnit(LengthRate input, RateUnit rateUnit) {
    final scaledPeriod = rateUnit.duration;
    final scale = Rational.fromInt(scaledPeriod.inMicroseconds) /
        Rational.fromInt(input.period.inMicroseconds);
    final result =
        Length.fromMeters(input.value.meters * scale).per(scaledPeriod);
    return result;
  }
}

abstract class _BaseLengthFormat<TInput>
    extends UnitOfMeasurementFormat<TInput, LengthUnit> {
  _BaseLengthFormat._({
    required String pattern,
    required this.permissibleValueUnits,
    required this.permissibleRateUnits,
    required String? locale,
  }) : super(
          pattern: pattern,
          locale: locale,
        );

  final Set<LengthUnit> permissibleValueUnits;
  final Set<RateUnit> permissibleRateUnits;

  @override
  String getPatternSpecifierFor(LengthUnit valueUnit) =>
      valueUnit.patternSpecifier;

  @override
  Set<RateUnit> getPermissibleRateUnits() => permissibleRateUnits;

  @override
  Set<LengthUnit> getPermissibleValueUnits() => permissibleValueUnits;

  @override
  String getUnitName(LengthUnit unit, String locale) =>
      unit.getName(locale: locale);

  @override
  String getUnitSymbol(LengthUnit unit, String locale) =>
      unit.getSymbol(locale: locale);
}
