import 'package:humanizer/humanizer.dart';

/// The default pattern used to format unit of measurement values.
const defaultValuePattern =
    '0.## ${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}';

/// The default pattern used to format rated unit of measurement values.
const defaultRatePattern =
    "0.## ${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}'/'${UnitOfMeasurementFormat.rateUnitSymbolFormatSpecifier}";

/// A transformation to convert an [Area] to a human-readable [String] by using an [AreaFormat].
///
/// See also:
/// * [AreaFormat]
class AreaTransformation extends Transformation<Area, String> {
  /// Creates an [AreaTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits].
  const AreaTransformation({
    this.pattern = defaultValuePattern,
    this.permissibleValueUnits = AreaUnits.commonSi,
  });

  /// The pattern passed through to the [AreaFormat].
  final String pattern;

  /// The permissible value units.
  final Set<AreaUnit> permissibleValueUnits;

  @override
  String transform(Area input, String locale) {
    final format = AreaFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}

/// A transformation to convert an [AreaRate] to a human-readable [String] by using an [AreaRateFormat].
///
/// See also:
/// * [AreaRateFormat]
class AreaRateTransformation extends Transformation<AreaRate, String> {
  /// Creates an [AreaRateTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits] and [permissibleRateUnits].
  const AreaRateTransformation({
    this.pattern = defaultRatePattern,
    this.permissibleValueUnits = AreaUnits.commonSi,
    this.permissibleRateUnits = RateUnits.hourOrLess,
  });

  /// The pattern passed through to the [AreaRateFormat].
  final String pattern;

  /// The permissible value units.
  final Set<AreaUnit> permissibleValueUnits;

  /// The permissible rate units.
  final Set<RateUnit> permissibleRateUnits;

