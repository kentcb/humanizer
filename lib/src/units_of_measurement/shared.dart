import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/string_predicate_extensions.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

/// Base class for units of measurement.
///
/// A unit of measurement is a value in the context of a specific measurement. That is, a quantity that is comparable to
/// other quantities of the same kind. Moreover, a unit of measurement typically contains various "units" of size to
/// make it practical to convey large ranges of values in a succinct and meaningful way.
///
/// This class serves as a base for concrete units of measurement. It encapsulates the majority of complexity required
/// for specific units of measurement, particularly generalized formatting support.
///
/// The [TValue] type is the specific unit of measurement (i.e. the subclass extending this class). [TUnit], on the
/// other hand, is a type (typically an enumeration) that differentiates different units within the unit of measurement.
/// For example, the [Length] unit of measurement uses [LengthUnit], which includes [LengthUnit.meter],
/// [LengthUnit.inch], and many more.
@immutable
abstract class UnitOfMeasurement<TUnit, TValue extends UnitOfMeasurement<TUnit, dynamic>>
    implements Comparable<TValue> {
  /// Creates a unit of measurement value with the specified [unit] and [value].
  @protected
  UnitOfMeasurement.fromUnits(
    TUnit unit,
    Rational value,
  ) {
    baseValue = getBaseValue(unit, value);
  }

  /// The underlying base value of the unit of measurement.
  @protected
  late final Rational baseValue;

  /// Creates a unit of measurement value with the specified [baseValue].
  @protected
  TValue createValue(Rational baseValue);

  /// Gets the number of [unit] units in this unit of measurement.
  @protected
  Rational getUnits(TUnit unit);

  /// Gets the base value for a unit of measurement of [unit] and [value].
  @protected
  Rational getBaseValue(TUnit unit, Rational value);

  /// Determines the largest unit that has a value of at least `1`.
  ///
  /// This method will determine which unit within [permissibleUnits] is the largest unit that has a value of at least
  /// `1`. This is typically useful to determine which unit should be used to visualize a unit of measurement.
  TUnit getLargestUnit({
    required Set<TUnit> permissibleUnits,
  }) {
    if (permissibleUnits.isEmpty) {
      throw ArgumentError('permissibleUnits cannot be empty');
    }

    TUnit? largestUnit;
    Rational? largestUnits;
    TUnit? smallestUnit;
    Rational? smallestUnits;

    for (final unit in permissibleUnits) {
      final units = getUnits(unit);

      // Logic is counterintuitive. If the number of units for a given unit is less than the current largest units,
      // and is more than one, that means we have at least one of those units and it is larger than the currently
      // selected unit because there are fewer of them.
      if (units >= Rationals.one && (largestUnits == null || units < largestUnits)) {
        largestUnit = unit;
        largestUnits = units;
      }

      if (smallestUnits == null || units > smallestUnits) {
        smallestUnit = unit;
        smallestUnits = units;
      }
    }

    if (largestUnit != null) {
      return largestUnit;
    } else {
      // None of the units has at least a value of 1, so return the smallest unit instead.
      return smallestUnit!;
    }
  }

  /// Rounds this unit of measurement such that the [roundTo] unit will be rounded towards the nearest integer.
  TValue round(TUnit roundTo) {
    final units = getUnits(roundTo);
    final roundedUnits = units.round().toRational();
    final baseValue = getBaseValue(roundTo, roundedUnits);
    final result = createValue(baseValue);
    return result;
  }

  /// Determines whether this unit of measurement value is equal to [other].
  ///
  /// Two units of measurement values are considered equal only if they are of the same type and their [baseValue] is
  /// the same.
  @override
  bool operator ==(Object other) => other is TValue && baseValue == other.baseValue;

  @override
  int get hashCode => baseValue.hashCode;

  /// Gets the absolute value.
  TValue abs() => createValue(baseValue.abs());

  /// Negates this value.
  TValue operator -() => createValue(-baseValue);

  /// Adds [other] onto this value.
  TValue operator +(TValue other) => createValue(baseValue + other.baseValue);

  /// Subtracts [other] from this value.
  TValue operator -(TValue other) => createValue(baseValue - other.baseValue);

  /// Multiplies this value by [factor].
  TValue operator *(Rational factor) => createValue(baseValue * factor);

  /// Divides this value by [divisor].
  TValue operator /(Rational divisor) => createValue(baseValue / divisor);

  /// Determines whether this value is less than [other].
  bool operator <(TValue other) => baseValue < other.baseValue;

  /// Determines whether this value is less than or equal to [other].
  bool operator <=(TValue other) => baseValue <= other.baseValue;

  /// Determines whether this value is greater than [other].
  bool operator >(TValue other) => baseValue > other.baseValue;

  /// Determines whether this value is greater than or equal to [other].
  bool operator >=(TValue other) => baseValue >= other.baseValue;

  @override
  int compareTo(TValue other) => baseValue.compareTo(other.baseValue);
}

