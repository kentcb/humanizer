import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';
import 'package:humanizer/src/units_of_measurement/weight_constants.dart';
import 'package:meta/meta.dart';

/// A unit of measurement representing a weight.
class Weight extends UnitOfMeasurement<WeightUnit, Weight> {
  /// Creates a [Weight] given a [unit] and decimal [value] for that unit.
  Weight.fromUnits(WeightUnit unit, Rational value) : super.fromUnits(unit, value);

  /// Creates a [Weight] representing the specified number of [nanograms].
  factory Weight.fromNanograms(Rational nanograms) => Weight.fromUnits(WeightUnit.nanogram, nanograms);

  /// Creates a [Weight] representing the specified number of [micrograms].
  factory Weight.fromMicrograms(Rational micrograms) => Weight.fromUnits(WeightUnit.microgram, micrograms);

  /// Creates a [Weight] representing the specified number of [milligrams].
  factory Weight.fromMilligrams(Rational milligrams) => Weight.fromUnits(WeightUnit.milligram, milligrams);

  /// Creates a [Weight] representing the specified number of [grams].
  factory Weight.fromGrams(Rational grams) => Weight.fromUnits(WeightUnit.gram, grams);

  /// Creates a [Weight] representing the specified number of [ounces].
  factory Weight.fromOunces(Rational ounces) => Weight.fromUnits(WeightUnit.ounce, ounces);

  /// Creates a [Weight] representing the specified number of [pounds].
  factory Weight.fromPounds(Rational pounds) => Weight.fromUnits(WeightUnit.pound, pounds);

  /// Creates a [Weight] representing the specified number of [kilograms].
  factory Weight.fromKilograms(Rational kilograms) => Weight.fromUnits(WeightUnit.kilogram, kilograms);

  /// Creates a [Weight] representing the specified number of [usTons].
  factory Weight.fromUsTons(Rational usTons) => Weight.fromUnits(WeightUnit.usTon, usTons);

  /// Creates a [Weight] representing the specified number of [tonnes].
  factory Weight.fromTonnes(Rational tonnes) => Weight.fromUnits(WeightUnit.tonne, tonnes);

  /// Creates a [Weight] representing the specified number of [imperialTons].
  factory Weight.fromImperialTons(Rational imperialTons) => Weight.fromUnits(WeightUnit.imperialTon, imperialTons);

  /// Creates a [Weight] representing the specified number of [megatonnes].
  factory Weight.fromMegatonnes(Rational megatonnes) => Weight.fromUnits(WeightUnit.megatonne, megatonnes);

  /// Creates a [Weight] representing the specified number of [gigatonnes].
  factory Weight.fromGigatonnes(Rational gigatonnes) => Weight.fromUnits(WeightUnit.gigatonne, gigatonnes);

  /// A [Weight] of size zero.
  static final zero = Weight.fromNanograms(Rationals.zero);

  static final _defaultFormat = WeightFormat();

  /// Gets the number of nanograms in this [Weight], including any fractional portion.
  Rational get nanograms => getUnits(WeightUnit.nanogram);

  /// Gets the number of micrograms in this [Weight], including any fractional portion.
  Rational get micrograms => getUnits(WeightUnit.microgram);

  /// Gets the number of milligrams in this [Weight], including any fractional portion.
  Rational get milligrams => getUnits(WeightUnit.milligram);

  /// Gets the number of grams in this [Weight], including any fractional portion.
  Rational get grams => getUnits(WeightUnit.gram);

  /// Gets the number of ounces in this [Weight], including any fractional portion.
  Rational get ounces => getUnits(WeightUnit.ounce);

  /// Gets the number of pounds in this [Weight], including any fractional portion.
  Rational get pounds => getUnits(WeightUnit.pound);

  /// Gets the number of kilograms in this [Weight], including any fractional portion.
  Rational get kilograms => getUnits(WeightUnit.kilogram);

  /// Gets the number of usTons in this [Weight], including any fractional portion.
  Rational get usTons => getUnits(WeightUnit.usTon);

  /// Gets the number of tonnes in this [Weight], including any fractional portion.
  Rational get tonnes => getUnits(WeightUnit.tonne);

  /// Gets the number of imperialTons in this [Weight], including any fractional portion.
  Rational get imperialTons => getUnits(WeightUnit.imperialTon);

  /// Gets the number of megatonnes in this [Weight], including any fractional portion.
  Rational get megatonnes => getUnits(WeightUnit.megatonne);

  /// Gets the number of gigatonnes in this [Weight], including any fractional portion.
  Rational get gigatonnes => getUnits(WeightUnit.gigatonne);

  /// Creates a [WeightRate] with the specified [period] from this value.
  WeightRate per(Duration period) => WeightRate._(
        value: this,
        period: period,
      );

  @override
  Rational getUnits(WeightUnit unit) => baseValue / unit._gramCount;

  @override
  String toString() => _defaultFormat.format(this);

  @override
  @protected
  Weight createValue(Rational baseValue) => Weight.fromGrams(baseValue);

  @override
  @protected
  Rational getBaseValue(WeightUnit unit, Rational value) => value * unit._gramCount;
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

  /// A unit representing US tons, also known as a "short ton" or, coloquially, a "ton".
  usTon,

