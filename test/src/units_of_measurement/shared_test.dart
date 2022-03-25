// ignore_for_file: cascade_invocations, avoid_function_literals_in_foreach_calls

import 'package:humanizer/src/units_of_measurement/rationals.dart';
import 'package:humanizer/src/units_of_measurement/shared.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

void main() {
  _comparableRatedValue();
  _rateUnits();
  _unitOfMeasurement();
  _unitOfMeasurementFormat();
}

enum _ComparisonResult {
  preferFirst,
  preferSecond,
  equalPreference,
}

extension _ComparisonResultExtensions on _ComparisonResult {
  _ComparisonResult get opposite {
    switch (this) {
      case _ComparisonResult.equalPreference:
        return _ComparisonResult.equalPreference;
      case _ComparisonResult.preferFirst:
        return _ComparisonResult.preferSecond;
      case _ComparisonResult.preferSecond:
        return _ComparisonResult.preferFirst;
    }
  }

  String get describe {
    switch (this) {
      case _ComparisonResult.equalPreference:
        return 'equal preference';
      case _ComparisonResult.preferFirst:
        return 'first preferred';
      case _ComparisonResult.preferSecond:
        return 'second preferred';
    }
  }
}

extension _ComparisonResultIntExtensions on int {
  _ComparisonResult get comparisonResult {
    if (this < 0) {
      return _ComparisonResult.preferFirst;
    } else if (this > 0) {
      return _ComparisonResult.preferSecond;
    }
    return _ComparisonResult.equalPreference;
  }
}

void _comparableRatedValue() {
  group('comparable rated value', () {
    void verifyComparableRateCompare({
      required Rational firstValue,
      required Rational secondValue,
      required _ComparisonResult expected,
    }) {
      final first = ComparableRatedValue(firstValue, RateUnit.second);
      final second = ComparableRatedValue(secondValue, RateUnit.second);
      expect(
        first.compareTo(second).comparisonResult,
        expected,
        reason: 'comparison of first value ($first) and second value ($second) should result in ${expected.describe}',
      );
      expect(
        second.compareTo(first).comparisonResult,
        expected.opposite,
        reason:
            'comparison of second value ($second) and first value ($first) should result in ${expected.opposite.describe}',
      );
    }

    test('finite precision takes precedence over infinite precision', () {
      verifyComparableRateCompare(
        firstValue: Rational.fromInt(10000000),
        secondValue: Rational.fromInt(1) / Rational.fromInt(3),
        expected: _ComparisonResult.preferFirst,
      );
    });

    test('lower precision takes precedence over higher precision', () {
      verifyComparableRateCompare(
        firstValue: Rational.fromInt(1023, 100),
        secondValue: Rational.fromInt(10234, 10000),
        expected: _ComparisonResult.preferFirst,
      );
    });

    test('lower scale takes precedence over higher scale', () {
      verifyComparableRateCompare(
        firstValue: Rational.fromInt(10123, 1000),
        secondValue: Rational.fromInt(11234, 10000),
        expected: _ComparisonResult.preferFirst,
      );
    });

    test('closer to one takes precedence over further away', () {
      verifyComparableRateCompare(
        firstValue: Rational.fromInt(2),
        secondValue: Rational.fromInt(3),
        expected: _ComparisonResult.preferFirst,
      );
      verifyComparableRateCompare(
        firstValue: Rational.fromInt(0),
        secondValue: Rational.fromInt(2),
        // Both 1 away from 1.
        expected: _ComparisonResult.equalPreference,
      );
      verifyComparableRateCompare(
        firstValue: Rational.fromInt(-1),
        secondValue: Rational.fromInt(4),
        expected: _ComparisonResult.preferFirst,
      );
      verifyComparableRateCompare(
        firstValue: Rational.fromInt(1123, 1000),
        secondValue: Rational.fromInt(2123, 1000),
        expected: _ComparisonResult.preferFirst,
      );
      verifyComparableRateCompare(
        firstValue: Rational.fromInt(1) + (Rational.fromInt(1) / Rational.fromInt(3)),
        secondValue: Rational.fromInt(1) + (Rational.fromInt(2) / Rational.fromInt(3)),
        expected: _ComparisonResult.preferFirst,
      );
    });
  });
}

void _rateUnits() {
  group('rate units', () {
    test('all contains all units', () {
      final all = RateUnit.values.toSet();
      final missing = all.difference(RateUnits.all);
      expect(missing, <RateUnit>{});
    });
  });
}

