// ignore_for_file: cascade_invocations, avoid_function_literals_in_foreach_calls

import 'package:humanizer/src/transformations/localization.dart';
import 'package:humanizer/src/transformations/ordinal.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

void main() {
  _ordinalNumerical();
  _ordinalWords();
}

void _ordinalNumerical() {
  group('ordinal numerical', () {
    void verify({
      required int input,
      required String expected,
      GrammaticalGender grammaticalGender = GrammaticalGender.neuter,
      NumberFormat? numberFormat,
    }) {
      final transformation = OrdinalNumericalTransformation(
        numberFormat: numberFormat,
        grammaticalGender: grammaticalGender,
      );
      final result = transformation.transform(input, '');
      expect(result, expected);
    }

    test('correct suffix is applied', () {
      verify(input: 0, expected: '0th');
      verify(input: 1, expected: '1st');
      verify(input: 2, expected: '2nd');
      verify(input: 3, expected: '3rd');
      verify(input: 4, expected: '4th');
      verify(input: 5, expected: '5th');
      verify(input: 6, expected: '6th');
      verify(input: 7, expected: '7th');
      verify(input: 8, expected: '8th');
      verify(input: 9, expected: '9th');
      verify(input: 10, expected: '10th');
      verify(input: 11, expected: '11th');
      verify(input: 12, expected: '12th');
      verify(input: 13, expected: '13th');
      verify(input: 14, expected: '14th');
      verify(input: 15, expected: '15th');
      verify(input: 16, expected: '16th');
      verify(input: 17, expected: '17th');
      verify(input: 18, expected: '18th');
      verify(input: 19, expected: '19th');
      verify(input: 20, expected: '20th');
      verify(input: 21, expected: '21st');
      verify(input: 22, expected: '22nd');
      verify(input: 23, expected: '23rd');
      verify(input: 24, expected: '24th');
      verify(input: 25, expected: '25th');
      verify(input: 26, expected: '26th');
      verify(input: 27, expected: '27th');
      verify(input: 28, expected: '28th');
      verify(input: 29, expected: '29th');
      verify(input: 30, expected: '30th');
      verify(input: 101, expected: '101st');
      verify(input: 103, expected: '103rd');
      verify(input: 105, expected: '105th');
      verify(input: 111, expected: '111th');
      verify(input: 113, expected: '113th');
    });

    test('negative values are supported, though unorthodox', () {
      verify(input: -1, expected: '-1st');
      verify(input: -2, expected: '-2nd');
      verify(input: -3, expected: '-3rd');
      verify(input: -4, expected: '-4th');
      verify(input: -5, expected: '-5th');
      verify(input: -6, expected: '-6th');
      verify(input: -7, expected: '-7th');
      verify(input: -8, expected: '-8th');
      verify(input: -9, expected: '-9th');
      verify(input: -10, expected: '-10th');
      verify(input: -11, expected: '-11th');
      verify(input: -12, expected: '-12th');
      verify(input: -13, expected: '-13th');
      verify(input: -14, expected: '-14th');
      verify(input: -15, expected: '-15th');
      verify(input: -16, expected: '-16th');
      verify(input: -17, expected: '-17th');
      verify(input: -18, expected: '-18th');
      verify(input: -19, expected: '-19th');
      verify(input: -20, expected: '-20th');
      verify(input: -21, expected: '-21st');
      verify(input: -22, expected: '-22nd');
      verify(input: -23, expected: '-23rd');
      verify(input: -24, expected: '-24th');
      verify(input: -25, expected: '-25th');
      verify(input: -26, expected: '-26th');
      verify(input: -27, expected: '-27th');
      verify(input: -28, expected: '-28th');
      verify(input: -29, expected: '-29th');
      verify(input: -30, expected: '-30th');
      verify(input: -101, expected: '-101st');
      verify(input: -103, expected: '-103rd');
      verify(input: -105, expected: '-105th');
      verify(input: -111, expected: '-111th');
      verify(input: -113, expected: '-113th');
    });

    test('default number format includes group separator', () {
      verify(input: 999, expected: '999th');
      verify(input: 1000, expected: '1,000th');
      verify(input: 3423861, expected: '3,423,861st');
    });

    test('a custom number format can be used', () {
      final numberFormat = NumberFormat('000');
      verify(input: 1, expected: '001st', numberFormat: numberFormat);
      verify(input: 33, expected: '033rd', numberFormat: numberFormat);
      verify(input: 3471, expected: '3471st', numberFormat: numberFormat);
    });

    test('grammatical gender is irrelevant', () {
      final genders = [
        GrammaticalGender.neuter,
        GrammaticalGender.male,
        GrammaticalGender.female,
      ];

      genders.forEach((gender) {
        verify(input: 0, expected: '0th', grammaticalGender: gender);
        verify(input: 1, expected: '1st', grammaticalGender: gender);
        verify(input: 2, expected: '2nd', grammaticalGender: gender);
        verify(input: 3, expected: '3rd', grammaticalGender: gender);
        verify(input: 4, expected: '4th', grammaticalGender: gender);
        verify(input: 5, expected: '5th', grammaticalGender: gender);
        verify(input: 6, expected: '6th', grammaticalGender: gender);
        verify(input: 7, expected: '7th', grammaticalGender: gender);
        verify(input: 8, expected: '8th', grammaticalGender: gender);
        verify(input: 9, expected: '9th', grammaticalGender: gender);
        verify(input: 10, expected: '10th', grammaticalGender: gender);
        verify(input: 11, expected: '11th', grammaticalGender: gender);
        verify(input: 12, expected: '12th', grammaticalGender: gender);
        verify(input: 13, expected: '13th', grammaticalGender: gender);
        verify(input: 14, expected: '14th', grammaticalGender: gender);
        verify(input: 15, expected: '15th', grammaticalGender: gender);
        verify(input: 16, expected: '16th', grammaticalGender: gender);
        verify(input: 17, expected: '17th', grammaticalGender: gender);
        verify(input: 18, expected: '18th', grammaticalGender: gender);
        verify(input: 19, expected: '19th', grammaticalGender: gender);
        verify(input: 20, expected: '20th', grammaticalGender: gender);
        verify(input: 21, expected: '21st', grammaticalGender: gender);
        verify(input: 22, expected: '22nd', grammaticalGender: gender);
        verify(input: 23, expected: '23rd', grammaticalGender: gender);
        verify(input: 24, expected: '24th', grammaticalGender: gender);
        verify(input: 25, expected: '25th', grammaticalGender: gender);
        verify(input: 26, expected: '26th', grammaticalGender: gender);
        verify(input: 27, expected: '27th', grammaticalGender: gender);
        verify(input: 28, expected: '28th', grammaticalGender: gender);
        verify(input: 29, expected: '29th', grammaticalGender: gender);
        verify(input: 30, expected: '30th', grammaticalGender: gender);
        verify(input: 101, expected: '101st', grammaticalGender: gender);
        verify(input: 103, expected: '103rd', grammaticalGender: gender);
        verify(input: 105, expected: '105th', grammaticalGender: gender);
        verify(input: 111, expected: '111th', grammaticalGender: gender);
        verify(input: 113, expected: '113th', grammaticalGender: gender);
      });
    });
  });
}