/// Base class for a unit of measurement rate.
///
/// A unit of measurement rate is the combination of a unit of measurement [value] and a [period] that indicates how
/// often that value is occurring or compounding.
abstract class UnitOfMeasurementRate<TValue extends UnitOfMeasurement<dynamic, dynamic>> {
  /// Creates a unit of measurement rate with the specified [value] and [period].
  const UnitOfMeasurementRate({
    required this.value,
    required this.period,
  });

  /// The underlying unit of measurement value.
  final TValue value;

  /// How often the [value] is occurring.
  final Duration period;

  @override
  bool operator ==(Object other) =>
      other is UnitOfMeasurementRate<TValue> && value == other.value && period == other.period;

  @override
  int get hashCode => value.hashCode * period.hashCode;
}

/// Defines valid units for rates.
enum RateUnit {
  /// Every second.
  second,

  /// Every minute.
  minute,

  /// Every hour.
  hour,

  /// Every day.
  day,

  /// Every week.
  week,
}

/// Provides convenience sets of commonly used [RateUnit]s.
class RateUnits {
  /// Contains all defined [RateUnit]s.
  static const all = <RateUnit>{
    RateUnit.second,
    RateUnit.minute,
    RateUnit.hour,
    RateUnit.day,
    RateUnit.week,
  };

  /// Contains rate units of one hour or less.
  static const hourOrLess = <RateUnit>{
    RateUnit.second,
    RateUnit.minute,
    RateUnit.hour,
  };
}

/// Defines extensions on [RateUnit].
extension RateUnitExtensions on RateUnit {
  /// Gets the [Duration] corresponding to this [RateUnit].
  Duration get duration {
    switch (this) {
      case RateUnit.second:
        return const Duration(seconds: 1);
      case RateUnit.minute:
        return const Duration(minutes: 1);
      case RateUnit.hour:
        return const Duration(hours: 1);
      case RateUnit.day:
        return const Duration(days: 1);
      case RateUnit.week:
        return const Duration(days: 7);
    }
  }

  /// Gets a localized name for this [RateUnit].
  String getName({
    required String locale,
  }) {
    switch (this) {
      case RateUnit.second:
        return 'second';
      case RateUnit.minute:
        return 'minute';
      case RateUnit.hour:
        return 'hour';
      case RateUnit.day:
        return 'day';
      case RateUnit.week:
        return 'week';
    }
  }

  /// Gets a localized symbol for this [RateUnit].
  String getSymbol({required String locale}) {
    switch (this) {
      case RateUnit.second:
        return 's';
      case RateUnit.minute:
        return 'min';
      case RateUnit.hour:
        return 'hr';
      case RateUnit.day:
        return 'day';
      case RateUnit.week:
        return 'wk';
    }
  }

  /// Gets the pattern specifier for this [RateUnit].
  String get patternSpecifier => getSymbol(
        locale: 'en',
      );
}

