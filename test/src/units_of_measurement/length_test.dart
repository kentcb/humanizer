import 'package:humanizer/humanizer.dart';
import 'package:test/test.dart';

void main() {
  _lengthUnits();
}

void _lengthUnits() {
  group('length units', () {
    test('all contains all units', () {
      final all = LengthUnit.values.toSet();
      final missing = all.difference(LengthUnits.all);
      expect(missing, <LengthUnit>{});
    });
  });
}