void _unitOfMeasurement() {
  group('unit of measurement', () {
    test('get units', () {
      QualityUnits.all.forEach((unit) {
        final sut = Quality.fromUnits(unit, Rational.fromInt(42));
        expect(sut.getUnits(unit), Rational.fromInt(42));
      });

      QualityUnits.all.skip(1).forEach((unit) {
        final sut = Quality.fromUnits(unit, Rational.fromInt(69)) + Quality.fromNanolovelaces(Rational.fromInt(1));
        expect(sut.getUnits(unit), greaterThan(Rational.fromInt(69)));
        expect(sut.getUnits(unit), lessThan(Rational.fromInt(691, 10)));
      });
    });

    group('get largest unit', () {
      test('permissible units cannot be empty', () {
        expect(
          () => Quality.zero.getLargestUnit(permissibleUnits: <QualityUnit>{}),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('correctly identifies largest unit', () {
        final values = <Rational, QualityUnit>{
          Rationals.one: QualityUnit.nanolovelace,
          Rational.fromInt(999): QualityUnit.nanolovelace,
          Rationals.thousand: QualityUnit.microlovelace,
          Rational.fromInt(999999): QualityUnit.microlovelace,
          Rationals.million: QualityUnit.millilovelace,
          Rational.fromInt(9999999): QualityUnit.millilovelace,
          Rational.fromInt(10000000): QualityUnit.centilovelace,
          Rational.fromInt(99999999): QualityUnit.centilovelace,
          Rational.fromInt(100000000): QualityUnit.decilovelace,
          Rational.fromInt(999999999): QualityUnit.decilovelace,
          Rationals.billion: QualityUnit.lovelace,
        };

        values.forEach((nanolovelaces, expected) {
          final sut = Quality.fromNanolovelaces(nanolovelaces);
          expect(sut.getLargestUnit(permissibleUnits: QualityUnits.all), expected);
        });
      });

      test('can restrict permissible units', () {
        final sut = Quality.fromCentilovelaces(Rational.fromInt(1));

        expect(
          sut.getLargestUnit(permissibleUnits: QualityUnits.all),
          QualityUnit.centilovelace,
        );
        expect(
          sut.getLargestUnit(permissibleUnits: <QualityUnit>{
            QualityUnit.nanolovelace,
            QualityUnit.microlovelace,
            QualityUnit.millilovelace,
          }),
          QualityUnit.millilovelace,
        );
        expect(
          sut.getLargestUnit(permissibleUnits: <QualityUnit>{
            QualityUnit.nanolovelace,
            QualityUnit.microlovelace,
            QualityUnit.decilovelace,
          }),
          QualityUnit.microlovelace,
        );
      });

      test('order of permissible units does not matter', () {
        final sut = Quality.fromCentilovelaces(Rational.fromInt(1));

        expect(
          sut.getLargestUnit(permissibleUnits: <QualityUnit>{
            QualityUnit.millilovelace,
            QualityUnit.centilovelace,
            QualityUnit.decilovelace,
          }),
          QualityUnit.centilovelace,
        );
        expect(
          sut.getLargestUnit(permissibleUnits: <QualityUnit>{
            QualityUnit.centilovelace,
            QualityUnit.millilovelace,
            QualityUnit.decilovelace,
          }),
          QualityUnit.centilovelace,
        );
        expect(
          sut.getLargestUnit(permissibleUnits: <QualityUnit>{
            QualityUnit.millilovelace,
            QualityUnit.decilovelace,
            QualityUnit.centilovelace,
          }),
          QualityUnit.centilovelace,
        );
      });

      test('smallest unit is returned if all permissible units are too large', () {
        final sut = Quality.fromMicrolovelaces(Rational.fromInt(1));

        expect(
          sut.getLargestUnit(permissibleUnits: <QualityUnit>{
            QualityUnit.millilovelace,
            QualityUnit.centilovelace,
            QualityUnit.decilovelace,
          }),
          QualityUnit.millilovelace,
        );
        expect(
          sut.getLargestUnit(permissibleUnits: <QualityUnit>{
            QualityUnit.centilovelace,
            QualityUnit.decilovelace,
          }),
          QualityUnit.centilovelace,
        );
      });
    });

    test('round', () {
      void verifyRound({
        required Quality input,
        required QualityUnit roundTo,
        required Quality expected,
      }) {
        final result = input.round(roundTo);
        expect(result, expected);
      }

      verifyRound(
        input: 499.nanolovelaces(),
        roundTo: QualityUnit.microlovelace,
        expected: 0.microlovelaces(),
      );
      verifyRound(
        input: 500.nanolovelaces(),
        roundTo: QualityUnit.microlovelace,
        expected: 1.microlovelaces(),
      );

      verifyRound(
        input: 499.microlovelaces(),
        roundTo: QualityUnit.millilovelace,
        expected: 0.millilovelaces(),
      );
      verifyRound(
        input: 500.microlovelaces(),
        roundTo: QualityUnit.millilovelace,
        expected: 1.millilovelaces(),
      );

      verifyRound(
        input: 2.lovelaces() + 4.decilovelaces(),
        roundTo: QualityUnit.lovelace,
        expected: 2.lovelaces(),
      );
      verifyRound(
        input: 2.lovelaces() + 5.decilovelaces(),
        roundTo: QualityUnit.lovelace,
        expected: 3.lovelaces(),
      );

      verifyRound(
        input: -2.lovelaces() - 4.decilovelaces(),
        roundTo: QualityUnit.lovelace,
        expected: -2.lovelaces(),
      );
      verifyRound(
        input: -2.lovelaces() - 5.decilovelaces(),
        roundTo: QualityUnit.lovelace,
        expected: -3.lovelaces(),
      );
    });

    test('==', () {
      void verifyEqual({
        required QualityUnit unit1,
        required int operand1,
        required QualityUnit unit2,
        required int operand2,
        required bool expected,
      }) {
        final first = Quality.fromUnits(unit1, Rational.fromInt(operand1));
        final second = Quality.fromUnits(unit2, Rational.fromInt(operand2));
        final result = first == second;
        expect(result, expected, reason: '$first != $second');
        expect(first.compareTo(second) == 0, expected);
        expect(first.hashCode == second.hashCode, expected);
      }

      verifyEqual(
        unit1: QualityUnit.nanolovelace,
        operand1: 1,
        unit2: QualityUnit.nanolovelace,
        operand2: 0,
        expected: false,
      );
      verifyEqual(
        unit1: QualityUnit.nanolovelace,
        operand1: 0,
        unit2: QualityUnit.nanolovelace,
        operand2: 1,
        expected: false,
      );
      verifyEqual(
        unit1: QualityUnit.nanolovelace,
        operand1: 0,
        unit2: QualityUnit.nanolovelace,
        operand2: 0,
        expected: true,
      );
      verifyEqual(
        unit1: QualityUnit.nanolovelace,
        operand1: 42,
        unit2: QualityUnit.nanolovelace,
        operand2: 42,
        expected: true,
      );
      verifyEqual(
        unit1: QualityUnit.nanolovelace,
        operand1: 1000000,
        unit2: QualityUnit.millilovelace,
        operand2: 1,
        expected: true,
      );
      verifyEqual(
        unit1: QualityUnit.nanolovelace,
        operand1: 1000001,
        unit2: QualityUnit.millilovelace,
        operand2: 1,
        expected: false,
      );
    });

    test('abs', () {
      expect(Rational.fromInt(42), Quality.fromNanolovelaces(Rational.fromInt(42)).abs().nanolovelaces);
      expect(Rational.fromInt(42), Quality.fromNanolovelaces(Rational.fromInt(-42)).abs().nanolovelaces);
    });

    test('+', () {
      void verifyAdd(Rational operand1, Rational operand2, Rational expected) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = Quality.fromNanolovelaces(operand2);
        final result = first + second;
        expect(result.nanolovelaces, expected);
      }

      verifyAdd(Rational.fromInt(0), Rational.fromInt(0), Rational.fromInt(0));
      verifyAdd(Rational.fromInt(1), Rational.fromInt(0), Rational.fromInt(1));
      verifyAdd(Rational.fromInt(0), Rational.fromInt(1), Rational.fromInt(1));
      verifyAdd(Rational.fromInt(1), Rational.fromInt(1), Rational.fromInt(2));
      verifyAdd(Rational.fromInt(40), Rational.fromInt(2), Rational.fromInt(42));
      verifyAdd(Rational.fromInt(2), Rational.fromInt(40), Rational.fromInt(42));
      verifyAdd(Rational.fromInt(44), Rational.fromInt(-2), Rational.fromInt(42));
      verifyAdd(Rational.fromInt(-2), Rational.fromInt(44), Rational.fromInt(42));
      verifyAdd(Rational.fromInt(105, 10), Rational.fromInt(125, 100), Rational.fromInt(1175, 100));
    });

    test('-', () {
      void verifySubtract(Rational operand1, Rational operand2, Rational expected) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = Quality.fromNanolovelaces(operand2);
        final result = first - second;
        expect(result.nanolovelaces, expected);
      }

      verifySubtract(Rational.fromInt(0), Rational.fromInt(0), Rational.fromInt(0));
      verifySubtract(Rational.fromInt(1), Rational.fromInt(0), Rational.fromInt(1));
      verifySubtract(Rational.fromInt(0), Rational.fromInt(1), Rational.fromInt(-1));
      verifySubtract(Rational.fromInt(1), Rational.fromInt(1), Rational.fromInt(0));
      verifySubtract(Rational.fromInt(44), Rational.fromInt(2), Rational.fromInt(42));
      verifySubtract(Rational.fromInt(2), Rational.fromInt(44), Rational.fromInt(-42));
      verifySubtract(Rational.fromInt(40), Rational.fromInt(-2), Rational.fromInt(42));
      verifySubtract(Rational.fromInt(-2), Rational.fromInt(40), Rational.fromInt(-42));
      verifySubtract(Rational.fromInt(105, 10), Rational.fromInt(125, 100), Rational.fromInt(925, 100));
    });

    test('unary -', () {
      void verifyNegation(Rational operand, Rational expected) {
        final value = Quality.fromNanolovelaces(operand);
        final result = -value;
        expect(result.nanolovelaces, expected);
      }

      verifyNegation(Rational.fromInt(0), Rational.fromInt(0));
      verifyNegation(Rational.fromInt(1), Rational.fromInt(-1));
      verifyNegation(Rational.fromInt(-1), Rational.fromInt(1));
      verifyNegation(Rational.fromInt(42), Rational.fromInt(-42));
      verifyNegation(Rational.fromInt(-42), Rational.fromInt(42));
      verifyNegation(Rational.fromInt(105, 10), Rational.fromInt(-105, 10));
      verifyNegation(Rational.fromInt(-105, 10), Rational.fromInt(105, 10));
    });

    test('*', () {
      void verifyMultiply(Rational operand1, Rational operand2, Rational expected) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = operand2;
        final result = first * second;
        expect(result.nanolovelaces, expected);
      }

      verifyMultiply(Rational.fromInt(0), Rational.fromInt(0), Rational.fromInt(0));
      verifyMultiply(Rational.fromInt(1), Rational.fromInt(0), Rational.fromInt(0));
      verifyMultiply(Rational.fromInt(0), Rational.fromInt(1), Rational.fromInt(0));
      verifyMultiply(Rational.fromInt(1), Rational.fromInt(1), Rational.fromInt(1));
      verifyMultiply(Rational.fromInt(42), Rational.fromInt(1), Rational.fromInt(42));
      verifyMultiply(Rational.fromInt(1), Rational.fromInt(42), Rational.fromInt(42));
      verifyMultiply(Rational.fromInt(21), Rational.fromInt(2), Rational.fromInt(42));
      verifyMultiply(Rational.fromInt(2), Rational.fromInt(21), Rational.fromInt(42));
      verifyMultiply(Rational.fromInt(13), Rational.fromInt(-2), Rational.fromInt(-26));
      verifyMultiply(Rational.fromInt(105, 10), Rational.fromInt(125, 100), Rational.fromInt(13125, 1000));
    });

    test('/', () {
      void verifyDivide(Rational operand1, Rational operand2, Rational expected) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = operand2;
        final result = first / second;
        expect(result.nanolovelaces, expected);
      }

      verifyDivide(Rational.fromInt(1), Rational.fromInt(1), Rational.fromInt(1));
      verifyDivide(Rational.fromInt(2), Rational.fromInt(1), Rational.fromInt(2));
      verifyDivide(Rational.fromInt(3), Rational.fromInt(2), Rational.fromInt(15, 10));
      verifyDivide(Rational.fromInt(4), Rational.fromInt(-2), Rational.fromInt(-2));
      verifyDivide(Rational.fromInt(105, 10), Rational.fromInt(125, 100), Rational.fromInt(84, 10));

      expect(
        () => Quality.fromNanolovelaces(Rational.fromInt(1)) / Rational.fromInt(0),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('<', () {
      void verifyLessThan({
        required Rational operand1,
        required Rational operand2,
        required bool expected,
      }) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = Quality.fromNanolovelaces(operand2);
        final result = first < second;
        expect(result, expected);
        expect(first.compareTo(second) < 0, expected);
      }

      verifyLessThan(
        operand1: Rational.fromInt(0),
        operand2: Rational.fromInt(0),
        expected: false,
      );
      verifyLessThan(
        operand1: Rational.fromInt(1),
        operand2: Rational.fromInt(0),
        expected: false,
      );
      verifyLessThan(
        operand1: Rational.fromInt(0),
        operand2: Rational.fromInt(1),
        expected: true,
      );
      verifyLessThan(
        operand1: Rational.fromInt(-1),
        operand2: Rational.fromInt(1),
        expected: true,
      );
      verifyLessThan(
        operand1: Rational.fromInt(42),
        operand2: Rational.fromInt(42),
        expected: false,
      );
      verifyLessThan(
        operand1: Rational.fromInt(69),
        operand2: Rational.fromInt(42),
        expected: false,
      );
      verifyLessThan(
        operand1: Rational.fromInt(42),
        operand2: Rational.fromInt(69),
        expected: true,
      );
      verifyLessThan(
        operand1: Rational.fromInt(105, 10),
        operand2: Rational.fromInt(105, 10),
        expected: false,
      );
      verifyLessThan(
        operand1: Rational.fromInt(125, 100),
        operand2: Rational.fromInt(105, 10),
        expected: true,
      );
      verifyLessThan(
        operand1: Rational.fromInt(105, 10),
        operand2: Rational.fromInt(125, 100),
        expected: false,
      );
    });

    test('<=', () {
      void verifyLessThanOrEqual({
        required Rational operand1,
        required Rational operand2,
        required bool expected,
      }) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = Quality.fromNanolovelaces(operand2);
        final result = first <= second;
        expect(result, expected);
        expect(first.compareTo(second) > 0, !expected);
      }

      verifyLessThanOrEqual(
        operand1: Rational.fromInt(0),
        operand2: Rational.fromInt(0),
        expected: true,
      );
      verifyLessThanOrEqual(
        operand1: Rational.fromInt(1),
        operand2: Rational.fromInt(0),
        expected: false,
      );
      verifyLessThanOrEqual(
        operand1: Rational.fromInt(0),
        operand2: Rational.fromInt(1),
        expected: true,
      );
      verifyLessThanOrEqual(
        operand1: Rational.fromInt(-1),
        operand2: Rational.fromInt(1),
        expected: true,
      );
      verifyLessThanOrEqual(
        operand1: Rational.fromInt(42),
        operand2: Rational.fromInt(42),
        expected: true,
      );
      verifyLessThanOrEqual(
        operand1: Rational.fromInt(69),
        operand2: Rational.fromInt(42),
        expected: false,
      );
      verifyLessThanOrEqual(
        operand1: Rational.fromInt(42),
        operand2: Rational.fromInt(69),
        expected: true,
      );
      verifyLessThanOrEqual(
        operand1: Rational.fromInt(105, 10),
        operand2: Rational.fromInt(105, 10),
        expected: true,
      );
      verifyLessThanOrEqual(
        operand1: Rational.fromInt(125, 100),
        operand2: Rational.fromInt(105, 10),
        expected: true,
      );
      verifyLessThanOrEqual(
        operand1: Rational.fromInt(105, 10),
        operand2: Rational.fromInt(125, 100),
        expected: false,
      );
    });

    test('>', () {
      void verifyGreaterThan({
        required Rational operand1,
        required Rational operand2,
        required bool expected,
      }) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = Quality.fromNanolovelaces(operand2);
        final result = first > second;
        expect(result, expected);
        expect(first.compareTo(second) > 0, expected);
      }

      verifyGreaterThan(
        operand1: Rational.fromInt(0),
        operand2: Rational.fromInt(0),
        expected: false,
      );
      verifyGreaterThan(
        operand1: Rational.fromInt(1),
        operand2: Rational.fromInt(0),
        expected: true,
      );
      verifyGreaterThan(
        operand1: Rational.fromInt(0),
        operand2: Rational.fromInt(1),
        expected: false,
      );
      verifyGreaterThan(
        operand1: Rational.fromInt(-1),
        operand2: Rational.fromInt(1),
        expected: false,
      );
      verifyGreaterThan(
        operand1: Rational.fromInt(42),
        operand2: Rational.fromInt(42),
        expected: false,
      );
      verifyGreaterThan(
        operand1: Rational.fromInt(69),
        operand2: Rational.fromInt(42),
        expected: true,
      );
      verifyGreaterThan(
        operand1: Rational.fromInt(42),
        operand2: Rational.fromInt(69),
        expected: false,
      );
      verifyGreaterThan(
        operand1: Rational.fromInt(105, 10),
        operand2: Rational.fromInt(105, 10),
        expected: false,
      );
      verifyGreaterThan(
        operand1: Rational.fromInt(125, 100),
        operand2: Rational.fromInt(105, 10),
        expected: false,
      );
      verifyGreaterThan(
        operand1: Rational.fromInt(105, 10),
        operand2: Rational.fromInt(125, 100),
        expected: true,
      );
    });

    test('>=', () {
      void verifyGreaterThanOrEqual({
        required Rational operand1,
        required Rational operand2,
        required bool expected,
      }) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = Quality.fromNanolovelaces(operand2);
        final result = first >= second;
        expect(result, expected);
        expect(first.compareTo(second) < 0, !expected);
      }

      verifyGreaterThanOrEqual(
        operand1: Rational.fromInt(0),
        operand2: Rational.fromInt(0),
        expected: true,
      );
      verifyGreaterThanOrEqual(
        operand1: Rational.fromInt(1),
        operand2: Rational.fromInt(0),
        expected: true,
      );
      verifyGreaterThanOrEqual(
        operand1: Rational.fromInt(0),
        operand2: Rational.fromInt(1),
        expected: false,
      );
      verifyGreaterThanOrEqual(
        operand1: Rational.fromInt(-1),
        operand2: Rational.fromInt(1),
        expected: false,
      );
      verifyGreaterThanOrEqual(
        operand1: Rational.fromInt(42),
        operand2: Rational.fromInt(42),
        expected: true,
      );
      verifyGreaterThanOrEqual(
        operand1: Rational.fromInt(69),
        operand2: Rational.fromInt(42),
        expected: true,
      );
      verifyGreaterThanOrEqual(
        operand1: Rational.fromInt(42),
        operand2: Rational.fromInt(69),
        expected: false,
      );
      verifyGreaterThanOrEqual(
        operand1: Rational.fromInt(105, 10),
        operand2: Rational.fromInt(105, 10),
        expected: true,
      );
      verifyGreaterThanOrEqual(
        operand1: Rational.fromInt(125, 100),
        operand2: Rational.fromInt(105, 10),
        expected: false,
      );
      verifyGreaterThanOrEqual(
        operand1: Rational.fromInt(105, 10),
        operand2: Rational.fromInt(125, 100),
        expected: true,
      );
    });
  });
}

