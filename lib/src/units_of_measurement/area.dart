import 'package:decimal/decimal.dart';
import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/decimals.dart';
import 'package:meta/meta.dart';

/// A unit of measurement representing a two-dimensional area.
class Area extends UnitOfMeasurement<AreaUnit, Area> {
  /// Creates an [Area] given a [unit] and decimal [value] for that unit.
  Area.fromUnits(AreaUnit unit, Decimal value) : super.fromUnits(unit, value);

  /// Creates an [Area] representing the specified number of [squareNanometers].
  factory Area.fromSquareNanometers(Decimal squareNanometers) =>
      Area.fromUnits(AreaUnit.squareNanometer, squareNanometers);

  /// Creates an [Area] representing the specified number of [squareMicrometers].
  factory Area.fromSquareMicrometers(Decimal squareMicrometers) =>
      Area.fromUnits(AreaUnit.squareMicrometer, squareMicrometers);

  /// Creates an [Area] representing the specified number of [squareThous].
  factory Area.fromSquareThous(Decimal squareThous) => Area.fromUnits(AreaUnit.squareThou, squareThous);

  /// Creates an [Area] representing the specified number of [squareMillimeters].
  factory Area.fromSquareMillimeters(Decimal squareMillimeters) =>
      Area.fromUnits(AreaUnit.squareMillimeter, squareMillimeters);

  /// Creates an [Area] representing the specified number of [squareCentimeters].
  factory Area.fromSquareCentimeters(Decimal squareCentimeters) =>
      Area.fromUnits(AreaUnit.squareCentimeter, squareCentimeters);

  /// Creates an [Area] representing the specified number of [squareInches].
  factory Area.fromSquareInches(Decimal squareInches) => Area.fromUnits(AreaUnit.squareInch, squareInches);

  /// Creates an [Area] representing the specified number of [squareDecimeters].
  factory Area.fromSquareDecimeters(Decimal squareDecimeters) =>
      Area.fromUnits(AreaUnit.squareDecimeter, squareDecimeters);

  /// Creates an [Area] representing the specified number of [squareFeet].
  factory Area.fromSquareFeet(Decimal squareFeet) => Area.fromUnits(AreaUnit.squareFoot, squareFeet);

  /// Creates an [Area] representing the specified number of [squareYards].
  factory Area.fromSquareYards(Decimal squareYards) => Area.fromUnits(AreaUnit.squareYard, squareYards);

  /// Creates an [Area] representing the specified number of [squareMeters].
  factory Area.fromSquareMeters(Decimal squareMeters) => Area.fromUnits(AreaUnit.squareMeter, squareMeters);

  /// Creates an [Area] representing the specified number of [squareDecameters].
  factory Area.fromSquareDecameters(Decimal squareDecameters) =>
      Area.fromUnits(AreaUnit.squareDecameter, squareDecameters);

  /// Creates an [Area] representing the specified number of [acres].
  factory Area.fromAcres(Decimal acres) => Area.fromUnits(AreaUnit.acre, acres);

  /// Creates an [Area] representing the specified number of [hectares].
  factory Area.fromHectares(Decimal hectares) => Area.fromUnits(AreaUnit.hectare, hectares);

  /// Creates an [Area] representing the specified number of [squareKilometers].
  factory Area.fromSquareKilometers(Decimal squareKilometers) =>
      Area.fromUnits(AreaUnit.squareKilometer, squareKilometers);

  /// Creates an [Area] representing the specified number of [squareMiles].
  factory Area.fromSquareMiles(Decimal squareMiles) => Area.fromUnits(AreaUnit.squareMile, squareMiles);

  /// Creates an [Area] representing the specified number of [squareMegameters].
  factory Area.fromSquareMegameters(Decimal squareMegameters) =>
      Area.fromUnits(AreaUnit.squareMegameter, squareMegameters);

  /// Creates an [Area] representing the specified number of [squareGigameters].
  factory Area.fromSquareGigameters(Decimal squareGigameters) =>
      Area.fromUnits(AreaUnit.squareGigameter, squareGigameters);

  /// An [Area] of size zero.
  static final zero = Area.fromSquareNanometers(Decimal.zero);

  /// Gets the number of square nanometers in this [Area], including any fractional portion.
  Decimal get squareNanometers => getUnits(AreaUnit.squareNanometer);

  /// Gets the number of square micrometers in this [Area], including any fractional portion.
  Decimal get squareMicrometers => getUnits(AreaUnit.squareMicrometer);

  /// Gets the number of square thous in this [Area], including any fractional portion.
  Decimal get squareThous => getUnits(AreaUnit.squareThou);

  /// Gets the number of square millimeters in this [Area], including any fractional portion.
  Decimal get squareMillimeters => getUnits(AreaUnit.squareMillimeter);