/// Base class for unit of measurement formats.
///
/// Individual formatters for units of measurement extend this class to obtain the majority of the necessary
/// implementation. The [TValue] type represents the values being formatted. That is, the unit of measurement values or
/// their rated variants.
///
/// The [TUnit] type (typically an enumeration) represents the valid units for that unit of measurement.
///
/// The format is specified as a [pattern], which supports the following components:
///
/// | Specifier | Description |
/// |:-|:-|
/// | `u` | The symbol of the value's unit, automatically inferred based on the value being formatted. |
/// | `u:$UNIT_SPECIFIER` | The symbol of the value's unit, explicitly specified after the colon. |
/// | `U` | The name of the value's unit, automatically inferred based on the value being formatted. |
/// | `U:$UNIT_SPECIFIER` | The name of the value's unit, explicitly specified after the colon. |
/// | `r` | The symbol of the rate's unit (if applicable), automatically inferred based on the value being formatted. |
/// | `r:$RATE_SPECIFIER` | The symbol of the rate's unit (if applicable), explicitly specified after the colon. |
/// | `R` | The name of the rate's unit (if applicable), automatically inferred based on the value being formatted. |
/// | `R:$RATE_SPECIFIER` | The name of the rate's unit (if applicable), explicitly specified after the colon. |
/// | `'` | Used to demarcate verbatim output |
/// | (any other character) | Forwarded onto a [NumberFormat]. |
///
/// Rate unit specifiers are common across all rated values:
///
/// | Unit | Specifier |
/// |:-|:-|
/// | seconds | `s` |
/// | minutes | `min` |
/// | hours | `hr` |
/// | days | `day` |
/// | weeks | `wk` |
///
/// Value unit specifiers are specific to the unit of measurement value being formatted and can be found in the
/// documentation for the relevant format implementation.
///
/// See also:
/// * [NumberFormat]
abstract class UnitOfMeasurementFormat<TValue, TUnit> {
  /// Creates a unit of measurement format with the specified [pattern] and [locale].
  UnitOfMeasurementFormat({
    required this.pattern,
    this.locale,
  }) {
    _nodes = _parseNodes(pattern);
  }

  /// The format specifier for a unit symbol.
  static const valueUnitSymbolFormatSpecifier = 'u';

  /// The format specifier for a unit name.
  static const valueUnitNameFormatSpecifier = 'U';

  /// The format specifier for a rate symbol.
  static const rateUnitSymbolFormatSpecifier = 'r';

  /// The format specifier for a rate name.
  static const rateUnitNameFormatSpecifier = 'R';

  /// The pattern that indicates the desired output when formatting input values.
  final String pattern;

  /// The locale to use when formatting values.
  final String? locale;

  bool get _supportsRateUnits => getPermissibleRateUnits().isNotEmpty;

  late final List<_Node> _nodes;

  /// Gets a set of permissible [TUnit] values.
  ///
  /// A format instance does not necessarily support all [TUnit] values. It may support only a subset thereof,
  /// thereby giving the caller control over what units to use when formatting values.
  @protected
  Set<TUnit> getPermissibleValueUnits();

  /// Gets a set of permissible [RateUnit] values.
  ///
  /// A format instance does not necessarily support all [RateUnit] values. It may support only a subset thereof,
  /// thereby giving the caller control over what units to use when formatting values.
  ///
  /// Note that this method is only relevant to rate-based inputs. In other cases, the implementation can simply return
  /// an empty set.
  @protected
  Set<RateUnit> getPermissibleRateUnits();

  /// Determines whether value units should be pluralized. Defaults to `true`.
  @protected
  bool pluralizeValueUnits(String locale) => true;

  /// Gets the pattern specifier for the given value unit.
  @protected
  String getPatternSpecifierFor(TUnit valueUnit);

  /// Scales [input], which is assumed to be a rated unit of measurement, so that its rate is [rateUnit].
  ///
  /// This method is irrelevant to non rated units of measurement, which can simply throw [UnsupportedError].
  @protected
  TValue scaleToRateUnit(TValue input, RateUnit rateUnit);

  /// Determines how many units of [unit] the [input] contains, including any fractional portion.
  @protected
  Rational getUnitQuantity(TValue input, TUnit unit);

  /// Determines the largest denomination of unit in [input] that has a value of at least `1`.
  @protected
  TUnit getLargestUnit(TValue input);

  /// Gets the a [unit] symbol in the given [locale].
  @protected
  String getUnitSymbol(TUnit unit, String locale);

