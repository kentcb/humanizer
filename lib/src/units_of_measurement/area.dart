import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/area_constants.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';
import 'package:meta/meta.dart';

/// A unit of measurement representing a two-dimensional area.
class Area extends UnitOfMeasurement<AreaUnit, Area> {
  /// Creates an [Area] given a [unit] and decimal [value] for that unit.
  Area.fromUnits(AreaUnit unit, Rational value) : super.fromUnits(unit, value);

  /// Creates an [Area] representing the specified number of [squareNanometers].
  factory Area.fromSquareNanometers(Rational squareNanometers) =>
      Area.fromUnits(AreaUnit.squareNanometer, squareNanometers);

  /// Creates an [Area] representing the specified number of [squareMicrometers].
  factory Area.fromSquareMicrometers(Rational squareMicrometers) =>
      Area.fromUnits(AreaUnit.squareMicrometer, squareMicrometers);

  /// Creates an [Area] representing the specified number of [squareThous].
  factory Area.fromSquareThous(Rational squareThous) => Area.fromUnits(AreaUnit.squareThou, squareThous);

  /// Creates an [Area] representing the specified number of [squareMillimeters].
  factory Area.fromSquareMillimeters(Rational squareMillimeters) =>
      Area.fromUnits(AreaUnit.squareMillimeter, squareMillimeters);

  /// Creates an [Area] representing the specified number of [squareCentimeters].
  factory Area.fromSquareCentimeters(Rational squareCentimeters) =>
      Area.fromUnits(AreaUnit.squareCentimeter, squareCentimeters);

  /// Creates an [Area] representing the specified number of [squareInches].
  factory Area.fromSquareInches(Rational squareInches) => Area.fromUnits(AreaUnit.squareInch, squareInches);

  /// Creates an [Area] representing the specified number of [squareDecimeters].
  factory Area.fromSquareDecimeters(Rational squareDecimeters) =>
      Area.fromUnits(AreaUnit.squareDecimeter, squareDecimeters);

  /// Creates an [Area] representing the specified number of [squareFeet].
  factory Area.fromSquareFeet(Rational squareFeet) => Area.fromUnits(AreaUnit.squareFoot, squareFeet);

  /// Creates an [Area] representing the specified number of [squareYards].
  factory Area.fromSquareYards(Rational squareYards) => Area.fromUnits(AreaUnit.squareYard, squareYards);

  /// Creates an [Area] representing the specified number of [squareMeters].
  factory Area.fromSquareMeters(Rational squareMeters) => Area.fromUnits(AreaUnit.squareMeter, squareMeters);

  /// Creates an [Area] representing the specified number of [squareDecameters].
  factory Area.fromSquareDecameters(Rational squareDecameters) =>
      Area.fromUnits(AreaUnit.squareDecameter, squareDecameters);

  /// Creates an [Area] representing the specified number of [acres].
  factory Area.fromAcres(Rational acres) => Area.fromUnits(AreaUnit.acre, acres);

  /// Creates an [Area] representing the specified number of [hectares].
  factory Area.fromHectares(Rational hectares) => Area.fromUnits(AreaUnit.hectare, hectares);

  /// Creates an [Area] representing the specified number of [squareKilometers].
  factory Area.fromSquareKilometers(Rational squareKilometers) =>
      Area.fromUnits(AreaUnit.squareKilometer, squareKilometers);

  /// Creates an [Area] representing the specified number of [squareMiles].
  factory Area.fromSquareMiles(Rational squareMiles) => Area.fromUnits(AreaUnit.squareMile, squareMiles);

  /// Creates an [Area] representing the specified number of [squareMegameters].
  factory Area.fromSquareMegameters(Rational squareMegameters) =>
      Area.fromUnits(AreaUnit.squareMegameter, squareMegameters);

  /// Creates an [Area] representing the specified number of [squareGigameters].
  factory Area.fromSquareGigameters(Rational squareGigameters) =>
      Area.fromUnits(AreaUnit.squareGigameter, squareGigameters);

  /// An [Area] of size zero.
  static final zero = Area.fromSquareNanometers(Rationals.zero);