void _unitOfMeasurementFormat() {
  group('unit of measurement format', () {
    group('construct', () {
      test('throws if unterminated string in pattern', () {
        expect(
          () {
            QualityFormat(
              pattern: "'an unterminated string",
            );
          },
          throwsA(
            predicate((o) => o is FormatException && o.message == 'Unexpected end of input: unterminated string'),
          ),
        );
      });

      test('throws if incomplete escape sequence in pattern', () {
        expect(
          () {
            QualityFormat(
              pattern: r"'a string with incomplete escape sequence \",
            );
          },
          throwsA(
            predicate(
                (e) => e is FormatException && e.message == 'Unexpected end of input: escape sequence incomplete'),
          ),
        );
      });

      test('throws if unsupported unit specifier is in pattern', () {
        expect(
          () {
            QualityFormat(
              pattern: '0.# u:nll',
              valueUnits: <QualityUnit>{
                QualityUnit.centilovelace,
              },
            );
          },
          throwsA(
            predicate((o) => o is FormatException && o.message == 'Unsupported unit specifier: u:nll'),
          ),
        );
      });

      test('throws if format includes both dynamic and fixed unit specifiers', () {
        expect(
          () {
            QualityFormat(
              pattern: '0.# u:nll u',
            );
          },
          throwsA(
            predicate((o) =>
                o is FormatException &&
                o.message == 'Cannot include both dynamic and fixed units in the format string'),
          ),
        );
      });

      test('throws if format includes more than one unique fixed unit specifier', () {
        expect(
          () {
            QualityFormat(
              pattern: '0.# u:nll u:cll',
            );
          },
          throwsA(
            predicate((o) => o is FormatException && o.message == 'Cannot include more than one unique fixed unit'),
          ),
        );
      });
    });

    group('format', () {
      group('unit of measurement', () {
        void verifyQualityFormat({
          required String pattern,
          required Set<QualityUnit> valueUnits,
          required Quality input,
          required String expected,
        }) {
          final sut = QualityFormat(
            pattern: pattern,
            valueUnits: valueUnits,
            locale: 'en',
          );
          final result = sut.format(input);
          expect(result, expected);
        }

        test('works without dynamic or fixed units', () {
          verifyQualityFormat(
            pattern: '',
            valueUnits: QualityUnits.all,
            input: Quality.fromNanolovelaces(Rational.fromInt(42)),
            expected: '',
          );

          verifyQualityFormat(
            pattern: '0.#',
            valueUnits: QualityUnits.all,
            input: Quality.fromNanolovelaces(Rational.fromInt(1200)),
            expected: '1.2',
          );
        });

        test('works with dynamic units', () {
          verifyQualityFormat(
            pattern: 'u',
            valueUnits: QualityUnits.all,
            input: Quality.fromNanolovelaces(Rational.fromInt(1200)),
            expected: 'µll',
          );

          verifyQualityFormat(
            pattern: 'U',
            valueUnits: QualityUnits.all,
            input: Quality.fromNanolovelaces(Rational.fromInt(1200)),
            expected: 'microlovelaces',
          );

          verifyQualityFormat(
            pattern: "0.# u '('0.## U', to be more precise)'",
            valueUnits: QualityUnits.all,
            input: Quality.fromNanolovelaces(Rational.fromInt(1210)),
            expected: '1.2 µll (1.21 microlovelaces, to be more precise)',
          );
        });

        test('works with fixed units', () {
          verifyQualityFormat(
            pattern: 'u:µll',
            valueUnits: QualityUnits.all,
            input: Quality.fromNanolovelaces(Rational.fromInt(1210)),
            expected: 'µll',
          );

          verifyQualityFormat(
            pattern: 'U:µll',
            valueUnits: QualityUnits.all,
            input: Quality.fromNanolovelaces(Rational.fromInt(1210)),
            expected: 'microlovelaces',
          );

          verifyQualityFormat(
            pattern: 'U:zl',
            valueUnits: QualityUnits.all,
            input: Quality.fromNanolovelaces(Rational.fromInt(1210)),
            expected: 'compromised engineerings',
          );

          verifyQualityFormat(
            pattern: '0.# u:nll',
            valueUnits: QualityUnits.all,
            input: Quality.fromNanolovelaces(Rational.fromInt(1210)),
            expected: '1210 nll',
          );

          verifyQualityFormat(
            pattern: '0.# u:µll',
            valueUnits: QualityUnits.all,
            input: Quality.fromNanolovelaces(Rational.fromInt(1210)),
            expected: '1.2 µll',
          );
        });

        test('respects supported units', () {
          verifyQualityFormat(
            pattern: '0.# u',
            valueUnits: QualityUnits.all,
            input: Quality.fromNanolovelaces(Rational.fromInt(1210)),
            expected: '1.2 µll',
          );

          verifyQualityFormat(
            pattern: '0.# u',
            valueUnits: <QualityUnit>{
              QualityUnit.nanolovelace,
              QualityUnit.millilovelace,
            },
            input: Quality.fromNanolovelaces(Rational.fromInt(1210)),
            expected: '1210 nll',
          );

          verifyQualityFormat(
            pattern: '0.# u',
            valueUnits: <QualityUnit>{
              QualityUnit.nanolovelace,
              QualityUnit.millilovelace,
            },
            input: Quality.fromLovelaces(Rational.fromInt(1)),
            expected: '1000 mll',
          );

          verifyQualityFormat(
            pattern: '0.# u',
            valueUnits: <QualityUnit>{
              QualityUnit.nanolovelace,
              QualityUnit.millilovelace,
              QualityUnit.decilovelace,
            },
            input: Quality.fromLovelaces(Rational.fromInt(1)),
            expected: '10 dll',
          );
        });
      });

      // The formatting logic for UoM rates is quite different in some respects, so tests are in a separate group.
      group('unit of measurement rate', () {
        void verifyQualityRateFormat({
          required String pattern,
          required Set<QualityUnit> valueUnits,
          required Set<RateUnit> rateUnits,
          required QualityRate input,
          required String expected,
        }) {
          final sut = QualityRateFormat(
            pattern: pattern,
            valueUnits: valueUnits,
            rateUnits: rateUnits,
            locale: 'en',
          );
          final result = sut.format(input);
          expect(result, expected);
        }

        test('works without dynamic or fixed units', () {
          verifyQualityRateFormat(
            pattern: '',
            valueUnits: QualityUnits.all,
            rateUnits: RateUnits.hourOrLess,
            input: Quality.fromNanolovelaces(Rational.fromInt(42)).per(const Duration(seconds: 1)),
            expected: '',
          );

          verifyQualityRateFormat(
            pattern: '0.#',
            valueUnits: QualityUnits.all,
            rateUnits: RateUnits.hourOrLess,
            input: Quality.fromNanolovelaces(Rational.fromInt(1200)).per(const Duration(seconds: 1)),
            expected: '72',
          );
        });

        test('works with dynamic units', () {
          verifyQualityRateFormat(
            pattern: 'u r',
            valueUnits: QualityUnits.all,
            rateUnits: RateUnits.hourOrLess,
            input: Quality.fromNanolovelaces(Rational.fromInt(1024)).per(const Duration(seconds: 1)),
            expected: 'µll min',
          );

          verifyQualityRateFormat(
            pattern: 'U R',
            valueUnits: QualityUnits.all,
            rateUnits: RateUnits.hourOrLess,
            input: Quality.fromNanolovelaces(Rational.fromInt(1024)).per(const Duration(seconds: 1)),
            expected: 'microlovelaces minute',
          );

          verifyQualityRateFormat(
            pattern: "0.# u r '('0.## U 'per' R', to be more precise)'",
            valueUnits: QualityUnits.all,
            rateUnits: RateUnits.hourOrLess,
            input: Quality.fromNanolovelaces(Rational.fromInt(1024)).per(const Duration(seconds: 1)),
            expected: '61.4 µll min (61.44 microlovelaces per minute, to be more precise)',
          );

          verifyQualityRateFormat(
            pattern: "0.# u r '('0.## U 'per' R', to be more precise)'",
            valueUnits: QualityUnits.all,
            rateUnits: RateUnits.hourOrLess,
            input: Quality.fromNanolovelaces(Rational.fromInt(1024)).per(const Duration(minutes: 1)),
            expected: '61.4 µll hr (61.44 microlovelaces per hour, to be more precise)',
          );
        });

        test('works with fixed units', () {
          verifyQualityRateFormat(
            pattern: 'u:cll r:min',
            valueUnits: QualityUnits.all,
            rateUnits: RateUnits.hourOrLess,
            input: Quality.fromNanolovelaces(Rational.fromInt(1024)).per(const Duration(seconds: 1)),
            expected: 'cll min',
          );

          verifyQualityRateFormat(
            pattern: 'U:cll R:min',
            valueUnits: QualityUnits.all,
            rateUnits: RateUnits.hourOrLess,
            input: Quality.fromNanolovelaces(Rational.fromInt(1024)).per(const Duration(seconds: 1)),
            expected: 'centilovelaces minute',
          );

          verifyQualityRateFormat(
            pattern: "0.# u:µll r:min '('0.## U:µll 'per' R:min', to be more precise)'",
            valueUnits: QualityUnits.all,
            rateUnits: RateUnits.hourOrLess,
            input: Quality.fromNanolovelaces(Rational.fromInt(1024)).per(const Duration(seconds: 1)),
            expected: '61.4 µll min (61.44 microlovelaces per minute, to be more precise)',
          );
        });

        test('respects supported units', () {
          verifyQualityRateFormat(
            pattern: '0.# u:µll r:s',
            valueUnits: QualityUnits.all,
            rateUnits: RateUnits.hourOrLess,
            input: Quality.fromNanolovelaces(Rational.fromInt(1024)).per(const Duration(seconds: 1)),
            expected: '1 µll s',
          );

          verifyQualityRateFormat(
            pattern: '0.# u:µll r:day',
            valueUnits: QualityUnits.all,
            rateUnits: RateUnits.all,
            input: Quality.fromNanolovelaces(Rational.fromInt(1024)).per(const Duration(seconds: 1)),
            expected: '88473.6 µll day',
          );
        });
      });
    });
  });
}

