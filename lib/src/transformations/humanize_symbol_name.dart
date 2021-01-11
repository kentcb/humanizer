import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/string_predicates.dart';

/// A transformation to convert a [String] containing a symbol name into a human-friendly representation thereof. The
/// symbol name can be camel-, pascal-, snake-, or kebab-cased.
///
/// These special considerations are applied during transformation:
///
/// * Words that are wholly capitalized are assumed to be acryonyms and are left alone.
/// * A single capital "I" is left alone.
///
/// ```
/// const transformation = HumanizeSymbolNameTransformation();
///
/// // 'Some camel case symbol'
/// transformation.transform('someCamelCaseSymbol', 'en_US');
///
/// // 'Some pascal case symbol'
/// transformation.transform('SomePascalCaseSymbol', 'en_US');
///
/// // 'Some snake case symbol'
/// transformation.transform('some_snake_case_symbol', 'en_US');
///
/// // 'Some kebab case symbol'
/// transformation.transform('some-kebab-case-symbol', 'en_US');
///
/// // 'Some HTML reference'
/// transformation.transform('someHTMLReference', 'en_US');
///
/// // 'You and I are awesome'
/// transformation.transform('youAndIAreAwesome', 'en_US');
/// ```
class HumanizeSymbolNameTransformation extends Transformation<String, String> {
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

  const HumanizeSymbolNameTransformation();

  @override
  String transform(String input, String locale) {
    if (input.isUpperCase()) {
      return input;
    }

    final isCamelOrPascalCased = !input.contains(_underscoreOrHyphenExpression) ||
        input.contains(_underscoreOrHyphenWithSurroundingSpaceExpression);
    final result = _determineUsingRegExp(
      input,
      isCamelOrPascalCased ? _camelOrPascalCaseWordPartsExpression : _snakeOrKebabCaseWordPartsExpression,
    );

    return result;
  }

  static String _determineUsingRegExp(String input, RegExp regExp) {
    final result = regExp.allMatches(input).map((match) {
      final value = match.group(0);

      if (value == null) {
        return '';
      }

      if (value.isUpperCase() &&
          (value.length > 1 || (match.start > 0 && input[match.start - 1] == ' ') || value == 'I')) {
        return value;
      } else {
        return value.toLowerCase();
      }
    }).join(' ');

    return result.isNotEmpty ? '${result[0].toUpperCase()}${result.substring(1)}' : result;
  }
}