  @override
  String transform(AreaRate input, String locale) {
    final format = AreaRateFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      permissibleRateUnits: permissibleRateUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}

/// A transformation to convert an [InformationSize] to a human-readable [String] by using an [InformationSizeFormat].
///
/// See also:
/// * [InformationSizeFormat]
class InformationSizeTransformation
    extends Transformation<InformationSize, String> {
  /// Creates an [InformationSizeTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits].
  const InformationSizeTransformation({
    this.pattern = defaultValuePattern,
    this.permissibleValueUnits = InformationUnits.iecBytes,
  });

  /// The pattern passed through to the [InformationSizeFormat].
  final String pattern;

  /// The permissible value units.
  final Set<InformationUnit> permissibleValueUnits;

  @override
  String transform(InformationSize input, String locale) {
    final format = InformationSizeFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}

/// A transformation to convert an [InformationRate] to a human-readable [String] by using an [InformationRateFormat].
///
/// See also:
/// * [InformationRateFormat]
class InformationRateTransformation
    extends Transformation<InformationRate, String> {
  /// Creates an [InformationRateTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits] and [permissibleRateUnits].
  const InformationRateTransformation({
    this.pattern = defaultRatePattern,
    this.permissibleValueUnits = InformationUnits.iecBytes,
    this.permissibleRateUnits = RateUnits.hourOrLess,
  });

  /// The pattern passed through to the [InformationRateFormat].
  final String pattern;

  /// The permissible value units.
  final Set<InformationUnit> permissibleValueUnits;

  /// The permissible rate units.
  final Set<RateUnit> permissibleRateUnits;

  @override
  String transform(InformationRate input, String locale) {
    final format = InformationRateFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      permissibleRateUnits: permissibleRateUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}

/// A transformation to convert a [Length] to a human-readable [String] by using a [LengthFormat].
///
/// See also:
/// * [LengthFormat]
class LengthTransformation extends Transformation<Length, String> {
  /// Creates a [LengthTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits].
  const LengthTransformation({
    this.pattern = defaultValuePattern,
    this.permissibleValueUnits = LengthUnits.commonSi,
  });

  /// The pattern passed through to the [LengthFormat].
  final String pattern;

  /// The permissible value units.
  final Set<LengthUnit> permissibleValueUnits;

  @override
  String transform(Length input, String locale) {
    final format = LengthFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}

/// A transformation to convert a [LengthRate] to a human-readable [String] by using a [LengthRateFormat].
///
/// See also:
/// * [LengthRateFormat]
class LengthRateTransformation extends Transformation<LengthRate, String> {
  /// Creates a [LengthRateTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits] and [permissibleRateUnits].
  const LengthRateTransformation({
    this.pattern = defaultRatePattern,
    this.permissibleValueUnits = LengthUnits.commonSi,
    this.permissibleRateUnits = RateUnits.hourOrLess,
  });

  /// The pattern passed through to the [LengthRateFormat].
  final String pattern;

  /// The permissible value units.
  final Set<LengthUnit> permissibleValueUnits;

  /// The permissible rate units.
  final Set<RateUnit> permissibleRateUnits;

  @override
  String transform(LengthRate input, String locale) {
    final format = LengthRateFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      permissibleRateUnits: permissibleRateUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}

/// A transformation to convert a [Quantity] to a human-readable [String] by using a [QuantityFormat].
///
/// See also:
/// * [QuantityFormat]
class QuantityTransformation extends Transformation<Quantity, String> {
  /// Creates a [QuantityTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits].
  const QuantityTransformation({
    this.pattern = defaultValuePattern,
    this.permissibleValueUnits = QuantityUnits.all,
  });

  /// The pattern passed through to the [QuantityFormat].
  final String pattern;

  /// The permissible value units.
  final Set<QuantityUnit> permissibleValueUnits;

  @override
  String transform(Quantity input, String locale) {
    final format = QuantityFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}

/// A transformation to convert a [QuantityRate] to a human-readable [String] by using a [QuantityRateFormat].
///
/// See also:
/// * [QuantityRateFormat]
class QuantityRateTransformation extends Transformation<QuantityRate, String> {
  /// Creates a [QuantityRateTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits] and [permissibleRateUnits].
  const QuantityRateTransformation({
    this.pattern = defaultRatePattern,
    this.permissibleValueUnits = QuantityUnits.all,
    this.permissibleRateUnits = RateUnits.hourOrLess,
  });

  /// The pattern passed through to the [QuantityRateFormat].
  final String pattern;

  /// The permissible value units.
  final Set<QuantityUnit> permissibleValueUnits;

  /// The permissible rate units.
  final Set<RateUnit> permissibleRateUnits;

  @override
  String transform(QuantityRate input, String locale) {
    final format = QuantityRateFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      permissibleRateUnits: permissibleRateUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}

/// A transformation to convert a [Temperature] to a human-readable [String] by using a [TemperatureFormat].
///
/// See also:
/// * [TemperatureFormat]
class TemperatureTransformation extends Transformation<Temperature, String> {
  /// Creates a [TemperatureTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits].
  const TemperatureTransformation({
    this.pattern = defaultValuePattern,
    this.permissibleValueUnits = TemperatureUnits.celsius,
  });

  /// The pattern passed through to the [TemperatureFormat].
  final String pattern;

  /// The permissible value units.
  final Set<TemperatureUnit> permissibleValueUnits;

  @override
  String transform(Temperature input, String locale) {
    final format = TemperatureFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}

/// A transformation to convert a [TemperatureRate] to a human-readable [String] by using a [TemperatureRateFormat].
///
/// See also:
/// * [TemperatureRateFormat]
class TemperatureRateTransformation
    extends Transformation<TemperatureRate, String> {
  /// Creates a [TemperatureRateTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits] and [permissibleRateUnits].
  const TemperatureRateTransformation({
    this.pattern = defaultRatePattern,
    this.permissibleValueUnits = TemperatureUnits.celsius,
    this.permissibleRateUnits = RateUnits.hourOrLess,
  });

  /// The pattern passed through to the [TemperatureRateFormat].
  final String pattern;

  /// The permissible value units.
  final Set<TemperatureUnit> permissibleValueUnits;

  /// The permissible rate units.
  final Set<RateUnit> permissibleRateUnits;

  @override
  String transform(TemperatureRate input, String locale) {
    final format = TemperatureRateFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      permissibleRateUnits: permissibleRateUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}

/// A transformation to convert a [Time] to a human-readable [String] by using a [TimeFormat].
///
/// See also:
/// * [TimeFormat]
class TimeTransformation extends Transformation<Time, String> {
  /// Creates a [TimeTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits].
  const TimeTransformation({
    this.pattern = defaultValuePattern,
    this.permissibleValueUnits = TimeUnits.common,
  });

  /// The pattern passed through to the [TimeFormat].
  final String pattern;

  /// The permissible value units.
  final Set<TimeUnit> permissibleValueUnits;

  @override
  String transform(Time input, String locale) {
    final format = TimeFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}

/// A transformation to convert a [TimeRate] to a human-readable [String] by using a [TimeRateFormat].
///
/// See also:
/// * [TimeRateFormat]
class TimeRateTransformation extends Transformation<TimeRate, String> {
  /// Creates a [TimeRateTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits] and [permissibleRateUnits].
  const TimeRateTransformation({
    this.pattern = defaultRatePattern,
    this.permissibleValueUnits = TimeUnits.common,
    this.permissibleRateUnits = RateUnits.hourOrLess,
  });

  /// The pattern passed through to the [TimeRateFormat].
  final String pattern;

  /// The permissible value units.
  final Set<TimeUnit> permissibleValueUnits;

  /// The permissible rate units.
  final Set<RateUnit> permissibleRateUnits;

  @override
  String transform(TimeRate input, String locale) {
    final format = TimeRateFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      permissibleRateUnits: permissibleRateUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}

/// A transformation to convert a [Volume] to a human-readable [String] by using a [VolumeFormat].
///
/// See also:
/// * [VolumeFormat]
class VolumeTransformation extends Transformation<Volume, String> {
  /// Creates a [VolumeTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits].
  const VolumeTransformation({
    this.pattern = defaultValuePattern,
    this.permissibleValueUnits = VolumeUnits.commonSi,
  });

  /// The pattern passed through to the [VolumeFormat].
  final String pattern;

  /// The permissible value units.
  final Set<VolumeUnit> permissibleValueUnits;

  @override
  String transform(Volume input, String locale) {
    final format = VolumeFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}

/// A transformation to convert a [VolumeRate] to a human-readable [String] by using a [VolumeRateFormat].
///
/// See also:
/// * [VolumeRateFormat]
class VolumeRateTransformation extends Transformation<VolumeRate, String> {
  /// Creates a [VolumeRateTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits] and [permissibleRateUnits].
  const VolumeRateTransformation({
    this.pattern = defaultRatePattern,
    this.permissibleValueUnits = VolumeUnits.commonSi,
    this.permissibleRateUnits = RateUnits.hourOrLess,
  });

  /// The pattern passed through to the [VolumeRateFormat].
  final String pattern;

  /// The permissible value units.
  final Set<VolumeUnit> permissibleValueUnits;

  /// The permissible rate units.
  final Set<RateUnit> permissibleRateUnits;

  @override
  String transform(VolumeRate input, String locale) {
    final format = VolumeRateFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      permissibleRateUnits: permissibleRateUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}

/// A transformation to convert a [Weight] to a human-readable [String] by using a [WeightFormat].
///
/// See also:
/// * [WeightFormat]
class WeightTransformation extends Transformation<Weight, String> {
  /// Creates a [WeightTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits].
  const WeightTransformation({
    this.pattern = defaultValuePattern,
    this.permissibleValueUnits = WeightUnits.commonSi,
  });

  /// The pattern passed through to the [WeightFormat].
  final String pattern;

  /// The permissible value units.
  final Set<WeightUnit> permissibleValueUnits;

  @override
  String transform(Weight input, String locale) {
    final format = WeightFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}

/// A transformation to convert a [WeightRate] to a human-readable [String] by using a [WeightRateFormat].
///
/// See also:
/// * [WeightRateFormat]
class WeightRateTransformation extends Transformation<WeightRate, String> {
  /// Creates a [WeightRateTransformation] that will format values using the specified [pattern], only using
  /// [permissibleValueUnits] and [permissibleRateUnits].
  const WeightRateTransformation({
    this.pattern = defaultRatePattern,
    this.permissibleValueUnits = WeightUnits.commonSi,
    this.permissibleRateUnits = RateUnits.hourOrLess,
  });

  /// The pattern passed through to the [WeightRateFormat].
  final String pattern;

  /// The permissible value units.
  final Set<WeightUnit> permissibleValueUnits;

  /// The permissible rate units.
  final Set<RateUnit> permissibleRateUnits;

  @override
  String transform(WeightRate input, String locale) {
    final format = WeightRateFormat(
      pattern: pattern,
      permissibleValueUnits: permissibleValueUnits,
      permissibleRateUnits: permissibleRateUnits,
      locale: locale,
    );
    final result = format.format(input);
    return result;
  }
}