// https://en.wikipedia.org/wiki/List_of_humorous_units_of_measurement#Quality:_Lovelace
class Quality extends UnitOfMeasurement<QualityUnit, Quality> {
  Quality.fromUnits(QualityUnit unit, Rational value) : super.fromUnits(unit, value);

  factory Quality.fromNanolovelaces(Rational nanolovelaces) =>
      Quality.fromUnits(QualityUnit.nanolovelace, nanolovelaces);

  factory Quality.fromMicrolovelaces(Rational microlovelaces) =>
      Quality.fromUnits(QualityUnit.microlovelace, microlovelaces);

  factory Quality.fromMillilovelaces(Rational millilovelaces) =>
      Quality.fromUnits(QualityUnit.millilovelace, millilovelaces);

  factory Quality.fromCentilovelaces(Rational centilovelaces) =>
      Quality.fromUnits(QualityUnit.centilovelace, centilovelaces);

  factory Quality.fromDecilovelaces(Rational decilovelaces) =>
      Quality.fromUnits(QualityUnit.decilovelace, decilovelaces);

  factory Quality.fromLovelaces(Rational lovelaces) => Quality.fromUnits(QualityUnit.lovelace, lovelaces);

  factory Quality.fromCompromisedEngineerings(Rational compromisedEngineerings) =>
      Quality.fromUnits(QualityUnit.compromisedEngineering, compromisedEngineerings);

