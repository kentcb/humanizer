import 'package:decimal/decimal.dart';
import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/decimals.dart';
import 'package:test/test.dart';

void main() {
  _rateUnits();
  _unitOfMeasurement();
  _unitOfMeasurementFormat();
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
        final sut = Quality.fromUnits(unit, ds('42'));
        expect(sut.getUnits(unit), ds('42'));
      });

      QualityUnits.all.skip(1).forEach((unit) {
        final sut = Quality.fromUnits(unit, ds('69')) + Quality.fromNanolovelaces(di(1));
        expect(sut.getUnits(unit), greaterThan(ds('69')));
        expect(sut.getUnits(unit), lessThan(ds('69.1')));
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
        final values = <Decimal, QualityUnit>{
          ds('1'): QualityUnit.nanolovelace,
          ds('999'): QualityUnit.nanolovelace,
          ds('1000'): QualityUnit.microlovelace,
          ds('999999'): QualityUnit.microlovelace,
          ds('1000000'): QualityUnit.millilovelace,
          ds('9999999'): QualityUnit.millilovelace,
          ds('10000000'): QualityUnit.centilovelace,
          ds('99999999'): QualityUnit.centilovelace,
          ds('100000000'): QualityUnit.decilovelace,
          ds('999999999'): QualityUnit.decilovelace,
          ds('1000000000'): QualityUnit.lovelace,
        };

        values.forEach((nanolovelaces, expected) {
          final sut = Quality.fromNanolovelaces(nanolovelaces);
          expect(sut.getLargestUnit(permissibleUnits: QualityUnits.all), expected);
        });
      });

      test('can restrict permissible units', () {
        final sut = Quality.fromCentilovelaces(di(1));

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
        final sut = Quality.fromCentilovelaces(di(1));

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
        final sut = Quality.fromMicrolovelaces(di(1));

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
      void verifyEqual(QualityUnit unit1, int operand1, QualityUnit unit2, int operand2, bool expected) {
        final first = Quality.fromUnits(unit1, di(operand1));
        final second = Quality.fromUnits(unit2, di(operand2));
        final result = first == second;
        expect(result, expected, reason: '$first != $second');
        expect(first.compareTo(second) == 0, expected);
        expect(first.hashCode == second.hashCode, expected);
      }

      verifyEqual(QualityUnit.nanolovelace, 1, QualityUnit.nanolovelace, 0, false);
      verifyEqual(QualityUnit.nanolovelace, 0, QualityUnit.nanolovelace, 1, false);
      verifyEqual(QualityUnit.nanolovelace, 0, QualityUnit.nanolovelace, 0, true);
      verifyEqual(QualityUnit.nanolovelace, 42, QualityUnit.nanolovelace, 42, true);
      verifyEqual(QualityUnit.nanolovelace, 1000000, QualityUnit.millilovelace, 1, true);
      verifyEqual(QualityUnit.nanolovelace, 1000001, QualityUnit.millilovelace, 1, false);
    });

    test('abs', () {
      expect(ds('42'), Quality.fromNanolovelaces(ds('42')).abs().nanolovelaces);
      expect(ds('42'), Quality.fromNanolovelaces(ds('-42')).abs().nanolovelaces);
    });

    test('+', () {
      void verifyAdd(Decimal operand1, Decimal operand2, Decimal expected) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = Quality.fromNanolovelaces(operand2);
        final result = first + second;
        expect(result.nanolovelaces, expected);
      }

      verifyAdd(di(0), di(0), di(0));
      verifyAdd(di(1), di(0), di(1));
      verifyAdd(di(0), di(1), di(1));
      verifyAdd(di(1), di(1), di(2));
      verifyAdd(di(40), di(2), di(42));
      verifyAdd(di(2), di(40), di(42));
      verifyAdd(di(44), di(-2), di(42));
      verifyAdd(di(-2), di(44), di(42));
      verifyAdd(ds('10.5'), ds('1.25'), ds('11.75'));
    });

    test('-', () {
      void verifySubtract(Decimal operand1, Decimal operand2, Decimal expected) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = Quality.fromNanolovelaces(operand2);
        final result = first - second;
        expect(result.nanolovelaces, expected);
      }

      verifySubtract(di(0), di(0), di(0));
      verifySubtract(di(1), di(0), di(1));
      verifySubtract(di(0), di(1), di(-1));
      verifySubtract(di(1), di(1), di(0));
      verifySubtract(di(44), di(2), di(42));
      verifySubtract(di(2), di(44), di(-42));
      verifySubtract(di(40), di(-2), di(42));
      verifySubtract(di(-2), di(40), di(-42));
      verifySubtract(ds('10.5'), ds('1.25'), ds('9.25'));
    });

    test('unary -', () {
      void verifyNegation(Decimal operand, Decimal expected) {
        final value = Quality.fromNanolovelaces(operand);
        final result = -value;
        expect(result.nanolovelaces, expected);
      }

      verifyNegation(di(0), di(0));
      verifyNegation(di(1), di(-1));
      verifyNegation(di(-1), di(1));
      verifyNegation(di(42), di(-42));
      verifyNegation(di(-42), di(42));
      verifyNegation(ds('10.5'), ds('-10.5'));
      verifyNegation(ds('-10.5'), ds('10.5'));
    });

    test('*', () {
      void verifyMultiply(Decimal operand1, Decimal operand2, Decimal expected) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = operand2;
        final result = first * second;
        expect(result.nanolovelaces, expected);
      }

      verifyMultiply(di(0), di(0), di(0));
      verifyMultiply(di(1), di(0), di(0));
      verifyMultiply(di(0), di(1), di(0));
      verifyMultiply(di(1), di(1), di(1));
      verifyMultiply(di(42), di(1), di(42));
      verifyMultiply(di(1), di(42), di(42));
      verifyMultiply(di(21), di(2), di(42));
      verifyMultiply(di(2), di(21), di(42));
      verifyMultiply(di(13), di(-2), di(-26));
      verifyMultiply(ds('10.5'), ds('1.25'), ds('13.125'));
    });

    test('/', () {
      void verifyDivide(Decimal operand1, Decimal operand2, Decimal expected) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = operand2;
        final result = first / second;
        expect(result.nanolovelaces, expected);
      }

      verifyDivide(di(1), di(1), di(1));
      verifyDivide(di(2), di(1), di(2));
      verifyDivide(di(3), di(2), ds('1.5'));
      verifyDivide(di(4), di(-2), ds('-2'));
      verifyDivide(ds('10.5'), ds('1.25'), ds('8.4'));

      expect(
        () => Quality.fromNanolovelaces(di(1)) / di(0),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('<', () {
      void verifyLessThan(Decimal operand1, Decimal operand2, bool expected) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = Quality.fromNanolovelaces(operand2);
        final result = first < second;
        expect(result, expected);
        expect(first.compareTo(second) < 0, expected);
      }

      verifyLessThan(di(0), di(0), false);
      verifyLessThan(di(1), di(0), false);
      verifyLessThan(di(0), di(1), true);
      verifyLessThan(di(-1), di(1), true);
      verifyLessThan(di(42), di(42), false);
      verifyLessThan(di(69), di(42), false);
      verifyLessThan(di(42), di(69), true);
      verifyLessThan(ds('10.5'), ds('10.5'), false);
      verifyLessThan(ds('1.25'), ds('10.5'), true);
      verifyLessThan(ds('10.5'), ds('1.25'), false);
    });

    test('<=', () {
      void verifyLessThanOrEqual(Decimal operand1, Decimal operand2, bool expected) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = Quality.fromNanolovelaces(operand2);
        final result = first <= second;
        expect(result, expected);
        expect(first.compareTo(second) > 0, !expected);
      }

      verifyLessThanOrEqual(di(0), di(0), true);
      verifyLessThanOrEqual(di(1), di(0), false);
      verifyLessThanOrEqual(di(0), di(1), true);
      verifyLessThanOrEqual(di(-1), di(1), true);
      verifyLessThanOrEqual(di(42), di(42), true);
      verifyLessThanOrEqual(di(69), di(42), false);
      verifyLessThanOrEqual(di(42), di(69), true);
      verifyLessThanOrEqual(ds('10.5'), ds('10.5'), true);
      verifyLessThanOrEqual(ds('1.25'), ds('10.5'), true);
      verifyLessThanOrEqual(ds('10.5'), ds('1.25'), false);
    });

    test('>', () {
      void verifyGreaterThan(Decimal operand1, Decimal operand2, bool expected) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = Quality.fromNanolovelaces(operand2);
        final result = first > second;
        expect(result, expected);
        expect(first.compareTo(second) > 0, expected);
      }

      verifyGreaterThan(di(0), di(0), false);
      verifyGreaterThan(di(1), di(0), true);
      verifyGreaterThan(di(0), di(1), false);
      verifyGreaterThan(di(-1), di(1), false);
      verifyGreaterThan(di(42), di(42), false);
      verifyGreaterThan(di(69), di(42), true);
      verifyGreaterThan(di(42), di(69), false);
      verifyGreaterThan(ds('10.5'), ds('10.5'), false);
      verifyGreaterThan(ds('1.25'), ds('10.5'), false);
      verifyGreaterThan(ds('10.5'), ds('1.25'), true);
    });

    test('>=', () {
      void verifyGreaterThanOrEqual(Decimal operand1, Decimal operand2, bool expected) {
        final first = Quality.fromNanolovelaces(operand1);
        final second = Quality.fromNanolovelaces(operand2);
        final result = first >= second;
        expect(result, expected);
        expect(first.compareTo(second) < 0, !expected);
      }

      verifyGreaterThanOrEqual(di(0), di(0), true);
      verifyGreaterThanOrEqual(di(1), di(0), true);
      verifyGreaterThanOrEqual(di(0), di(1), false);
      verifyGreaterThanOrEqual(di(-1), di(1), false);
      verifyGreaterThanOrEqual(di(42), di(42), true);
      verifyGreaterThanOrEqual(di(69), di(42), true);
      verifyGreaterThanOrEqual(di(42), di(69), false);
      verifyGreaterThanOrEqual(ds('10.5'), ds('10.5'), true);
      verifyGreaterThanOrEqual(ds('1.25'), ds('10.5'), false);
      verifyGreaterThanOrEqual(ds('10.5'), ds('1.25'), true);
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
        verifyQualityFormat(
          pattern: '',
          valueUnits: QualityUnits.all,
          input: Quality.fromNanolovelaces(ds('42')),
          expected: '',
        );

        verifyQualityRateFormat(
          pattern: '',
          valueUnits: QualityUnits.all,
          rateUnits: RateUnits.hourOrLess,
          input: Quality.fromNanolovelaces(ds('42')).per(const Duration(seconds: 1)),
          expected: '',
        );

        verifyQualityFormat(
          pattern: '0.#',
          valueUnits: QualityUnits.all,
          input: Quality.fromNanolovelaces(ds('1200')),
          expected: '1.2',
        );

        verifyQualityRateFormat(
          pattern: '0.#',
          valueUnits: QualityUnits.all,
          rateUnits: RateUnits.hourOrLess,
          input: Quality.fromNanolovelaces(ds('1200')).per(const Duration(seconds: 1)),
          expected: '72',
        );
      });

      test('works with dynamic units', () {
        verifyQualityFormat(
          pattern: 'u',
          valueUnits: QualityUnits.all,
          input: Quality.fromNanolovelaces(ds('1200')),
          expected: 'µll',
        );

        verifyQualityFormat(
          pattern: 'U',
          valueUnits: QualityUnits.all,
          input: Quality.fromNanolovelaces(ds('1200')),
          expected: 'microlovelaces',
        );

        verifyQualityFormat(
          pattern: "0.# u '('0.## U', to be more precise)'",
          valueUnits: QualityUnits.all,
          input: Quality.fromNanolovelaces(ds('1210')),
          expected: '1.2 µll (1.21 microlovelaces, to be more precise)',
        );

        verifyQualityRateFormat(
          pattern: 'u r',
          valueUnits: QualityUnits.all,
          rateUnits: RateUnits.hourOrLess,
          input: Quality.fromNanolovelaces(ds('1024')).per(const Duration(seconds: 1)),
          expected: 'µll min',
        );

        verifyQualityRateFormat(
          pattern: 'U R',
          valueUnits: QualityUnits.all,
          rateUnits: RateUnits.hourOrLess,
          input: Quality.fromNanolovelaces(ds('1024')).per(const Duration(seconds: 1)),
          expected: 'microlovelaces minute',
        );

        verifyQualityRateFormat(
          pattern: "0.# u r '('0.## U 'per' R', to be more precise)'",
          valueUnits: QualityUnits.all,
          rateUnits: RateUnits.hourOrLess,
          input: Quality.fromNanolovelaces(ds('1024')).per(const Duration(seconds: 1)),
          expected: '61.4 µll min (61.44 microlovelaces per minute, to be more precise)',
        );

        verifyQualityRateFormat(
          pattern: "0.# u r '('0.## U 'per' R', to be more precise)'",
          valueUnits: QualityUnits.all,
          rateUnits: RateUnits.hourOrLess,
          input: Quality.fromNanolovelaces(ds('1024')).per(const Duration(minutes: 1)),
          expected: '61.4 µll hr (61.44 microlovelaces per hour, to be more precise)',
        );
      });

      test('works with fixed units', () {
        verifyQualityFormat(
          pattern: 'u:µll',
          valueUnits: QualityUnits.all,
          input: Quality.fromNanolovelaces(ds('1210')),
          expected: 'µll',
        );

        verifyQualityFormat(
          pattern: 'U:µll',
          valueUnits: QualityUnits.all,
          input: Quality.fromNanolovelaces(ds('1210')),
          expected: 'microlovelaces',
        );

        verifyQualityFormat(
          pattern: 'U:zl',
          valueUnits: QualityUnits.all,
          input: Quality.fromNanolovelaces(ds('1210')),
          expected: 'compromised engineerings',
        );

        verifyQualityFormat(
          pattern: '0.# u:nll',
          valueUnits: QualityUnits.all,
          input: Quality.fromNanolovelaces(ds('1210')),
          expected: '1210 nll',
        );

        verifyQualityFormat(
          pattern: '0.# u:µll',
          valueUnits: QualityUnits.all,
          input: Quality.fromNanolovelaces(ds('1210')),
          expected: '1.2 µll',
        );

        verifyQualityRateFormat(
          pattern: 'u:cll r:min',
          valueUnits: QualityUnits.all,
          rateUnits: RateUnits.hourOrLess,
          input: Quality.fromNanolovelaces(ds('1024')).per(const Duration(seconds: 1)),
          expected: 'cll min',
        );

        verifyQualityRateFormat(
          pattern: 'U:cll R:min',
          valueUnits: QualityUnits.all,
          rateUnits: RateUnits.hourOrLess,
          input: Quality.fromNanolovelaces(ds('1024')).per(const Duration(seconds: 1)),
          expected: 'centilovelaces minute',
        );

        verifyQualityRateFormat(
          pattern: "0.# u:µll r:min '('0.## U:µll 'per' R:min', to be more precise)'",
          valueUnits: QualityUnits.all,
          rateUnits: RateUnits.hourOrLess,
          input: Quality.fromNanolovelaces(ds('1024')).per(const Duration(seconds: 1)),
          expected: '61.4 µll min (61.44 microlovelaces per minute, to be more precise)',
        );
      });

      test('respects supported units', () {
        verifyQualityFormat(
          pattern: '0.# u',
          valueUnits: QualityUnits.all,
          input: Quality.fromNanolovelaces(ds('1210')),
          expected: '1.2 µll',
        );

        verifyQualityFormat(
          pattern: '0.# u',
          valueUnits: <QualityUnit>{
            QualityUnit.nanolovelace,
            QualityUnit.millilovelace,
          },
          input: Quality.fromNanolovelaces(ds('1210')),
          expected: '1210 nll',
        );

        verifyQualityFormat(
          pattern: '0.# u',
          valueUnits: <QualityUnit>{
            QualityUnit.nanolovelace,
            QualityUnit.millilovelace,
          },
          input: Quality.fromLovelaces(di(1)),
          expected: '1000 mll',
        );

        verifyQualityFormat(
          pattern: '0.# u',
          valueUnits: <QualityUnit>{
            QualityUnit.nanolovelace,
            QualityUnit.millilovelace,
            QualityUnit.decilovelace,
          },
          input: Quality.fromLovelaces(di(1)),
          expected: '10 dll',
        );

        verifyQualityRateFormat(
          pattern: '0.# u:µll r:s',
          valueUnits: QualityUnits.all,
          rateUnits: RateUnits.hourOrLess,
          input: Quality.fromNanolovelaces(ds('1024')).per(const Duration(seconds: 1)),
          expected: '1 µll s',
        );

        verifyQualityRateFormat(
          pattern: '0.# u:µll r:day',
          valueUnits: QualityUnits.all,
          rateUnits: RateUnits.all,
          input: Quality.fromNanolovelaces(ds('1024')).per(const Duration(seconds: 1)),
          expected: '88473.6 µll day',
        );
      });
    });
  });
}