  static final _defaultFormat = AreaFormat();

  /// Gets the number of square nanometers in this [Area], including any fractional portion.
  Rational get squareNanometers => getUnits(AreaUnit.squareNanometer);

  /// Gets the number of square micrometers in this [Area], including any fractional portion.
  Rational get squareMicrometers => getUnits(AreaUnit.squareMicrometer);

  /// Gets the number of square thous in this [Area], including any fractional portion.
  Rational get squareThous => getUnits(AreaUnit.squareThou);

  /// Gets the number of square millimeters in this [Area], including any fractional portion.
  Rational get squareMillimeters => getUnits(AreaUnit.squareMillimeter);

  /// Gets the number of square centimeters in this [Area], including any fractional portion.
  Rational get squareCentimeters => getUnits(AreaUnit.squareCentimeter);

  /// Gets the number of square inches in this [Area], including any fractional portion.
  Rational get squareInches => getUnits(AreaUnit.squareInch);

  /// Gets the number of square decimeters in this [Area], including any fractional portion.
  Rational get squareDecimeters => getUnits(AreaUnit.squareDecimeter);

  /// Gets the number of square feet in this [Area], including any fractional portion.
  Rational get squareFeet => getUnits(AreaUnit.squareFoot);

  /// Gets the number of square yards in this [Area], including any fractional portion.
  Rational get squareYards => getUnits(AreaUnit.squareYard);

  /// Gets the number of square meters in this [Area], including any fractional portion.
  Rational get squareMeters => getUnits(AreaUnit.squareMeter);

  /// Gets the number of square decameters in this [Area], including any fractional portion.
  Rational get squareDecameters => getUnits(AreaUnit.squareDecameter);

  /// Gets the number of acres in this [Area], including any fractional portion.
  Rational get acres => getUnits(AreaUnit.acre);

  /// Gets the number of hectares in this [Area], including any fractional portion.
  Rational get hectares => getUnits(AreaUnit.hectare);

  /// Gets the number of square kilometers in this [Area], including any fractional portion.
  Rational get squareKilometers => getUnits(AreaUnit.squareKilometer);

  /// Gets the number of square miles in this [Area], including any fractional portion.
  Rational get squareMiles => getUnits(AreaUnit.squareMile);

  /// Gets the number of square megameters in this [Area], including any fractional portion.
  Rational get squareMegameters => getUnits(AreaUnit.squareMegameter);

  /// Gets the number of square gigameters in this [Area], including any fractional portion.
  Rational get squareGigameters => getUnits(AreaUnit.squareGigameter);

  /// Creates an [AreaRate] with the specified [period] from this value.
  AreaRate per(Duration period) => AreaRate._(
        value: this,
        period: period,
      );

  @override
  Rational getUnits(AreaUnit unit) => baseValue / unit._squareMeterCount;

  @override
  String toString() => _defaultFormat.format(this);

  @override
  @protected
  Area createValue(Rational baseValue) => Area.fromSquareNanometers(baseValue);

  @override
  @protected
  Rational getBaseValue(AreaUnit unit, Rational value) => value * unit._squareMeterCount;
}

/// Defines supported units of area.
enum AreaUnit {
  /// A unit representing square nanometers.
  squareNanometer,

  /// A unit representing square micrometers.
  squareMicrometer,

  /// A unit representing square thous.
  squareThou,

  /// A unit representing square millimeters.
  squareMillimeter,

  /// A unit representing square centimeters.
  squareCentimeter,

  /// A unit representing square inches.
  squareInch,

  /// A unit representing square decimeters.
  squareDecimeter,

  /// A unit representing square feet.
  squareFoot,

  /// A unit representing square yards.
  squareYard,

  /// A unit representing square meters.
  squareMeter,

  /// A unit representing square decameters.
  squareDecameter,

  /// A unit representing acres.
  acre,

  /// A unit representing hectares, which is the common name for a square hectometer.
  hectare,

  /// A unit representing square kilometers.
  squareKilometer,

  /// A unit representing square miles.
  squareMile,

