import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/units_of_measurement/decimals.dart';
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

      verify(value: InformationSize.fromBytes(di(3)), expected: '3B');
      verify(value: InformationSize.fromKibibytes(di(3)), expected: '3KiB');
      verify(value: InformationSize.fromMegabytes(ds('812.7161')), expected: '775.07MiB');
    });

    test('InformationRate toString formats using defaults', () {
      void verify({
        required InformationRate value,
        required String expected,
      }) =>
          expect(value.toString(), expected);

      verify(value: InformationSize.fromBytes(di(30)).per(const Duration(minutes: 1)), expected: '0.5B/s');
      verify(value: InformationSize.fromKibibytes(ds('0.1')).per(const Duration(minutes: 1)), expected: '6KiB/hr');
    });
  });
}
