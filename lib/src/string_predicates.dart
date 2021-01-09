// NOTE: this is intentionally not exported as part of the library's API.

extension StringPredicateExtensions on String {
  static final _upperCaseExpression = RegExp(
    r'^[\p{Lu}]+$',
    unicode: true,
  );
  static final _lowerCaseExpression = RegExp(
    r'^[\p{Ll}]+$',
    unicode: true,
  );
  static final _symbolExpression = RegExp(
    r'^[\p{Sc}\p{Sk}\p{Sm}\p{So}]+$',
    unicode: true,
  );

  /// Returns `true` if this [String] consists entirely of upper-case characters.
  bool isUpperCase() => _upperCaseExpression.hasMatch(this);

  /// Returns `true` if this [String] consists entirely of upper-case characters.
  bool isLowerCase() => _lowerCaseExpression.hasMatch(this);

  /// Returns `true` if this [String] consists entirely of digits.
  bool isDigits() => codeUnits.every((codeUnit) => (codeUnit ^ 0x30) <= 9);

  /// Returns `true` if this [String] consists entirely of symbol characters.
  bool isSymbols() => _symbolExpression.hasMatch(this);

  /// Returns `true` if this [String] consists entirely of whitespace characters.
  bool isBlank() => trim().isEmpty;
}