  /// Gets the a [unit] name in the given [locale].
  @protected
  String getUnitName(TUnit unit, String locale);

  /// Formats [input] according to the [pattern] and [locale] of this format.
  String format(TValue input) => _formatWithLocale(input, locale ?? Intl.getCurrentLocale());

  String _formatWithLocale(TValue input, String locale) {
    final fixedValueUnit = _nodes
        .where((node) => node is _DynamicValueUnitNode<TUnit> || node is _FixedValueUnitNode<TUnit>)
        .map((node) => node is _FixedValueUnitNode<TUnit> ? node.valueUnit : null)
        .firstWhere(
          (element) => true,
          orElse: () => null,
        );
    RateUnit? rateUnit;
    var scaledInput = input;

    if (_supportsRateUnits) {
      final fixedRateUnit = _nodes
          .where((node) => node is _DynamicRateUnitNode<TUnit> || node is _FixedRateUnitNode<TUnit>)
          .map((node) => node is _FixedRateUnitNode<TUnit> ? node.rateUnit : null)
          .firstWhere(
            (element) => true,
            orElse: () => null,
          );

      rateUnit = fixedRateUnit;

      if (rateUnit == null) {
        // Find the best rate unit to use by determining what the scaled value would be for each rate, then sorting
        // those values by how human-readable they are.
        final preferredRatedValue = (getPermissibleRateUnits().map((supportedRateUnit) {
          final scaled = scaleToRateUnit(input, supportedRateUnit);
          final valueUnit = fixedValueUnit ?? getLargestUnit(scaled);
          final quantity = getUnitQuantity(scaled, valueUnit);

          return ComparableRatedValue(quantity, supportedRateUnit);
        }).toList(growable: false)
              ..sort())
            .first;

        rateUnit = preferredRatedValue.rateUnit;
      }

      // Now that we know the rate unit, we need to scale the input accordingly.
      scaledInput = scaleToRateUnit(input, rateUnit);
    }

    // We can now determine the value unit based on the scaled input.
    final valueUnit = fixedValueUnit ?? getLargestUnit(scaledInput);
    final quantity = getUnitQuantity(scaledInput, valueUnit);
    final context = _NodeEvaluationContext<TUnit>(
      valueUnit: valueUnit,
      valueUnitName: getUnitName(valueUnit, locale),
      valueUnitSymbol: getUnitSymbol(valueUnit, locale),
      pluralizeValueUnit: pluralizeValueUnits(locale),
      rateUnit: rateUnit,
      value: quantity,
      locale: locale,
    );
    final result = _nodes.map((node) => node.evaluate(context)).join('').trim();
    return result;
  }