  /// A unit representing (metric) tonnes.
  tonne,

  /// A unit representing imperial tons, also known as a "long ton" or "displacement ton".
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
    // SI.
    WeightUnit.nanogram,
    WeightUnit.microgram,
    WeightUnit.milligram,
    WeightUnit.gram,
    WeightUnit.kilogram,
    WeightUnit.tonne,
    WeightUnit.megatonne,
    WeightUnit.gigatonne,

    // Imperial.
    WeightUnit.ounce,
    WeightUnit.pound,
    WeightUnit.imperialTon,

    // US.
    WeightUnit.usTon,
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
  Rational get _gramCount {
    switch (this) {
      // SI.
      case WeightUnit.nanogram:
        return gramsInNanogram;
      case WeightUnit.microgram:
        return gramsInMicrogram;
      case WeightUnit.milligram:
        return gramsInMilligram;
      case WeightUnit.gram:
        return gramsInGram;
      case WeightUnit.kilogram:
        return gramsInKilogram;
      case WeightUnit.tonne:
        return gramsInTonne;
      case WeightUnit.megatonne:
        return gramsInMegatonne;
      case WeightUnit.gigatonne:
        return gramsInGigatonne;

      // Imperial.
      case WeightUnit.ounce:
        return gramsInOunce;
      case WeightUnit.pound:
        return gramsInPound;
      case WeightUnit.imperialTon:
        return gramsInImperialTon;

      // US.
      case WeightUnit.usTon:
        return gramsInUsTon;
    }
  }

  /// Gets a localized name for this unit.
  String getName({
    required String locale,
  }) {
    switch (this) {
      // SI.
      case WeightUnit.nanogram:
        return 'nanogram';
      case WeightUnit.microgram:
        return 'microgram';
      case WeightUnit.milligram:
        return 'milligram';
      case WeightUnit.gram:
        return 'gram';
      case WeightUnit.kilogram:
        return 'kilogram';
      case WeightUnit.tonne:
        return 'tonne';
      case WeightUnit.megatonne:
        return 'megatonne';
      case WeightUnit.gigatonne:
        return 'gigatonne';

      // Imperial.
      case WeightUnit.ounce:
        return 'ounce';
      case WeightUnit.pound:
        return 'pound';
      case WeightUnit.imperialTon:
        return 'ton';

      // US.
      case WeightUnit.usTon:
        return 'ton';
    }
  }

  /// Gets a localized symbol for this unit.
  String getSymbol({
    required String locale,
  }) {
    switch (this) {
      // SI.
      case WeightUnit.nanogram:
        return 'ng';
      case WeightUnit.microgram:
        return 'µg';
      case WeightUnit.milligram:
        return 'mg';
      case WeightUnit.gram:
        return 'g';
      case WeightUnit.kilogram:
        return 'kg';
      case WeightUnit.tonne:
        return 't';
      case WeightUnit.megatonne:
        return 'Mt';
      case WeightUnit.gigatonne:
        return 'Gt';

      // Imperial.
      case WeightUnit.ounce:
        return 'oz';
      case WeightUnit.pound:
        return 'lb';
      case WeightUnit.imperialTon:
        return 'ton';

      // US.
      case WeightUnit.usTon:
        return 'ton';
    }
  }

  /// Gets the pattern specifier for this unit.
  String get patternSpecifier {
    switch (this) {
      // Imperial.
      case WeightUnit.imperialTon:
        return 't_imp';

      // US.
      case WeightUnit.usTon:
        return 't_us';

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

  static final _defaultFormat = WeightRateFormat();

  @override
  String toString() => _defaultFormat.format(this);
}

/// Allows a [Weight] to be formatted.
///
/// See [UnitOfMeasurementFormat] for general notes on the pattern syntax, which you can combine with the [WeightUnit]
/// pattern specifiers as required:
///
/// | | Unit | Specifier |
/// |:-|:-|:-|
/// | **S.I.** | nanogram | `ng` |
/// | | microgram | `µg` |
/// | | milligram | `mg` |
/// | | gram | `g ` |
/// | | kilogram | `kg` |
/// | | tonne | `t` |
/// | | megatonne | `Mt` |
/// | | gigatonne | `Gt` |
/// | **Imperial** | ounce | `oz` |
/// | | pound | `lb` |
/// | | imperial ton | `t_imp` |
/// | **U.S.** | US ton | `t_us` |
///
/// ```
/// final weight = 42.kilograms();
///
/// // '42kg'
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
    String pattern = '0.##${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}',
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
  Rational getUnitQuantity(Weight input, WeightUnit unit) => input.getUnits(unit);

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
/// // '42kg/s'
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
        "0.##${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}'/'${UnitOfMeasurementFormat.rateUnitSymbolFormatSpecifier}",
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
  Rational getUnitQuantity(WeightRate input, WeightUnit unit) => input.value.getUnits(unit);

  @override
  WeightRate scaleToRateUnit(WeightRate input, RateUnit rateUnit) {
    final scaledPeriod = rateUnit.duration;
    final scale = Rational.fromInt(scaledPeriod.inMicroseconds) / Rational.fromInt(input.period.inMicroseconds);
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
