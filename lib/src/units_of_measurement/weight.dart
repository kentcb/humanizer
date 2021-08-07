import 'package:decimal/decimal.dart';
import 'package:humanizer/humanizer.dart';
import 'package:meta/meta.dart';

import 'decimals.dart';

/// A unit of measurement representing a weight.
class Weight extends UnitOfMeasurement<WeightUnit, Weight> {
  /// Creates a [Weight] given a [unit] and decimal [value] for that unit.
  Weight.fromUnits(WeightUnit unit, Decimal value) : super.fromUnits(unit, value);

  /// Creates a [Weight] representing the specified number of [nanograms].
  factory Weight.fromNanograms(Decimal nanograms) => Weight.fromUnits(WeightUnit.nanogram, nanograms);

  /// Creates a [Weight] representing the specified number of [micrograms].
  factory Weight.fromMicrograms(Decimal micrograms) => Weight.fromUnits(WeightUnit.microgram, micrograms);

  /// Creates a [Weight] representing the specified number of [milligrams].
  factory Weight.fromMilligrams(Decimal milligrams) => Weight.fromUnits(WeightUnit.milligram, milligrams);

  /// Creates a [Weight] representing the specified number of [grams].
  factory Weight.fromGrams(Decimal grams) => Weight.fromUnits(WeightUnit.gram, grams);

  /// Creates a [Weight] representing the specified number of [ounces].
  factory Weight.fromOunces(Decimal ounces) => Weight.fromUnits(WeightUnit.ounce, ounces);

  /// Creates a [Weight] representing the specified number of [pounds].
  factory Weight.fromPounds(Decimal pounds) => Weight.fromUnits(WeightUnit.pound, pounds);

  /// Creates a [Weight] representing the specified number of [kilograms].
  factory Weight.fromKilograms(Decimal kilograms) => Weight.fromUnits(WeightUnit.kilogram, kilograms);

  /// Creates a [Weight] representing the specified number of [usTons].
  factory Weight.fromUsTons(Decimal usTons) => Weight.fromUnits(WeightUnit.usTon, usTons);

  /// Creates a [Weight] representing the specified number of [tonnes].
  factory Weight.fromTonnes(Decimal tonnes) => Weight.fromUnits(WeightUnit.tonne, tonnes);

  /// Creates a [Weight] representing the specified number of [imperialTons].
  factory Weight.fromImperialTons(Decimal imperialTons) => Weight.fromUnits(WeightUnit.imperialTon, imperialTons);

  /// Creates a [Weight] representing the specified number of [megatonnes].
  factory Weight.fromMegatonnes(Decimal megatonnes) => Weight.fromUnits(WeightUnit.megatonne, megatonnes);

  /// Creates a [Weight] representing the specified number of [gigatonnes].
  factory Weight.fromGigatonnes(Decimal gigatonnes) => Weight.fromUnits(WeightUnit.gigatonne, gigatonnes);

  /// A [Weight] of size zero.
  static final zero = Weight.fromNanograms(Decimal.zero);

  /// Gets the number of nanograms in this [Weight], including any fractional portion.
  Decimal get nanograms => getUnits(WeightUnit.nanogram);

  /// Gets the number of micrograms in this [Weight], including any fractional portion.
  Decimal get micrograms => getUnits(WeightUnit.microgram);

  /// Gets the number of milligrams in this [Weight], including any fractional portion.
  Decimal get milligrams => getUnits(WeightUnit.milligram);

  /// Gets the number of grams in this [Weight], including any fractional portion.
  Decimal get grams => getUnits(WeightUnit.gram);

  /// Gets the number of ounces in this [Weight], including any fractional portion.
  Decimal get ounces => getUnits(WeightUnit.ounce);

  /// Gets the number of pounds in this [Weight], including any fractional portion.
  Decimal get pounds => getUnits(WeightUnit.pound);

  /// Gets the number of kilograms in this [Weight], including any fractional portion.
  Decimal get kilograms => getUnits(WeightUnit.kilogram);

  /// Gets the number of usTons in this [Weight], including any fractional portion.
  Decimal get usTons => getUnits(WeightUnit.usTon);