  /// A unit representing square megameters.
  squareMegameter,

  /// A unit representing square gigameters.
  squareGigameter,
}

/// Provides convenience sets of commonly used [AreaUnit]s.
class AreaUnits {
  /// Contains all defined [AreaUnit]s.
  static const all = <AreaUnit>{
    // SI.
    AreaUnit.squareNanometer,
    AreaUnit.squareMicrometer,
    AreaUnit.squareMillimeter,
    AreaUnit.squareCentimeter,
    AreaUnit.squareDecimeter,
    AreaUnit.squareMeter,
    AreaUnit.squareDecameter,
    AreaUnit.hectare,
    AreaUnit.squareKilometer,
    AreaUnit.squareMegameter,
    AreaUnit.squareGigameter,

    // Imperial.
    AreaUnit.squareThou,
    AreaUnit.squareInch,
    AreaUnit.squareFoot,
    AreaUnit.squareYard,
    AreaUnit.acre,
    AreaUnit.squareMile,
  };

  /// Contains International System of Units (SI) [AreaUnit]s.
  static const si = <AreaUnit>{
    AreaUnit.squareNanometer,
    AreaUnit.squareMicrometer,
    AreaUnit.squareMillimeter,
    AreaUnit.squareCentimeter,
    AreaUnit.squareDecimeter,
    AreaUnit.squareMeter,
    AreaUnit.squareDecameter,
    AreaUnit.hectare,
    AreaUnit.squareKilometer,
    AreaUnit.squareMegameter,
    AreaUnit.squareGigameter,
  };

  /// Contains imperial [AreaUnit]s.
  static const imperial = <AreaUnit>{
    AreaUnit.squareThou,
    AreaUnit.squareInch,
    AreaUnit.squareFoot,
    AreaUnit.squareYard,
    AreaUnit.acre,
    AreaUnit.squareMile,
  };

  /// Contains commonly used International System of Units (SI) [AreaUnit]s.
  static const commonSi = <AreaUnit>{
    AreaUnit.squareNanometer,
    AreaUnit.squareMillimeter,
    AreaUnit.squareCentimeter,
    AreaUnit.squareMeter,
    AreaUnit.hectare,
    AreaUnit.squareKilometer,
  };

  /// Contains commonly used imperial [AreaUnit]s.
  static const commonImperial = <AreaUnit>{
    AreaUnit.squareInch,
    AreaUnit.squareFoot,
    AreaUnit.squareYard,
    AreaUnit.acre,
    AreaUnit.squareMile,
  };
}

/// Contains extensions for [AreaUnit].
extension AreaUnitExtensions on AreaUnit {
  Rational get _squareMeterCount {
    switch (this) {
      // SI.
      case AreaUnit.squareNanometer:
        return squareMetersInSquareNanometer;
      case AreaUnit.squareMicrometer:
        return squareMetersInSquareMicrometer;
      case AreaUnit.squareMillimeter:
        return squareMetersInSquareMillimeter;
      case AreaUnit.squareCentimeter:
        return squareMetersInSquareCentimeter;
      case AreaUnit.squareDecimeter:
        return squareMetersInSquareDecimeter;
      case AreaUnit.squareMeter:
        return squareMetersInSquareMeter;
      case AreaUnit.squareDecameter:
        return squareMetersInSquareDecameter;
      case AreaUnit.hectare:
        return squareMetersInHectare;
      case AreaUnit.squareKilometer:
        return squareMetersInSquareKilometer;
      case AreaUnit.squareMegameter:
        return squareMetersInSquareMegameter;
      case AreaUnit.squareGigameter:
        return squareMetersInSquareGigameter;

      // Imperial.
      case AreaUnit.squareThou:
        return squareMetersInSquareThou;
      case AreaUnit.squareInch:
        return squareMetersInSquareInch;
      case AreaUnit.squareFoot:
        return squareMetersInSquareFoot;
      case AreaUnit.squareYard:
        return squareMetersInSquareYard;
      case AreaUnit.acre:
        return squareMetersInAcre;
      case AreaUnit.squareMile:
        return squareMetersInSquareMile;
    }
  }