  factory Quality.fromWeirdlovelaces(Rational weirdlovelaces) =>
      Quality.fromUnits(QualityUnit.weirdlovelace, weirdlovelaces);

  static final zero = Quality.fromNanolovelaces(Rational.fromInt(0));

  Rational get nanolovelaces => getUnits(QualityUnit.nanolovelace);
  Rational get microlovelaces => getUnits(QualityUnit.microlovelace);
  Rational get millilovelaces => getUnits(QualityUnit.millilovelace);
  Rational get centilovelaces => getUnits(QualityUnit.centilovelace);
  Rational get decilovelaces => getUnits(QualityUnit.decilovelace);
  Rational get lovelaces => getUnits(QualityUnit.lovelace);

  QualityRate per(Duration period) => QualityRate(
        value: this,
        period: period,
      );

  @override
  Rational getUnits(QualityUnit unit) => baseValue / unit._lovelaceCount;

  @override
  String toString() => QualityFormat().format(this);

  @override
  @protected
  Quality createValue(Rational baseValue) => Quality.fromLovelaces(baseValue);

  @override
  @protected
  Rational getBaseValue(QualityUnit unit, Rational value) => value * unit._lovelaceCount;
}

enum QualityUnit {
  nanolovelace,
  microlovelace,
  millilovelace,
  centilovelace,
  decilovelace,
  // This is our base unit.
  lovelace,
  // I just need something with a multi-word name for testing, and just drawing on my experience for the name :)
  compromisedEngineering,
  // And need something non-metric so we can scale rates to weird values (like infinite precision numbers)
  weirdlovelace,
}