  /// Gets the number of tonnes in this [Weight], including any fractional portion.
  Decimal get tonnes => getUnits(WeightUnit.tonne);

  /// Gets the number of imperialTons in this [Weight], including any fractional portion.
  Decimal get imperialTons => getUnits(WeightUnit.imperialTon);

  /// Gets the number of megatonnes in this [Weight], including any fractional portion.
  Decimal get megatonnes => getUnits(WeightUnit.megatonne);

  /// Gets the number of gigatonnes in this [Weight], including any fractional portion.
  Decimal get gigatonnes => getUnits(WeightUnit.gigatonne);

  /// Creates a [WeightRate] with the specified [period] from this value.
  WeightRate per(Duration period) => WeightRate._(
        value: this,
        period: period,
      );

  @override
  Decimal getUnits(WeightUnit unit) => baseValue / unit._gramCount;

  @override
  String toString() => humanize();

  @override
  @protected
  Weight createValue(Decimal baseValue) => Weight.fromGrams(baseValue);

  @override
  @protected
  Decimal getBaseValue(WeightUnit unit, Decimal value) => value * unit._gramCount;
}

/// Defines supported units of weight.
enum WeightUnit {
  /// A unit representing nanograms.
  nanogram,

  /// A unit representing micrograms.
  microgram,

  /// A unit representing milligrams.
  milligram,

  /// A unit representing grams.
  gram,

  /// A unit representing ounces.
  ounce,

  /// A unit representing pounds.
  pound,

  /// A unit representing kilograms.
  kilogram,

  /// A unit representing US tons.
  usTon,

  /// A unit representing (metric) tonnes.
  tonne,

  /// A unit representing imperial tons.
  imperialTon,

  /// A unit representing megatonnes.
  megatonne,

  /// A unit representing gigatonnes.
  gigatonne,
}

/// Provides convenience sets of commonly used [WeightUnit]s.
class WeightUnits {
  /// Contains all defined [WeightUnit]s.
  static const all = <WeightUnit>{
    WeightUnit.nanogram,
    WeightUnit.microgram,
    WeightUnit.milligram,
    WeightUnit.gram,
    WeightUnit.ounce,
    WeightUnit.pound,
    WeightUnit.kilogram,
    WeightUnit.usTon,
    WeightUnit.tonne,
    WeightUnit.imperialTon,
    WeightUnit.megatonne,
    WeightUnit.gigatonne,
  };

  /// Contains International System of Units (SI) [WeightUnit]s.
  static const si = <WeightUnit>{
    WeightUnit.nanogram,
    WeightUnit.microgram,
    WeightUnit.milligram,
    WeightUnit.gram,
    WeightUnit.kilogram,
    WeightUnit.tonne,
    WeightUnit.megatonne,
    WeightUnit.gigatonne,
  };

  /// Contains commonly used International System of Units (SI) [WeightUnit]s.
  static const commonSi = <WeightUnit>{
    WeightUnit.milligram,
    WeightUnit.gram,
    WeightUnit.kilogram,
    WeightUnit.tonne,
  };

  /// Contains imperial [WeightUnit]s.
  static const imperial = <WeightUnit>{
    WeightUnit.ounce,
    WeightUnit.pound,
    WeightUnit.imperialTon,
  };

  /// Contains US imperial [WeightUnit]s.
  static const usImperial = <WeightUnit>{
    WeightUnit.ounce,
    WeightUnit.pound,
    WeightUnit.usTon,
  };
}

/// Contains extensions for [WeightUnit].
extension WeightUnitExtensions on WeightUnit {
  static final _gramsInNanogram = ds('0.000000001');
  static final _gramsInMicrogram = ds('0.000001');
  static final _gramsInMilligram = ds('0.001');
  static final _gramsInGram = Decimal.one;
  static final _gramsInOunce = ds('28.3495');
  static final _gramsInPound = ds('453.592');
  static final _gramsInKilogram = di(1000);
  static final _gramsInUsTon = di(907185);
  static final _gramsInTonne = di(1000000);
  static final _gramsInImperialTon = di(1016000);
  static final _gramsInMegatonne = di(1000000000000);
  static final _gramsInGigatonne = di(1000000000000000);

