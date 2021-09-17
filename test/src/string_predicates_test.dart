import 'package:humanizer/src/string_predicate_extensions.dart';
import 'package:test/test.dart';

void main() {
  _isUpperCase();
  _isLowerCase();
  _isDigits();
  _isSymbols();
  _isBlank();
}

void _isUpperCase() {
  group('is upper case', () {
    void verifyIsUpperCase({
      required String input,
      required bool expected,
    }) {
      test(
        '$input → $expected',
        () {
          final result = input.isUpperCase();
          expect(result, expected);
        },
      );
    }

    verifyIsUpperCase(input: 'abc', expected: false);
    verifyIsUpperCase(input: 'AbC', expected: false);
    verifyIsUpperCase(input: '\$', expected: false);
    verifyIsUpperCase(input: '0123', expected: false);
    verifyIsUpperCase(input: 'ABC', expected: true);
  });
}

void _isLowerCase() {
  group('is upper case', () {
    void verifyIsLowerCase({
      required String input,
      required bool expected,
    }) {
      test(
        '$input → $expected',
        () {
          final result = input.isLowerCase();
          expect(result, expected);
        },
      );
    }

    verifyIsLowerCase(input: 'ABC', expected: false);
    verifyIsLowerCase(input: 'AbC', expected: false);
    verifyIsLowerCase(input: '\$', expected: false);
    verifyIsLowerCase(input: '0123', expected: false);
    verifyIsLowerCase(input: 'abc', expected: true);
  });
}

void _isDigits() {
  group('is digits', () {
    void verifyIsDigits({
      required String input,
      required bool expected,
    }) {
      test(
        '$input → $expected',
        () {
          final result = input.isDigits();
          expect(result, expected);
        },
      );
    }

    verifyIsDigits(input: 'A', expected: false);
    verifyIsDigits(input: 'b', expected: false);
    verifyIsDigits(input: '/', expected: false);
    verifyIsDigits(input: ':', expected: false);
    verifyIsDigits(input: '0123a', expected: false);
    verifyIsDigits(input: '0', expected: true);
    verifyIsDigits(input: '1', expected: true);
    verifyIsDigits(input: '2', expected: true);
    verifyIsDigits(input: '3', expected: true);
    verifyIsDigits(input: '4', expected: true);
    verifyIsDigits(input: '5', expected: true);
    verifyIsDigits(input: '6', expected: true);
    verifyIsDigits(input: '7', expected: true);
    verifyIsDigits(input: '8', expected: true);
    verifyIsDigits(input: '9', expected: true);
  });
}

void _isSymbols() {
  group('is symbols', () {
    void verifyIsSymbols({
      required String input,
      required bool expected,
    }) {
      test(
        '$input → $expected',
        () {
          final result = input.isSymbols();
          expect(result, expected);
        },
      );
    }

    verifyIsSymbols(input: 'A', expected: false);
    verifyIsSymbols(input: 'b', expected: false);
    verifyIsSymbols(input: '0', expected: false);
    verifyIsSymbols(input: '/', expected: false);
    verifyIsSymbols(input: '-+!@a', expected: false);
    verifyIsSymbols(input: '\$', expected: true);
    verifyIsSymbols(input: '+\$', expected: true);
  });
}

void _isBlank() {
  group('is blank', () {
    void verifyIsBlank({
      required String input,
      required bool expected,
    }) {
      test(
        '$input → $expected',
        () {
          final result = input.isBlank();
          expect(result, expected);
        },
      );
    }

    verifyIsBlank(input: '', expected: true);
    verifyIsBlank(input: ' ', expected: true);
    verifyIsBlank(input: '\t', expected: true);
    verifyIsBlank(input: ' \r \t\r\n  \t  ', expected: true);
    verifyIsBlank(input: 'a', expected: false);
    verifyIsBlank(input: '    a', expected: false);
  });
}