class QualityUnits {
  static const metric = <QualityUnit>{
    QualityUnit.nanolovelace,
    QualityUnit.microlovelace,
    QualityUnit.millilovelace,
    QualityUnit.centilovelace,
    QualityUnit.decilovelace,
    QualityUnit.lovelace,
    QualityUnit.compromisedEngineering,
  };

  static const imperial = <QualityUnit>{
    QualityUnit.weirdlovelace,
  };

  static const all = <QualityUnit>{
    ...metric,
    ...imperial,
  };
}

extension QualityUnitExtensions on QualityUnit {
  static final _lovelacesInNanolovelace = Rationals.billionth;
  static final _lovelacesInMicrolovelace = Rationals.millionth;
  static final _lovelacesInMillilovelace = Rationals.thousandth;
  static final _lovelacesInCentilovelace = Rationals.hundredth;
  static final _lovelacesInDecilovelace = Rationals.tenth;
  static final _lovelacesInLovelace = Rationals.one;
  static final _lovelacesInCompromisedEngineering = Rationals.ten;
  static final _lovelacesInWeirdlovelace = Rational.fromInt(3);

  Rational get _lovelaceCount {
    switch (this) {
      case QualityUnit.nanolovelace:
        return _lovelacesInNanolovelace;
      case QualityUnit.microlovelace:
        return _lovelacesInMicrolovelace;
      case QualityUnit.millilovelace:
        return _lovelacesInMillilovelace;
      case QualityUnit.centilovelace:
        return _lovelacesInCentilovelace;
      case QualityUnit.decilovelace:
        return _lovelacesInDecilovelace;
      case QualityUnit.lovelace:
        return _lovelacesInLovelace;
      case QualityUnit.compromisedEngineering:
        return _lovelacesInCompromisedEngineering;
      case QualityUnit.weirdlovelace:
        return _lovelacesInWeirdlovelace;
    }
  }

