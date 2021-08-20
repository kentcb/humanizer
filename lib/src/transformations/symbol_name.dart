import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/string_predicate_extensions.dart';

/// Represents the name of a symbol.
///
/// Whilst it may seem that we could use Dart's built-in [Symbol] class, it validates that symbol names adhere to Dart
/// standards, which disallows kebab-casing, for example. Humanizer is intended to address use cases across a variety of
/// languages and platforms and having a class specific to Humanizer allows this.
class SymbolName {
  const SymbolName(this.value);

  /// The symbol's name.
  final String value;
}

/// A transformation to convert a [SymbolName] into a human-friendly representation. The symbol's name can be camel-,
/// pascal-, snake-, or kebab-cased.
///
/// These special considerations are applied during transformation:
///
/// * Words that are wholly capitalized are assumed to be acryonyms and are left alone.
/// * A single capital "I" is left alone.
///
/// ```
/// const transformation = SymbolToHumanizedNameTransformation();
///
/// // 'some camel case symbol'
/// transformation.transform(SymbolName('someCamelCaseSymbol'), 'en_US');
///
/// // 'some pascal case symbol'
/// transformation.transform(SymbolName('SomePascalCaseSymbol'), 'en_US');
///
/// // 'some snake case symbol'
/// transformation.transform(SymbolName('some_snake_case_symbol'), 'en_US');
///
/// // 'some kebab case symbol'
/// transformation.transform(SymbolName('some-kebab-case-symbol'), 'en_US');
///
/// // 'some HTML reference'
/// transformation.transform(SymbolName('someHTMLReference'), 'en_US');
///
/// // 'you and I are awesome'
/// transformation.transform(SymbolName('youAndIAreAwesome'), 'en_US');
/// ```
class SymbolToHumanizedNameTransformation extends Transformation<SymbolName, String> {
  const SymbolToHumanizedNameTransformation();

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

  @override
  String transform(SymbolName input, String locale) {
    final name = input.value;

    if (name.isUpperCase()) {
      return name;
    }

    final isCamelOrPascalCased = !name.contains(_underscoreOrHyphenExpression) ||
        name.contains(_underscoreOrHyphenWithSurroundingSpaceExpression);
    final result = _determineUsingRegExp(
      name,
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

    return result;
  }
}