// https://en.wikipedia.org/wiki/List_of_humorous_units_of_measurement#Quality:_Lovelace
class Quality extends UnitOfMeasurement<QualityUnit, Quality> {
  Quality.fromUnits(QualityUnit unit, Decimal value) : super.fromUnits(unit, value);

  factory Quality.fromNanolovelaces(Decimal nanolovelaces) =>
      Quality.fromUnits(QualityUnit.nanolovelace, nanolovelaces);

  factory Quality.fromMicrolovelaces(Decimal microlovelaces) =>
      Quality.fromUnits(QualityUnit.microlovelace, microlovelaces);

  factory Quality.fromMillilovelaces(Decimal millilovelaces) =>
      Quality.fromUnits(QualityUnit.millilovelace, millilovelaces);

  factory Quality.fromCentilovelaces(Decimal centilovelaces) =>
      Quality.fromUnits(QualityUnit.centilovelace, centilovelaces);

  factory Quality.fromDecilovelaces(Decimal decilovelaces) =>
      Quality.fromUnits(QualityUnit.decilovelace, decilovelaces);

  factory Quality.fromLovelaces(Decimal lovelaces) => Quality.fromUnits(QualityUnit.lovelace, lovelaces);

  factory Quality.fromCompromisedEngineerings(Decimal compromisedEngineerings) =>
      Quality.fromUnits(QualityUnit.compromisedEngineering, compromisedEngineerings);