  /// Gets the number of square centimeters in this [Area], including any fractional portion.
  Decimal get squareCentimeters => getUnits(AreaUnit.squareCentimeter);

  /// Gets the number of square inches in this [Area], including any fractional portion.
  Decimal get squareInches => getUnits(AreaUnit.squareInch);

  /// Gets the number of square decimeters in this [Area], including any fractional portion.
  Decimal get squareDecimeters => getUnits(AreaUnit.squareDecimeter);

  /// Gets the number of square feet in this [Area], including any fractional portion.
  Decimal get squareFeet => getUnits(AreaUnit.squareFoot);

  /// Gets the number of square yards in this [Area], including any fractional portion.
  Decimal get squareYards => getUnits(AreaUnit.squareYard);

  /// Gets the number of square meters in this [Area], including any fractional portion.
  Decimal get squareMeters => getUnits(AreaUnit.squareMeter);

  /// Gets the number of square decameters in this [Area], including any fractional portion.
  Decimal get squareDecameters => getUnits(AreaUnit.squareDecameter);

  /// Gets the number of acres in this [Area], including any fractional portion.
  Decimal get acres => getUnits(AreaUnit.acre);

  /// Gets the number of hectares in this [Area], including any fractional portion.
  Decimal get hectares => getUnits(AreaUnit.hectare);

  /// Gets the number of square kilometers in this [Area], including any fractional portion.
  Decimal get squareKilometers => getUnits(AreaUnit.squareKilometer);

  /// Gets the number of square miles in this [Area], including any fractional portion.
  Decimal get squareMiles => getUnits(AreaUnit.squareMile);

  /// Gets the number of square megameters in this [Area], including any fractional portion.
  Decimal get squareMegameters => getUnits(AreaUnit.squareMegameter);

  /// Gets the number of square gigameters in this [Area], including any fractional portion.
  Decimal get squareGigameters => getUnits(AreaUnit.squareGigameter);

  /// Creates an [AreaRate] with the specified [period] from this value.
  AreaRate per(Duration period) => AreaRate._(
        value: this,
        period: period,
      );

  @override
  Decimal getUnits(AreaUnit unit) => baseValue / unit._squareMeterCount;

  @override
  String toString() => humanize();

  @override
  @protected
  Area createValue(Decimal baseValue) => Area.fromSquareNanometers(baseValue);

  @override
  @protected
  Decimal getBaseValue(AreaUnit unit, Decimal value) => value * unit._squareMeterCount;
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
    AreaUnit.squareNanometer,
    AreaUnit.squareMicrometer,
    AreaUnit.squareThou,
    AreaUnit.squareMillimeter,
    AreaUnit.squareCentimeter,
    AreaUnit.squareInch,
    AreaUnit.squareDecimeter,
    AreaUnit.squareFoot,
    AreaUnit.squareYard,
    AreaUnit.squareMeter,
    AreaUnit.squareDecameter,
    AreaUnit.acre,
    AreaUnit.hectare,
    AreaUnit.squareKilometer,
    AreaUnit.squareMile,
    AreaUnit.squareMegameter,
    AreaUnit.squareGigameter,
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
  static final _squareMetersInSquareNanometer = ds('0.000000000000000001');
  static final _squareMetersInSquareMicrometer = ds('0.000000000001');
  static final _squareMetersInSquareThou = ds('0.00000000064516');
  static final _squareMetersInSquareMillimeter = ds('0.000001');
  static final _squareMetersInSquareCentimeter = ds('0.0001');
  static final _squareMetersInSquareInch = ds('0.00064516');
  static final _squareMetersInSquareDecimeter = ds('0.01');
  static final _squareMetersInSquareFoot = ds('0.092903');
  static final _squareMetersInSquareYard = ds('0.836127');
  static final _squareMetersInSquareMeter = Decimal.one;
  static final _squareMetersInSquareDecameter = di(100);
  static final _squareMetersInAcre = ds('4046.86');
  static final _squareMetersInHectare = di(10000);
  static final _squareMetersInSquareKilometer = di(1000000);
  static final _squareMetersInSquareMile = di(2590000);
  static final _squareMetersInSquareMegameter = di(1000000000000);
  static final _squareMetersInSquareGigameter = di(1000000000000000000);