  /// Gets a localized name for this unit.
  String getName({
    required String locale,
  }) {
    switch (this) {
      // SI.
      case AreaUnit.squareNanometer:
        return 'square nanometer';
      case AreaUnit.squareMicrometer:
        return 'square micrometer';
      case AreaUnit.squareMillimeter:
        return 'square millimeter';
      case AreaUnit.squareCentimeter:
        return 'square centimeter';
      case AreaUnit.squareDecimeter:
        return 'square decimeter';
      case AreaUnit.squareMeter:
        return 'square meter';
      case AreaUnit.squareDecameter:
        return 'square decameter';
      case AreaUnit.hectare:
        return 'hectare';
      case AreaUnit.squareKilometer:
        return 'square kilometer';
      case AreaUnit.squareMegameter:
        return 'square megameter';
      case AreaUnit.squareGigameter:
        return 'square gigameter';

      // Imperial.
      case AreaUnit.squareThou:
        return 'square thou';
      case AreaUnit.squareInch:
        return 'square inch';
      case AreaUnit.squareFoot:
        return 'square foot';
      case AreaUnit.squareYard:
        return 'square yard';
      case AreaUnit.acre:
        return 'acre';
      case AreaUnit.squareMile:
        return 'square mile';
    }
  }

  /// Gets a localized symbol for this unit.
  String getSymbol({
    required String locale,
  }) {
    switch (this) {
      // SI.
      case AreaUnit.squareNanometer:
        return 'nm²';
      case AreaUnit.squareMicrometer:
        return 'μm²';
      case AreaUnit.squareMillimeter:
        return 'mm²';
      case AreaUnit.squareCentimeter:
        return 'cm²';
      case AreaUnit.squareDecimeter:
        return 'dm²';
      case AreaUnit.squareMeter:
        return 'm²';
      case AreaUnit.squareDecameter:
        return 'dam²';
      case AreaUnit.hectare:
        return 'ha';
      case AreaUnit.squareKilometer:
        return 'km²';
      case AreaUnit.squareMegameter:
        return 'Mm²';
      case AreaUnit.squareGigameter:
        return 'Gm²';

      // Imperial.
      case AreaUnit.squareThou:
        return 'thou²';
      case AreaUnit.squareInch:
        return 'in²';
      case AreaUnit.squareFoot:
        return 'ft²';
      case AreaUnit.squareYard:
        return 'yd²';
      case AreaUnit.acre:
        return 'ac';
      case AreaUnit.squareMile:
        return 'mi²';
    }
  }

  /// Gets the pattern specifier for this unit.
  String get patternSpecifier => getSymbol(
        locale: 'en',
      );
}

/// Represents a rate of change in [Area].
class AreaRate extends UnitOfMeasurementRate<Area> {
  const AreaRate._({
    required Area value,
    required Duration period,
  }) : super(
          value: value,
          period: period,
        );

  static final _defaultFormat = AreaRateFormat();

  @override
  String toString() => _defaultFormat.format(this);
}

/// Allows an [Area] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax, which you can combine with the [AreaUnit]
/// pattern specifiers as required:
///
/// | | Unit | Specifier |
/// |:-|:-|:-|
/// | **S.I.** | square nanometers | `nm²` |
/// | | square micrometers | `μm²` |
/// | | square millimeters | `mm²` |
/// | | square centimeters | `cm²` |
/// | | square decimeters | `dm²` |
/// | | square meters | `m²` |
/// | | square decameters | `dam²` |
/// | | hectares | `ha` |
/// | | square kilometers | `km²` |
/// | | square megameters | `Mm²` |
/// | | square gigameters | `Gm²` |
/// | **Imperial** | square thous | `thou²` |
/// | | square inches | `in²` |
/// | | square feet | `ft²` |
/// | | square yards | `yd²` |
/// | | acres | `ac` |
/// | | square miles | `mi²` |
///
/// ```
/// final area = 42.hectares();
///
/// // '42ha'
/// final result1 = AreaFormat().format(area);
///
/// // '42 hectares'
/// final result2 = AreaFormat(pattern: '0.## U').format(area);
///
/// // '420,000 m²'
/// final result3 = AreaFormat(pattern: '###,##0.## u:m²').format(area);
/// ```
///
/// See also:
/// * [UnitOfMeasurementFormat]
class AreaFormat extends _BaseAreaFormat<Area> {
  AreaFormat({
    String pattern = '0.##${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}',
    Set<AreaUnit> permissibleValueUnits = AreaUnits.commonSi,
    String? locale,
  }) : super._(
          pattern: pattern,
          permissibleValueUnits: permissibleValueUnits,
          permissibleRateUnits: const <RateUnit>{},
          locale: locale,
        );