  List<_Node> _parseNodes(String pattern) {
    // Given the simplicity of the syntax, we can parse directly into nodes rather than transforming to tokens first.
    final supportedValueUnits = getPermissibleValueUnits();
    final supportedRateUnits = getPermissibleRateUnits();
    final supportedValueUnitSymbolPatternSpecifiers = Map.fromEntries(<MapEntry<String, TUnit?>>[
      const MapEntry(valueUnitSymbolFormatSpecifier, null),
      ...supportedValueUnits
          .map((unit) => MapEntry('$valueUnitSymbolFormatSpecifier:${getPatternSpecifierFor(unit)}', unit)),
    ]);
    final supportedValueUnitNamePatternSpecifiers = Map.fromEntries(<MapEntry<String, TUnit?>>[
      const MapEntry(valueUnitNameFormatSpecifier, null),
      ...supportedValueUnits
          .map((unit) => MapEntry('$valueUnitNameFormatSpecifier:${getPatternSpecifierFor(unit)}', unit)),
    ]);
    final supportedRateUnitSymbolPatternSpecifiers = Map.fromEntries(<MapEntry<String, RateUnit?>>[
      const MapEntry(rateUnitSymbolFormatSpecifier, null),
      ...supportedRateUnits.map((unit) => MapEntry('$rateUnitSymbolFormatSpecifier:${unit.patternSpecifier}', unit)),
    ]);
    final supportedRateUnitNamePatternSpecifiers = Map.fromEntries(<MapEntry<String, RateUnit?>>[
      const MapEntry(rateUnitNameFormatSpecifier, null),
      ...supportedRateUnits.map((unit) => MapEntry('$rateUnitNameFormatSpecifier:${unit.patternSpecifier}', unit)),
    ]);

    var index = 0;
    final result = <_Node<TUnit>>[];

    void throwIfEndOfInput(String reason) {
      if (index == pattern.length) {
        throw FormatException('Unexpected end of input: $reason');
      }
    }

    String parseString() {
      ++index;
      final literalValue = StringBuffer();

      for (;;) {
        throwIfEndOfInput('unterminated string');

        final ch = pattern[index];

        switch (ch) {
          case '\'':
            return literalValue.toString();

          case '\\':
            // Escaped character.
            ++index;
            throwIfEndOfInput('escape sequence incomplete');

            final escapedCh = pattern[index];

            switch (escapedCh) {
              case 't':
                literalValue.write('\t');
                break;
              case 'r':
                literalValue.write('\r');
                break;
              case 'n':
                literalValue.write('\n');
                break;
              case '\'':
                literalValue.write('\'');
                break;
              case '"':
                literalValue.write('"');
                break;
              case '\\':
                literalValue.write('\\');
                break;
              default:
                literalValue.write(escapedCh);
                break;
            }

            break;

          default:
            literalValue.write(ch);
            break;
        }

        ++index;
      }
    }

    bool isWhitespace(String ch) => ch == ' ' || ch == '\t' || ch == '\r' || ch == '\n';

    bool isNumberFormat(String ch) =>
        ch == '0' ||
        ch == '#' ||
        ch == '.' ||
        ch == '-' ||
        ch == ',' ||
        ch == 'E' ||
        ch == '+' ||
        ch == '%' ||
        ch == '‰' ||
        ch == '¤' ||
        ch == ';';

    String parseWhitespace() {
      final literalValue = StringBuffer();
      assert(isWhitespace(pattern[index]));
      literalValue.write(pattern[index]);

      while (index < (pattern.length - 1) && isWhitespace(pattern[index + 1])) {
        ++index;
        literalValue.write(pattern[index]);
      }

      return literalValue.toString();
    }

    String parseNumberFormat() {
      final value = StringBuffer()..write(pattern[index]);

      while (index < (pattern.length - 1) && isNumberFormat(pattern[index + 1])) {
        ++index;
        value.write(pattern[index]);
      }

      return value.toString();
    }

    String parseOther() {
      final value = StringBuffer()..write(pattern[index]);

      while (index < (pattern.length - 1) &&
          pattern[index + 1] != '\'' &&
          !isWhitespace(pattern[index + 1]) &&
          !isNumberFormat(pattern[index + 1])) {
        ++index;
        value.write(pattern[index]);
      }

      return value.toString();
    }

    while (index < pattern.length) {
      final ch = pattern[index];

      if (ch == '\'') {
        // Any single-quoted text is wrapped in a literal node.
        final value = parseString();
        final node = _LiteralNode<TUnit>(value);
        result.add(node);
      } else if (ch.isBlank()) {
        // Whitespace is also wrapped in a literal node.
        final value = parseWhitespace();
        final node = _LiteralNode<TUnit>(value);
        result.add(node);
      } else if (isNumberFormat(ch)) {
        final format = parseNumberFormat();
        final node = _NumberFormatNode<TUnit>(format);
        result.add(node);
      } else {
        // For anything else, we'll have to assume it's a unit reference.
        final value = parseOther();

        if (supportedValueUnitSymbolPatternSpecifiers.containsKey(value)) {
          final unit = supportedValueUnitSymbolPatternSpecifiers[value];
          final node = unit == null ? _DynamicValueUnitSymbolNode<TUnit>() : _FixedValueUnitSymbolNode<TUnit>(unit);
          result.add(node);
        } else if (supportedValueUnitNamePatternSpecifiers.containsKey(value)) {
          final unit = supportedValueUnitNamePatternSpecifiers[value];
          final node = unit == null ? _DynamicValueUnitNameNode<TUnit>() : _FixedValueUnitNameNode<TUnit>(unit);
          result.add(node);
        } else if (supportedRateUnitSymbolPatternSpecifiers.containsKey(value)) {
          final unit = supportedRateUnitSymbolPatternSpecifiers[value];
          final node = unit == null ? _DynamicRateUnitSymbolNode<TUnit>() : _FixedRateUnitSymbolNode<TUnit>(unit);
          result.add(node);
        } else if (supportedRateUnitNamePatternSpecifiers.containsKey(value)) {
          final unit = supportedRateUnitNamePatternSpecifiers[value];
          final node = unit == null ? _DynamicRateUnitNameNode<TUnit>() : _FixedRateUnitNameNode<TUnit>(unit);
          result.add(node);
        } else {
          throw FormatException('Unsupported unit specifier: $value');
        }
      }

      ++index;
    }

    final hasDynamicUnit = result.any((node) => node is _DynamicValueUnitNode);
    final fixedUnits = result.whereType<_FixedValueUnitNode>().map((node) => node.valueUnit).toList();
    final hasFixedUnits = fixedUnits.isNotEmpty;

    if (hasDynamicUnit && hasFixedUnits) {
      throw const FormatException('Cannot include both dynamic and fixed units in the format string');
    } else if (fixedUnits.toSet().length > 1) {
      throw const FormatException('Cannot include more than one unique fixed unit');
    }

    return result;
  }
}

