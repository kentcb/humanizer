import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/rationals.dart';
import 'package:test/test.dart';

void main() {
  _areaUnits();
  _toString();
}

void _areaUnits() {
  group('area units', () {
    test('all contains all units', () {
      final all = AreaUnit.values.toSet();
      final missing = all.difference(AreaUnits.all);
      expect(missing, <AreaUnit>{});
    });
  });
}

void _toString() {
  group('toString', () {
    test('Area toString formats using defaults', () {
      void verify({
        required Area value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(value: Area.fromSquareMeters(Rational.fromInt(3)), expected: '3m²');
      verify(value: Area.fromSquareCentimeters(Rational.fromInt(3)), expected: '3cm²');
      verify(value: Area.fromSquareMeters(Rational.fromInt(8127161, 10000)), expected: '812.72m²');
    });

    test('AreaRate toString formats using defaults', () {
      void verify({
        required AreaRate value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(value: Area.fromSquareMeters(Rational.fromInt(30)).per(const Duration(minutes: 1)), expected: '30m²/min');
      verify(value: Area.fromSquareMeters(Rationals.tenth).per(const Duration(minutes: 1)), expected: '6m²/hr');
    });
  });
}