  @override
  AreaUnit getLargestUnit(Area input) => input.getLargestUnit(permissibleUnits: permissibleValueUnits);

  @override
  Rational getUnitQuantity(Area input, AreaUnit unit) => input.getUnits(unit);

  @override
  Area scaleToRateUnit(Area input, RateUnit rateUnit) => throw UnsupportedError('Cannot scale Area to a RateUnit');
}

/// Allows an [AreaRate] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax and [AreaFormat] for area-specific notes.
///
/// ```
/// final areaRate = 42.hectares().per(const Duration(seconds: 1));
///
/// // '42ha/s'
/// final result1 = AreaRateFormat().format(areaRate);
///
/// // '42 hectares per second'
/// final result2 = AreaRateFormat(pattern: "0.## U 'per' R").format(areaRate);
///
/// // '1,512,000,000 m²/hr'
/// final result3 = AreaRateFormat(pattern: "###,##0.## u:m²'/'r:hr").format(areaRate);
/// ```
///
/// See also:
/// * [UnitOfMeasurementFormat]
/// * [AreaFormat]
class AreaRateFormat extends _BaseAreaFormat<AreaRate> {
  AreaRateFormat({
    String pattern =
        "0.##${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}'/'${UnitOfMeasurementFormat.rateUnitSymbolFormatSpecifier}",
    Set<AreaUnit> permissibleValueUnits = AreaUnits.commonSi,
    Set<RateUnit> permissibleRateUnits = RateUnits.hourOrLess,
    String? locale,
  }) : super._(
          pattern: pattern,
          permissibleValueUnits: permissibleValueUnits,
          permissibleRateUnits: permissibleRateUnits,
          locale: locale,
        );

  @override
  AreaUnit getLargestUnit(AreaRate input) => input.value.getLargestUnit(permissibleUnits: permissibleValueUnits);

  @override
  Rational getUnitQuantity(AreaRate input, AreaUnit unit) => input.value.getUnits(unit);

  @override
  AreaRate scaleToRateUnit(AreaRate input, RateUnit rateUnit) {
    final scaledPeriod = rateUnit.duration;
    final scale = Rational.fromInt(scaledPeriod.inMicroseconds) / Rational.fromInt(input.period.inMicroseconds);
    final result = Area.fromSquareMeters(input.value.squareMeters * scale).per(scaledPeriod);
    return result;
  }
}

abstract class _BaseAreaFormat<TInput> extends UnitOfMeasurementFormat<TInput, AreaUnit> {
  _BaseAreaFormat._({
    required String pattern,
    required this.permissibleValueUnits,
    required this.permissibleRateUnits,
    required String? locale,
  }) : super(
          pattern: pattern,
          locale: locale,
        );

  final Set<AreaUnit> permissibleValueUnits;
  final Set<RateUnit> permissibleRateUnits;

  @override
  String getPatternSpecifierFor(AreaUnit valueUnit) => valueUnit.patternSpecifier;

  @override
  Set<RateUnit> getPermissibleRateUnits() => permissibleRateUnits;

  @override
  Set<AreaUnit> getPermissibleValueUnits() => permissibleValueUnits;

  @override
  String getUnitName(AreaUnit unit, String locale) => unit.getName(locale: locale);

  @override
  String getUnitSymbol(AreaUnit unit, String locale) => unit.getSymbol(locale: locale);
}
