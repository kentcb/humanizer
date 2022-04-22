import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/quantity_constants.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';
import 'package:meta/meta.dart';

/// A unit of measurement representing a dimensionless quantity (a.k.a. "bare", "pure", or "scalar" quantity). This
/// means it is a quantity that has no corresponding physical dimension associated with it.
class Quantity extends UnitOfMeasurement<QuantityUnit, Quantity> {
  /// Creates a [Quantity] given a [unit] and rational [value] for that unit.
  Quantity.fromUnits(QuantityUnit unit, Rational value) : super.fromUnits(unit, value);

  /// Creates a [Quantity] representing the specified number of [ones].
  factory Quantity.fromOnes(Rational ones) => Quantity.fromUnits(QuantityUnit.one, ones);

  /// Creates a [Quantity] representing the specified number of [thousands].
  factory Quantity.fromThousands(Rational thousands) => Quantity.fromUnits(QuantityUnit.thousand, thousands);

  /// Creates a [Quantity] representing the specified number of [millions].
  factory Quantity.fromMillions(Rational millions) => Quantity.fromUnits(QuantityUnit.million, millions);

  /// Creates a [Quantity] representing the specified number of [billions].
  factory Quantity.fromBillions(Rational billions) => Quantity.fromUnits(QuantityUnit.billion, billions);

  /// Creates a [Quantity] representing the specified number of [trillions].
  factory Quantity.fromTrillions(Rational trillions) => Quantity.fromUnits(QuantityUnit.trillion, trillions);

  /// A [Quantity] of zero.
  static final zero = Quantity.fromOnes(Rational.zero);

  static final _defaultFormat = QuantityFormat();

  /// Gets the number of ones in this [Quantity], including any fractional portion.
  Rational get ones => getUnits(QuantityUnit.one);

  /// Gets the number of thousands in this [Quantity], including any fractional portion.
  Rational get thousands => getUnits(QuantityUnit.thousand);

  /// Gets the number of millions in this [Quantity], including any fractional portion.
  Rational get millions => getUnits(QuantityUnit.million);

  /// Gets the number of billions in this [Quantity], including any fractional portion.
  Rational get billions => getUnits(QuantityUnit.billion);

  /// Gets the number of trillions in this [Quantity], including any fractional portion.
  Rational get trillions => getUnits(QuantityUnit.trillion);

  /// Creates a [QuantityRate] with the specified [period] from this value.
  QuantityRate per(Duration period) => QuantityRate._(
        value: this,
        period: period,
      );

  @override
  Rational getUnits(QuantityUnit unit) => baseValue / unit._unitCount;

  @override
  String toString() => _defaultFormat.format(this);

  @override
  @protected
  Quantity createValue(Rational baseValue) => Quantity.fromOnes(baseValue);

  @override
  @protected
  Rational getBaseValue(QuantityUnit unit, Rational value) => value * unit._unitCount;
}

/// Defines supported units for dimensionless quantities.
enum QuantityUnit {
  one,
  thousand,
  million,
  billion,
  trillion,

  // See https://www.antidote.info/en/blog/reports/millions-billions-and-other-large-numbers if we want to add more
  // options here.
}

/// Provides convenience sets of commonly used [QuantityUnit]s.
class QuantityUnits {
  /// Contains all defined [QuantityUnit]s.
  static const all = <QuantityUnit>{
    QuantityUnit.one,
    QuantityUnit.thousand,
    QuantityUnit.million,
    QuantityUnit.billion,
    QuantityUnit.trillion,
  };
}

/// Contains extensions for [QuantityUnit].
extension QuantityUnitExtensions on QuantityUnit {
  Rational get _unitCount {
    switch (this) {
      case QuantityUnit.one:
        return unitsInUnit;
      case QuantityUnit.thousand:
        return unitsInThousand;
      case QuantityUnit.million:
        return unitsInMillion;
      case QuantityUnit.billion:
        return unitsInBillion;
      case QuantityUnit.trillion:
        return unitsInTrillion;
    }
  }

  /// Gets a localized name for this unit.
  String getName({
    required String locale,
  }) {
    switch (this) {
      case QuantityUnit.one:
        return '';
      case QuantityUnit.thousand:
        return 'thousand';
      case QuantityUnit.million:
        return 'million';
      case QuantityUnit.billion:
        return 'billion';
      case QuantityUnit.trillion:
        return 'trillion';
    }
  }

  /// Gets a localized symbol for this unit.
  String getSymbol({
    required String locale,
  }) {
    final isUnitedKingdom = locale == 'en_GB';

    switch (this) {
      case QuantityUnit.one:
        return '';
      case QuantityUnit.thousand:
        return isUnitedKingdom ? 'k' : 'K';
      case QuantityUnit.million:
        return isUnitedKingdom ? 'm' : 'M';
      case QuantityUnit.billion:
        return isUnitedKingdom ? 'bn' : 'B';
      case QuantityUnit.trillion:
        return isUnitedKingdom ? 'tn' : 'T';
    }
  }

  /// Gets the pattern specifier for this unit.
  String get patternSpecifier {
    switch (this) {
      case QuantityUnit.one:
        return 'U';
      default:
        return getSymbol(
          locale: 'en',
        );
    }
  }
}