  Decimal get _squareMeterCount {
    switch (this) {
      case AreaUnit.squareNanometer:
        return _squareMetersInSquareNanometer;
      case AreaUnit.squareMicrometer:
        return _squareMetersInSquareMicrometer;
      case AreaUnit.squareThou:
        return _squareMetersInSquareThou;
      case AreaUnit.squareMillimeter:
        return _squareMetersInSquareMillimeter;
      case AreaUnit.squareCentimeter:
        return _squareMetersInSquareCentimeter;
      case AreaUnit.squareInch:
        return _squareMetersInSquareInch;
      case AreaUnit.squareDecimeter:
        return _squareMetersInSquareDecimeter;
      case AreaUnit.squareFoot:
        return _squareMetersInSquareFoot;
      case AreaUnit.squareYard:
        return _squareMetersInSquareYard;
      case AreaUnit.squareMeter:
        return _squareMetersInSquareMeter;
      case AreaUnit.squareDecameter:
        return _squareMetersInSquareDecameter;
      case AreaUnit.acre:
        return _squareMetersInAcre;
      case AreaUnit.hectare:
        return _squareMetersInHectare;
      case AreaUnit.squareKilometer:
        return _squareMetersInSquareKilometer;
      case AreaUnit.squareMile:
        return _squareMetersInSquareMile;
      case AreaUnit.squareMegameter:
        return _squareMetersInSquareMegameter;
      case AreaUnit.squareGigameter:
        return _squareMetersInSquareGigameter;
    }
  }

  /// Gets a localized name for this unit.
  String getName({
    required String locale,
  }) {
    switch (this) {
      case AreaUnit.squareNanometer:
        return 'square nanometer';
      case AreaUnit.squareMicrometer:
        return 'square micrometer';
      case AreaUnit.squareThou:
        return 'square thou';
      case AreaUnit.squareMillimeter:
        return 'square millimeter';
      case AreaUnit.squareCentimeter:
        return 'square centimeter';
      case AreaUnit.squareInch:
        return 'square inch';
      case AreaUnit.squareDecimeter:
        return 'square decimeter';
      case AreaUnit.squareFoot:
        return 'square foot';
      case AreaUnit.squareYard:
        return 'square yard';
      case AreaUnit.squareMeter:
        return 'square meter';
      case AreaUnit.squareDecameter:
        return 'square decameter';
      case AreaUnit.acre:
        return 'acre';
      case AreaUnit.hectare:
        return 'hectare';
      case AreaUnit.squareKilometer:
        return 'square kilometer';
      case AreaUnit.squareMile:
        return 'square mile';
      case AreaUnit.squareMegameter:
        return 'square megameter';
      case AreaUnit.squareGigameter:
        return 'square gigameter';
    }
  }

  /// Gets a localized symbol for this unit.
  String getSymbol({
    required String locale,
  }) {
    switch (this) {
      case AreaUnit.squareNanometer:
        return 'nm²';
      case AreaUnit.squareMicrometer:
        return 'μm²';
      case AreaUnit.squareThou:
        return 'thou²';
      case AreaUnit.squareMillimeter:
        return 'mm²';
      case AreaUnit.squareCentimeter:
        return 'cm²';
      case AreaUnit.squareInch:
        return 'in²';
      case AreaUnit.squareDecimeter:
        return 'dm²';
      case AreaUnit.squareFoot:
        return 'ft²';
      case AreaUnit.squareYard:
        return 'yd²';
      case AreaUnit.squareMeter:
        return 'm²';
      case AreaUnit.squareDecameter:
        return 'dam²';
      case AreaUnit.acre:
        return 'ac';
      case AreaUnit.hectare:
        return 'ha';
      case AreaUnit.squareKilometer:
        return 'km²';
      case AreaUnit.squareMile:
        return 'mi²';
      case AreaUnit.squareMegameter:
        return 'Mm²';
      case AreaUnit.squareGigameter:
        return 'Gm²';
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

  @override
  String toString() => humanize();
}

/// Allows an [Area] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax, which you can combine with the [AreaUnit]
/// pattern specifiers as required:
///
/// | Specifier | Description |
/// |-|-|
/// | `nm²` | square nanometers |
/// | `μm²` | square micrometers |
/// | `thou²` | square thous |
/// | `mm²` | square millimeters |
/// | `cm²` | square centimeters |
/// | `in²` | square inches |
/// | `dm²` | square decimeters |
/// | `ft²` | square feet |
/// | `yd²` | square yards |
/// | `m²` | square meters |
/// | `dam²` | square decameters |
/// | `ac` | acres |
/// | `ha` | hectares |
/// | `km²` | square kilometers |
/// | `mi²` | square miles |
/// | `Mm²` | square megameters |
/// | `Gm²` | square gigameters |
///
/// ```
/// final area = 42.hectares();
///
/// // '42 ha'
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
    String pattern = '0.## ${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}',
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
  Decimal getUnitQuantity(Area input, AreaUnit unit) => input.getUnits(unit);

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
/// // '42 ha/s'
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
        "0.## ${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}'/'${UnitOfMeasurementFormat.rateUnitSymbolFormatSpecifier}",
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
  Decimal getUnitQuantity(AreaRate input, AreaUnit unit) => input.value.getUnits(unit);

  @override
  AreaRate scaleToRateUnit(AreaRate input, RateUnit rateUnit) {
    final scaledPeriod = rateUnit.duration;
    final scale = di(scaledPeriod.inMicroseconds) / di(input.period.inMicroseconds);
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