class _NodeEvaluationContext<TValueUnit> {
  _NodeEvaluationContext({
    required this.valueUnit,
    required this.valueUnitSymbol,
    required this.valueUnitName,
    required this.pluralizeValueUnit,
    required this.rateUnit,
    required this.value,
    required this.locale,
  });

  final TValueUnit valueUnit;
  final String valueUnitSymbol;
  final String valueUnitName;
  final bool pluralizeValueUnit;
  final RateUnit? rateUnit;
  final Rational value;
  final String locale;
}

abstract class _Node<TValueUnit> {
  const _Node();

  String evaluate(_NodeEvaluationContext<TValueUnit> context);
}

class _LiteralNode<TValueUnit> extends _Node<TValueUnit> {
  _LiteralNode(this.literal);

  final String literal;

  @override
  String evaluate(_NodeEvaluationContext<TValueUnit> context) => literal;
}

class _NumberFormatNode<TValueUnit> extends _Node<TValueUnit> {
  _NumberFormatNode(this.format);

  final String format;

  @override
  String evaluate(_NodeEvaluationContext<TValueUnit> context) {
    final numberFormat = NumberFormat(format, context.locale);
    final result = numberFormat
        .format(DecimalIntl(context.value.toDecimal(scaleOnInfinitePrecision: numberFormat.decimalDigits ?? 10)));
    return result;
  }
}

abstract class _DynamicValueUnitNode<TValueUnit> extends _Node<TValueUnit> {
  const _DynamicValueUnitNode();
}

class _DynamicValueUnitSymbolNode<TValueUnit> extends _DynamicValueUnitNode<TValueUnit> {
  const _DynamicValueUnitSymbolNode();

  @override
  String evaluate(_NodeEvaluationContext<TValueUnit> context) => context.valueUnitSymbol;
}

class _DynamicValueUnitNameNode<TValueUnit> extends _DynamicValueUnitNode<TValueUnit> {
  const _DynamicValueUnitNameNode();

  @override
  String evaluate(_NodeEvaluationContext<TValueUnit> context) => context.pluralizeValueUnit
      ? context.valueUnitName.pluralizeLastWordOnly(
          quantity: context.value,
          locale: context.locale,
        )
      : context.valueUnitName;
}

abstract class _FixedValueUnitNode<TValueUnit> extends _Node<TValueUnit> {
  const _FixedValueUnitNode(this.valueUnit);

  final TValueUnit valueUnit;
}

class _FixedValueUnitSymbolNode<TValueUnit> extends _FixedValueUnitNode<TValueUnit> {
  _FixedValueUnitSymbolNode(TValueUnit unit) : super(unit);

  @override
  String evaluate(_NodeEvaluationContext<TValueUnit> context) => context.valueUnitSymbol;
}

