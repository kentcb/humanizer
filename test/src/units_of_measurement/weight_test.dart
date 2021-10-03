import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/decimals.dart';
import 'package:test/test.dart';

void main() {
  _weightUnits();
  _toString();
}

void _weightUnits() {
  group('weight units', () {
    test('all contains all units', () {
      final all = WeightUnit.values.toSet();
      final missing = all.difference(WeightUnits.all);
      expect(missing, <WeightUnit>{});
    });
  });
}

void _toString() {
  group('toString', () {
    test('Weight toString formats using defaults', () {
      void verify({
        required Weight value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(value: Weight.fromKilograms(di(3)), expected: '3kg');
      verify(value: Weight.fromTonnes(di(3)), expected: '3t');
      verify(value: Weight.fromKilograms(ds('812.7161')), expected: '812.72kg');
    });

    test('WeightRate toString formats using defaults', () {
      void verify({
        required WeightRate value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(value: Weight.fromKilograms(di(30)).per(const Duration(minutes: 1)), expected: '30kg/min');
      verify(value: Weight.fromKilograms(ds('0.1')).per(const Duration(minutes: 1)), expected: '6kg/hr');
    });
  });
}