  Decimal get _gramCount {
    switch (this) {
      case WeightUnit.nanogram:
        return _gramsInNanogram;
      case WeightUnit.microgram:
        return _gramsInMicrogram;
      case WeightUnit.milligram:
        return _gramsInMilligram;
      case WeightUnit.gram:
        return _gramsInGram;
      case WeightUnit.ounce:
        return _gramsInOunce;
      case WeightUnit.pound:
        return _gramsInPound;
      case WeightUnit.kilogram:
        return _gramsInKilogram;
      case WeightUnit.usTon:
        return _gramsInUsTon;
      case WeightUnit.tonne:
        return _gramsInTonne;
      case WeightUnit.imperialTon:
        return _gramsInImperialTon;
      case WeightUnit.megatonne:
        return _gramsInMegatonne;
      case WeightUnit.gigatonne:
        return _gramsInGigatonne;
    }
  }

  /// Gets a localized name for this unit.
  String getName({
    required String locale,
  }) {
    switch (this) {
      case WeightUnit.nanogram:
        return 'nanogram';
      case WeightUnit.microgram:
        return 'microgram';
      case WeightUnit.milligram:
        return 'milligram';
      case WeightUnit.gram:
        return 'gram';
      case WeightUnit.ounce:
        return 'ounce';
      case WeightUnit.pound:
        return 'pound';
      case WeightUnit.kilogram:
        return 'kilogram';
      case WeightUnit.usTon:
        return 'ton';
      case WeightUnit.tonne:
        return 'tonne';
      case WeightUnit.imperialTon:
        return 'ton';
      case WeightUnit.megatonne:
        return 'megatonne';
      case WeightUnit.gigatonne:
        return 'gigatonne';
    }
  }

  /// Gets a localized symbol for this unit.
  String getSymbol({
    required String locale,
  }) {
    switch (this) {
      case WeightUnit.nanogram:
        return 'ng';
      case WeightUnit.microgram:
        return 'µg';
      case WeightUnit.milligram:
        return 'mg';
      case WeightUnit.gram:
        return 'g';
      case WeightUnit.ounce:
        return 'oz';
      case WeightUnit.pound:
        return 'lb';
      case WeightUnit.kilogram:
        return 'kg';
      case WeightUnit.usTon:
        return 'ton';
      case WeightUnit.tonne:
        return 't';
      case WeightUnit.imperialTon:
        return 'ton';
      case WeightUnit.megatonne:
        return 'Mt';
      case WeightUnit.gigatonne:
        return 'Gt';
    }
  }

  /// Gets the pattern specifier for this unit.
  String get patternSpecifier {
    switch (this) {
      case WeightUnit.usTon:
        return 't_us';
      case WeightUnit.imperialTon:
        return 't_imp';
      default:
        return getSymbol(
          locale: 'en',
        );
    }
  }
}

/// Represents a rate of change in [Weight].
class WeightRate extends UnitOfMeasurementRate<Weight> {
  const WeightRate._({
    required Weight value,
    required Duration period,
  }) : super(
          value: value,
          period: period,
        );

  @override
  String toString() => humanize();
}

/// Allows a [Weight] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax, which you can combine with the [WeightUnit]
/// pattern specifiers as required:
///
/// | Specifier | Description |
/// |-|-|
/// | `ng` | nanogram |
/// | `µg` | microgram |
/// | `mg` | milligram |
/// | `g ` | gram |
/// | `oz` | ounce |
/// | `lb` | pound |
/// | `kg` | kilogram |
/// | `t_us` | US ton |
/// | `t` | tonne |
/// | `t_imp` | imperial ton |
/// | `Mt` | megatonne |
/// | `Gt` | gigatonne |
///
/// ```
/// final weight = 42.kilograms();
///
/// // '42 kg'
/// final result1 = WeightFormat().format(weight);
///
/// // '42 kilograms'
/// final result2 = WeightFormat(pattern: '0.## U').format(weight);
///
/// // '42,000 g'
/// final result3 = WeightFormat(pattern: '###,##0.## u:g').format(weight);
/// ```
///
/// See also:
/// * [UnitOfMeasurementFormat]
class WeightFormat extends _BaseWeightFormat<Weight> {
  WeightFormat({
    String pattern = '0.## ${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}',
    Set<WeightUnit> permissibleValueUnits = WeightUnits.commonSi,
    String? locale,
  }) : super._(
          pattern: pattern,
          permissibleValueUnits: permissibleValueUnits,
          permissibleRateUnits: const <RateUnit>{},
          locale: locale,
        );

