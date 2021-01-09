import 'package:humanizer/src/string_predicates.dart';

/// Provides symbol-related humanizing extensions on [String].
extension HumanizeSymbolNameExtensions on String {
  static final _camelOrPascalCaseWordPartsExpression = RegExp(
    r'[\p{Lu}]?[\p{Ll}]+|[0-9]+[\p{Ll}]*|[\p{Lu}]+(?=[\p{Lu}][\p{Ll}]|[0-9]|\b)|[\p{Lo}]+',
    unicode: true,
  );
  static final _snakeOrKebabCaseWordPartsExpression = RegExp(
    r'[^-_\p{Pc}\p{Pd}\p{Pe}\p{Pf}\p{Pi}\p{Po}\p{Ps}\p{Sc}\p{Sk}\p{Sm}\p{So}]+',
    unicode: true,
  );
  static final _underscoreOrHyphenExpression = RegExp(r'[_-]');
  static final _underscoreOrHyphenWithSurroundingSpaceExpression = RegExp(r'\s[_-]|[_-]\s');

  /// Gets a humanized transformation of this [String] under the assumption that it is camel-, pascal-, snake-, or
  /// kebab-cased.
  ///
  /// Supports the following transformations:
  /// * Camel-cased input is transformed to a sentence. e.g. `camelCaseInputString` is transformed to `Camel case
  ///   input string`.
  /// * Pascal-cased input is transformed to a sentence. e.g. `PascalCaseInputString` is transformed to `Pascal case
  ///   input string`.
  /// * Snake-cased input is transformed to a sentence. e.g. `snake_case_input_string` is transformed to `Snake case
  ///   input string`.
  /// * Kebab-cased input is transformed to a sentence. e.g. `kebab-case-input-string` is transformed to `Kebab case
  ///   input string`.
  ///
  /// These special considerations are applied:
  /// * Words that are wholly capitalized are assumed to be acryonyms and are left alone. e.g.
  /// `Underscored_INPUT_String` is transformed to `Underscored INPUT String`.
  /// * A single capital "I" is left alone. e.g. `YouAndIAreAwesome` is transformed to `You and I are awesome`.
  String humanizeSymbolName() {
    if (this.isUpperCase()) {
      return this;
    }

    final isCamelOrPascalCased = !this.contains(_underscoreOrHyphenExpression) ||
        this.contains(_underscoreOrHyphenWithSurroundingSpaceExpression);
    final result = _determineUsingRegExp(
        isCamelOrPascalCased ? _camelOrPascalCaseWordPartsExpression : _snakeOrKebabCaseWordPartsExpression);

    return result;
  }

  String _determineUsingRegExp(RegExp regExp) {
    final result = regExp.allMatches(this).map((match) {
      final value = match.group(0);

      if (value == null) {
        return '';
      }

      if (value.isUpperCase() &&
          (value.length > 1 || (match.start > 0 && this[match.start - 1] == ' ') || value == 'I')) {
        return value;
      } else {
        return value.toLowerCase();
      }
    }).join(' ');

    return result.length > 0 ? '${result[0].toUpperCase()}${result.substring(1)}' : result;
  }
}