/// Represents a rate of change in [Quantity].
class QuantityRate extends UnitOfMeasurementRate<Quantity> {
  const QuantityRate._({
    required Quantity value,
    required Duration period,
  }) : super(
          value: value,
          period: period,
        );

  static final _defaultFormat = QuantityRateFormat();

  @override
  String toString() => _defaultFormat.format(this);
}

/// Allows a [Quantity] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax, which you can combine with the [QuantityUnit]
/// pattern specifiers as required:
///
/// | Unit | Specifier |
/// |-|-|
/// | one | `U` |
/// | thousand | `K` |
/// | million | `M` |
/// | billion | `B` |
/// | trillion | `T` |
///
/// ```
/// final quantity = 42.thousand();
///
/// // '42K'
/// final result1 = QuantityFormat().format(quantity);
///
/// // '42 thousand'
/// final result2 = QuantityFormat(pattern: '0.## U').format(quantity);
///
/// // '42,000'
/// final result3 = QuantityFormat(pattern: '###,##0.## u:U').format(quantity);
/// ```
///
/// See also:
/// * [UnitOfMeasurementFormat]
class QuantityFormat extends _BaseQuantityFormat<Quantity> {
  QuantityFormat({
    String pattern = '0.##${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}',
    Set<QuantityUnit> permissibleValueUnits = QuantityUnits.all,
    String? locale,
  }) : super._(
          pattern: pattern,
          permissibleValueUnits: permissibleValueUnits,
          permissibleRateUnits: const <RateUnit>{},
          locale: locale,
        );

  @override
  bool pluralizeValueUnits(String locale) => false;

  @override
  QuantityUnit getLargestUnit(Quantity input) => input.getLargestUnit(permissibleUnits: permissibleValueUnits);

  @override
  Rational getUnitQuantity(Quantity input, QuantityUnit unit) => input.getUnits(unit);

  @override
  Quantity scaleToRateUnit(Quantity input, RateUnit rateUnit) =>
      throw UnsupportedError('Cannot scale Quantity to a RateUnit');
}

/// Allows a [QuantityRate] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax and [QuantityFormat] for quantity-specific
/// notes.
///
/// ```
/// final quantityRate = 42.thousand().per(const Duration(minutes: 1));
///
/// // '42K/min'
/// final result1 = QuantityRateFormat().format(quantityRate);
///
/// // '42 thousand per minute'
/// final result2 = QuantityRateFormat(pattern: "0.## U 'per' R").format(quantityRate);
///
/// // '42,000/s'
/// final result3 = QuantityRateFormat(
///   pattern: "###,##0.##u:U'/'r:s",
///   permissibleValueUnits: QuantityUnits.all,
/// ).format(quantityRate);
/// ```
///
/// See also:
/// * [UnitOfMeasurementFormat]
/// * [QuantityFormat]
class QuantityRateFormat extends _BaseQuantityFormat<QuantityRate> {
  QuantityRateFormat({
    String pattern =
        "0.##${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}'/'${UnitOfMeasurementFormat.rateUnitSymbolFormatSpecifier}",
    Set<QuantityUnit> permissibleValueUnits = QuantityUnits.all,
    Set<RateUnit> permissibleRateUnits = RateUnits.hourOrLess,
    String? locale,
  }) : super._(
          pattern: pattern,
          permissibleValueUnits: permissibleValueUnits,
          permissibleRateUnits: permissibleRateUnits,
          locale: locale,
        );

  @override
  QuantityUnit getLargestUnit(QuantityRate input) =>
      input.value.getLargestUnit(permissibleUnits: permissibleValueUnits);

  @override
  Rational getUnitQuantity(QuantityRate input, QuantityUnit unit) => input.value.getUnits(unit);

  @override
  QuantityRate scaleToRateUnit(QuantityRate input, RateUnit rateUnit) {
    final scaledPeriod = rateUnit.duration;
    final scale = Rational.fromInt(scaledPeriod.inMicroseconds) / Rational.fromInt(input.period.inMicroseconds);
    final result = Quantity.fromOnes(input.value.ones * scale).per(scaledPeriod);
    return result;
  }
}

abstract class _BaseQuantityFormat<TInput> extends UnitOfMeasurementFormat<TInput, QuantityUnit> {
  _BaseQuantityFormat._({
    required String pattern,
    required this.permissibleValueUnits,
    required this.permissibleRateUnits,
    required String? locale,
  }) : super(
          pattern: pattern,
          locale: locale,
        );

  final Set<QuantityUnit> permissibleValueUnits;
  final Set<RateUnit> permissibleRateUnits;

  @override
  String getPatternSpecifierFor(QuantityUnit valueUnit) => valueUnit.patternSpecifier;

  @override
  Set<RateUnit> getPermissibleRateUnits() => permissibleRateUnits;

  @override
  Set<QuantityUnit> getPermissibleValueUnits() => permissibleValueUnits;

  @override
  String getUnitName(QuantityUnit unit, String locale) => unit.getName(locale: locale);

  @override
  String getUnitSymbol(QuantityUnit unit, String locale) => unit.getSymbol(locale: locale);
}
