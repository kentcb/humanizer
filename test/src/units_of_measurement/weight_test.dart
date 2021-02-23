import 'package:humanizer/humanizer.dart';
import 'package:test/test.dart';

void main() {
  _weightUnits();
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