  static final zero = Quality.fromNanolovelaces(di(0));

  Decimal get nanolovelaces => getUnits(QualityUnit.nanolovelace);
  Decimal get microlovelaces => getUnits(QualityUnit.microlovelace);
  Decimal get millilovelaces => getUnits(QualityUnit.millilovelace);
  Decimal get centilovelaces => getUnits(QualityUnit.centilovelace);
  Decimal get decilovelaces => getUnits(QualityUnit.decilovelace);
  Decimal get lovelaces => getUnits(QualityUnit.lovelace);

  @override
  Quality createValue(Decimal baseValue) => Quality.fromLovelaces(baseValue);

  @override
  Decimal getUnits(QualityUnit unit) => baseValue / unit._lovelaceCount;

  @override
  Decimal getBaseValue(QualityUnit unit, Decimal value) => value * unit._lovelaceCount;

  QualityRate per(Duration period) => QualityRate(
        value: this,
        period: period,
      );

  @override
  String toString() => QualityFormat().format(this);
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
}

class QualityUnits {
  static const all = <QualityUnit>{
    QualityUnit.nanolovelace,
    QualityUnit.microlovelace,
    QualityUnit.millilovelace,
    QualityUnit.centilovelace,
    QualityUnit.decilovelace,
    QualityUnit.lovelace,
    QualityUnit.compromisedEngineering,
  };
}