  String getName({
    required String locale,
  }) {
    switch (this) {
      case QualityUnit.nanolovelace:
        return 'nanolovelace';
      case QualityUnit.microlovelace:
        return 'microlovelace';
      case QualityUnit.millilovelace:
        return 'millilovelace';
      case QualityUnit.centilovelace:
        return 'centilovelace';
      case QualityUnit.decilovelace:
        return 'decilovelace';
      case QualityUnit.lovelace:
        return 'lovelace';
      case QualityUnit.compromisedEngineering:
        return 'compromised engineering';
      case QualityUnit.weirdlovelace:
        return 'weirdlovelace';
    }
  }

  String getSymbol({
    required String locale,
  }) {
    switch (this) {
      case QualityUnit.nanolovelace:
        return 'nll';
      case QualityUnit.microlovelace:
        return 'µll';
      case QualityUnit.millilovelace:
        return 'mll';
      case QualityUnit.centilovelace:
        return 'cll';
      case QualityUnit.decilovelace:
        return 'dll';
      case QualityUnit.lovelace:
        return 'll';
      case QualityUnit.compromisedEngineering:
        return 'zl';
      case QualityUnit.weirdlovelace:
        return 'wll';
    }
  }

  String get patternSpecifier => getSymbol(
        locale: 'en',
      );
}