void _ordinalWords() {
  group('ordinal words', () {
    void verifyTransform({
      required int input,
      required String expected,
    }) {
      const transformation = OrdinalWordsTransformation();
      final result = transformation.transform(input, '');
      expect(result, expected);
    }

    test('correct output', () {
      verifyTransform(input: 0, expected: 'zeroth');
      verifyTransform(input: 1, expected: 'first');
      verifyTransform(input: 2, expected: 'second');
      verifyTransform(input: 3, expected: 'third');
      verifyTransform(input: 4, expected: 'fourth');
      verifyTransform(input: 5, expected: 'fifth');
      verifyTransform(input: 6, expected: 'sixth');
      verifyTransform(input: 7, expected: 'seventh');
      verifyTransform(input: 8, expected: 'eighth');
      verifyTransform(input: 9, expected: 'ninth');
      verifyTransform(input: 10, expected: 'tenth');
      verifyTransform(input: 11, expected: 'eleventh');
      verifyTransform(input: 12, expected: 'twelfth');
      verifyTransform(input: 13, expected: 'thirteenth');
      verifyTransform(input: 14, expected: 'fourteenth');
      verifyTransform(input: 15, expected: 'fifteenth');
      verifyTransform(input: 16, expected: 'sixteenth');
      verifyTransform(input: 17, expected: 'seventeenth');
      verifyTransform(input: 18, expected: 'eighteenth');
      verifyTransform(input: 19, expected: 'nineteenth');
      verifyTransform(input: 20, expected: 'twentieth');
      verifyTransform(input: 21, expected: 'twenty-first');
      verifyTransform(input: 22, expected: 'twenty-second');
      verifyTransform(input: 23, expected: 'twenty-third');
      verifyTransform(input: 24, expected: 'twenty-fourth');
      verifyTransform(input: 25, expected: 'twenty-fifth');
      verifyTransform(input: 26, expected: 'twenty-sixth');
      verifyTransform(input: 27, expected: 'twenty-seventh');
      verifyTransform(input: 28, expected: 'twenty-eighth');
      verifyTransform(input: 29, expected: 'twenty-ninth');
      verifyTransform(input: 30, expected: 'thirtieth');
      verifyTransform(input: 101, expected: 'hundred and first');
      verifyTransform(input: 103, expected: 'hundred and third');
      verifyTransform(input: 105, expected: 'hundred and fifth');
      verifyTransform(input: 111, expected: 'hundred and eleventh');
      verifyTransform(input: 123, expected: 'hundred and twenty-third');
      verifyTransform(
        input: 13238189,
        expected:
            'thirteen million two hundred and thirty-eight thousand one hundred and eighty-ninth',
      );
    });

    test('negative values are supported, though unorthodox', () {
      verifyTransform(input: -1, expected: 'negative first');
      verifyTransform(input: -2, expected: 'negative second');
      verifyTransform(input: -3, expected: 'negative third');
      verifyTransform(input: -4, expected: 'negative fourth');
      verifyTransform(input: -5, expected: 'negative fifth');
      verifyTransform(input: -6, expected: 'negative sixth');
      verifyTransform(input: -7, expected: 'negative seventh');
      verifyTransform(input: -8, expected: 'negative eighth');
      verifyTransform(input: -9, expected: 'negative ninth');
      verifyTransform(input: -10, expected: 'negative tenth');
      verifyTransform(input: -11, expected: 'negative eleventh');
      verifyTransform(input: -12, expected: 'negative twelfth');
      verifyTransform(input: -13, expected: 'negative thirteenth');
      verifyTransform(input: -14, expected: 'negative fourteenth');
      verifyTransform(input: -15, expected: 'negative fifteenth');
      verifyTransform(input: -16, expected: 'negative sixteenth');
      verifyTransform(input: -17, expected: 'negative seventeenth');
      verifyTransform(input: -18, expected: 'negative eighteenth');
      verifyTransform(input: -19, expected: 'negative nineteenth');
      verifyTransform(input: -20, expected: 'negative twentieth');
      verifyTransform(input: -21, expected: 'negative twenty-first');
      verifyTransform(input: -22, expected: 'negative twenty-second');
      verifyTransform(input: -23, expected: 'negative twenty-third');
      verifyTransform(input: -24, expected: 'negative twenty-fourth');
      verifyTransform(input: -25, expected: 'negative twenty-fifth');
      verifyTransform(input: -26, expected: 'negative twenty-sixth');
      verifyTransform(input: -27, expected: 'negative twenty-seventh');
      verifyTransform(input: -28, expected: 'negative twenty-eighth');
      verifyTransform(input: -29, expected: 'negative twenty-ninth');
      verifyTransform(input: -30, expected: 'negative thirtieth');
      verifyTransform(input: -101, expected: 'negative hundred and first');
      verifyTransform(input: -103, expected: 'negative hundred and third');
      verifyTransform(input: -105, expected: 'negative hundred and fifth');
      verifyTransform(input: -111, expected: 'negative hundred and eleventh');
      verifyTransform(
          input: -123, expected: 'negative hundred and twenty-third');
      verifyTransform(
        input: -13238189,
        expected:
            'negative thirteen million two hundred and thirty-eight thousand one hundred and eighty-ninth',
      );
    });
  });
}