class _FixedValueUnitNameNode<TValueUnit> extends _FixedValueUnitNode<TValueUnit> {
  _FixedValueUnitNameNode(TValueUnit unit) : super(unit);

  @override
  String evaluate(_NodeEvaluationContext<TValueUnit> context) => context.pluralizeValueUnit
      ? context.valueUnitName.pluralizeLastWordOnly(
          quantity: context.value,
          locale: context.locale,
        )
      : context.valueUnitName;
}

abstract class _DynamicRateUnitNode<TValueUnit> extends _Node<TValueUnit> {
  const _DynamicRateUnitNode();
}

class _DynamicRateUnitSymbolNode<TValueUnit> extends _DynamicRateUnitNode<TValueUnit> {
  const _DynamicRateUnitSymbolNode();

  @override
  String evaluate(_NodeEvaluationContext<TValueUnit> context) => context.rateUnit!.getSymbol(
        locale: context.locale,
      );
}

class _DynamicRateUnitNameNode<TValueUnit> extends _DynamicRateUnitNode<TValueUnit> {
  const _DynamicRateUnitNameNode();

  @override
  String evaluate(_NodeEvaluationContext<TValueUnit> context) => context.rateUnit!.getName(
        locale: context.locale,
      );
}

abstract class _FixedRateUnitNode<TValueUnit> extends _Node<TValueUnit> {
  const _FixedRateUnitNode(this.rateUnit);

  final RateUnit rateUnit;
}

class _FixedRateUnitSymbolNode<TValueUnit> extends _FixedRateUnitNode<TValueUnit> {
  _FixedRateUnitSymbolNode(RateUnit unit) : super(unit);

  @override
  String evaluate(_NodeEvaluationContext<TValueUnit> context) => rateUnit.getSymbol(
        locale: context.locale,
      );
}

class _FixedRateUnitNameNode<TValueUnit> extends _FixedRateUnitNode<TValueUnit> {
  _FixedRateUnitNameNode(RateUnit unit) : super(unit);

  @override
  String evaluate(_NodeEvaluationContext<TValueUnit> context) => context.rateUnit!.getName(
        locale: context.locale,
      );
}

extension _StringExtensions on String {
  String pluralizeLastWordOnly({
    required Rational quantity,
    required String locale,
  }) {
    final split = this.split(r' ');
    final lastIndex = split.length - 1;
    split[lastIndex] = split[lastIndex].toPluralFormForQuantity(
      quantity: quantity.toDouble(),
      includeQuantity: false,
      locale: locale,
    );
    final result = split.join(' ');
    return result;
  }
}

// I hate to expose this even with @visibleForTesting, but I really want to test its logic directly rather than
// requiring mental gymnastics to determine what inputs to feed into formatting a rated unit of measurement to exercise
// the logic within this class.
@visibleForTesting
class ComparableRatedValue implements Comparable<ComparableRatedValue> {
  const ComparableRatedValue(
    this.value,
    this.rateUnit,
  );

  final Rational value;
  final RateUnit rateUnit;

  @override
  int compareTo(ComparableRatedValue other) {
    if (value.hasFinitePrecision && !other.value.hasFinitePrecision) {
      return -1;
    } else if (!value.hasFinitePrecision && other.value.hasFinitePrecision) {
      return 1;
    }

    if (value.hasFinitePrecision) {
      assert(other.value.hasFinitePrecision);

      final valueDecimal = value.toDecimal();
      final otherValueDecimal = other.value.toDecimal();

      final comparePrecision = valueDecimal.precision.compareTo(otherValueDecimal.precision);

      if (comparePrecision != 0) {
        return comparePrecision;
      }

      final compareScale = valueDecimal.scale.compareTo(otherValueDecimal.scale);

      if (compareScale != 0) {
        return compareScale;
      }
    }

    final currentDistanceFrom1 = (value - Rationals.one).abs();
    final proposedDistanceFrom1 = (other.value - Rationals.one).abs();

    return currentDistanceFrom1.compareTo(proposedDistanceFrom1);
  }

  @override
  String toString() => value.toString();
}