extension IntExtensions on int {
  Quality nanolovelaces() => Quality.fromNanolovelaces(Rational.fromInt(this));
  Quality microlovelaces() => Quality.fromMicrolovelaces(Rational.fromInt(this));
  Quality millilovelaces() => Quality.fromMillilovelaces(Rational.fromInt(this));
  Quality centilovelaces() => Quality.fromCentilovelaces(Rational.fromInt(this));
  Quality decilovelaces() => Quality.fromDecilovelaces(Rational.fromInt(this));
  Quality lovelaces() => Quality.fromLovelaces(Rational.fromInt(this));
  Quality compromisedEngineerings() => Quality.fromCompromisedEngineerings(Rational.fromInt(this));
  Quality weirdlovelaces() => Quality.fromWeirdlovelaces(Rational.fromInt(this));
}

class QualityRate extends UnitOfMeasurementRate<Quality> {
  const QualityRate({
    required Quality value,
    required Duration period,
  }) : super(
          value: value,
          period: period,
        );

  @override
  String toString() => QualityRateFormat().format(this);
}

class QualityFormat extends BaseQualityFormat<Quality> {
  QualityFormat({
    String pattern = '0.## ${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}',
    Set<QualityUnit> valueUnits = QualityUnits.all,
    String? locale,
  }) : super(
          pattern: pattern,
          valueUnits: valueUnits,
          rateUnits: const <RateUnit>{},
          locale: locale,
        );

  @override
  QualityUnit getLargestUnit(Quality input) => input.getLargestUnit(permissibleUnits: valueUnits);

  @override
  Rational getUnitQuantity(Quality input, QualityUnit unit) => input.getUnits(unit);

  @override
  Quality scaleToRateUnit(Quality input, RateUnit rateUnit) =>
      throw UnsupportedError('Cannot scale QualitySize to a RateUnit');
}

class QualityRateFormat extends BaseQualityFormat<QualityRate> {
  QualityRateFormat({
    String pattern =
        "0.## ${UnitOfMeasurementFormat.valueUnitSymbolFormatSpecifier}'/'${UnitOfMeasurementFormat.rateUnitSymbolFormatSpecifier}",
    Set<QualityUnit> valueUnits = QualityUnits.all,
    Set<RateUnit> rateUnits = RateUnits.hourOrLess,
    String? locale,
  }) : super(
          pattern: pattern,
          valueUnits: valueUnits,
          rateUnits: rateUnits,
          locale: locale,
        );

  @override
  QualityUnit getLargestUnit(QualityRate input) => input.value.getLargestUnit(permissibleUnits: valueUnits);

  @override
  Rational getUnitQuantity(QualityRate input, QualityUnit unit) => input.value.getUnits(unit);

  @override
  QualityRate scaleToRateUnit(QualityRate input, RateUnit rateUnit) {
    final scaledPeriod = rateUnit.duration;
    final scale = Rational.fromInt(scaledPeriod.inMicroseconds) / Rational.fromInt(input.period.inMicroseconds);
    final result = Quality.fromLovelaces(input.value.lovelaces * scale).per(scaledPeriod);
    return result;
  }
}

abstract class BaseQualityFormat<TInput> extends UnitOfMeasurementFormat<TInput, QualityUnit> {
  BaseQualityFormat({
    required String pattern,
    required this.valueUnits,
    required this.rateUnits,
    required String? locale,
  }) : super(
          pattern: pattern,
          locale: locale,
        );

  final Set<QualityUnit> valueUnits;
  final Set<RateUnit> rateUnits;

  @override
  String getPatternSpecifierFor(QualityUnit valueUnit) => valueUnit.patternSpecifier;

  @override
  Set<RateUnit> getPermissibleRateUnits() => rateUnits;

  @override
  Set<QualityUnit> getPermissibleValueUnits() => valueUnits;

  @override
  String getUnitName(QualityUnit unit, String locale) => unit.getName(locale: locale);

  @override
  String getUnitSymbol(QualityUnit unit, String locale) => unit.getSymbol(locale: locale);
}