extension QualityUnitExtensions on QualityUnit {
  static final _lovelacesInNanolovelace = Decimals.billionth;
  static final _lovelacesInMicrolovelace = Decimals.millionth;
  static final _lovelacesInMillilovelace = Decimals.thousandth;
  static final _lovelacesInCentilovelace = Decimals.hundredth;
  static final _lovelacesInDecilovelace = Decimals.tenth;
  static final _lovelacesInLovelace = di(1);
  static final _lovelacesInCompromisedEngineering = Decimals.ten;

  Decimal get _lovelaceCount {
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
    }
  }

  String get patternSpecifier => getSymbol(
        locale: 'en',
      );
}

extension IntExtensions on int {
  Quality nanolovelaces() => Quality.fromNanolovelaces(di(this));
  Quality microlovelaces() => Quality.fromMicrolovelaces(di(this));
  Quality millilovelaces() => Quality.fromMillilovelaces(di(this));
  Quality centilovelaces() => Quality.fromCentilovelaces(di(this));
  Quality decilovelaces() => Quality.fromDecilovelaces(di(this));
  Quality lovelaces() => Quality.fromLovelaces(di(this));
  Quality compromisedEngineerings() => Quality.fromCompromisedEngineerings(di(this));
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
  Decimal getUnitQuantity(Quality input, QualityUnit unit) => input.getUnits(unit);

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
  Decimal getUnitQuantity(QualityRate input, QualityUnit unit) => input.value.getUnits(unit);

  @override
  QualityRate scaleToRateUnit(QualityRate input, RateUnit rateUnit) {
    final scaledPeriod = rateUnit.duration;
    final scale = di(scaledPeriod.inMicroseconds) / di(input.period.inMicroseconds);
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