  @override
  WeightUnit getLargestUnit(Weight input) => input.getLargestUnit(permissibleUnits: permissibleValueUnits);

  @override
  Decimal getUnitQuantity(Weight input, WeightUnit unit) => input.getUnits(unit);

  @override
  Weight scaleToRateUnit(Weight input, RateUnit rateUnit) =>
      throw UnsupportedError('Cannot scale Weight to a RateUnit');
}

/// Allows a [WeightRate] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax and [WeightFormat] for weight-specific notes.
///
/// ```
/// final weightRate = 42.kilograms().per(const Duration(seconds: 1));
///
/// // '42 kg/s'
/// final result1 = WeightRateFormat().format(weightRate);
///
/// // '42 kilograms per second'
/// final result2 = WeightRateFormat(pattern: "0.## U 'per' R").format(weightRate);
///
/// // '5,555.65 lb/min'
/// final result3 = WeightRateFormat(
///   pattern: "###,##0.## u:lb'/'r:min",
///   permissibleValueUnits: WeightUnits.imperial,
/// ).format(weightRate);
/// ```
///
/// See also:
/// * [UnitOfMeasurementFormat]
/// * [WeightFormat]
class WeightRateFormat extends _BaseWeightFormat<WeightRate> {
  WeightRateFormat({
    String pattern =
        "0.## ${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}'/'${UnitOfMeasurementFormat.rateUnitSymbolFormatSpecifier}",
    Set<WeightUnit> permissibleValueUnits = WeightUnits.commonSi,
    Set<RateUnit> permissibleRateUnits = RateUnits.hourOrLess,
    String? locale,
  }) : super._(
          pattern: pattern,
          permissibleValueUnits: permissibleValueUnits,
          permissibleRateUnits: permissibleRateUnits,
          locale: locale,
        );

  @override
  WeightUnit getLargestUnit(WeightRate input) => input.value.getLargestUnit(permissibleUnits: permissibleValueUnits);

  @override
  Decimal getUnitQuantity(WeightRate input, WeightUnit unit) => input.value.getUnits(unit);

  @override
  WeightRate scaleToRateUnit(WeightRate input, RateUnit rateUnit) {
    final scaledPeriod = rateUnit.duration;
    final scale = di(scaledPeriod.inMicroseconds) / di(input.period.inMicroseconds);
    final result = Weight.fromGrams(input.value.grams * scale).per(scaledPeriod);
    return result;
  }
}

abstract class _BaseWeightFormat<TInput> extends UnitOfMeasurementFormat<TInput, WeightUnit> {
  _BaseWeightFormat._({
    required String pattern,
    required this.permissibleValueUnits,
    required this.permissibleRateUnits,
    required String? locale,
  }) : super(
          pattern: pattern,
          locale: locale,
        );

  final Set<WeightUnit> permissibleValueUnits;
  final Set<RateUnit> permissibleRateUnits;

  @override
  String getPatternSpecifierFor(WeightUnit valueUnit) => valueUnit.patternSpecifier;

  @override
  Set<RateUnit> getPermissibleRateUnits() => permissibleRateUnits;

  @override
  Set<WeightUnit> getPermissibleValueUnits() => permissibleValueUnits;

  @override
  String getUnitName(WeightUnit unit, String locale) => unit.getName(locale: locale);

  @override
  String getUnitSymbol(WeightUnit unit, String locale) => unit.getSymbol(locale: locale);
}
