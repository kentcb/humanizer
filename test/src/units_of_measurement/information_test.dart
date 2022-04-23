import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';
import 'package:test/test.dart';

void main() {
  _informationUnits();
  _toString();
}

void _informationUnits() {
  group('information units', () {
    test('all contains all units', () {
      final all = InformationUnit.values.toSet();
      final missing = all.difference(InformationUnits.all);
      expect(missing, <InformationUnit>{});
    });
  });
}

void _toString() {
  group('toString', () {
    test('InformationSize toString formats using defaults', () {
      void verify({
        required InformationSize value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(
          value: InformationSize.fromBytes(Rational.fromInt(3)),
          expected: '3B');
      verify(
          value: InformationSize.fromKibibytes(Rational.fromInt(3)),
          expected: '3KiB');
      verify(
          value:
              InformationSize.fromMegabytes(Rational.fromInt(8127161, 10000)),
          expected: '775.07MiB');
    });

    test('InformationRate toString formats using defaults', () {
      void verify({
        required InformationRate value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(
          value: InformationSize.fromBytes(Rational.fromInt(30))
              .per(const Duration(minutes: 1)),
          expected: '30B/min');
      verify(
          value: InformationSize.fromKibibytes(Rationals.tenth)
              .per(const Duration(minutes: 1)),
          expected: '6KiB/hr');
    });
  });
}
