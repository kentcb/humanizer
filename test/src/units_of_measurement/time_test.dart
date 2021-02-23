import 'package:humanizer/humanizer.dart';
import 'package:test/test.dart';

void main() {
  _timeUnits();
}

void _timeUnits() {
  group('time units', () {
    test('all contains all units', () {
      final all = TimeUnit.values.toSet();
      final missing = all.difference(TimeUnits.all);
      expect(missing, <TimeUnit>{});
    });
  });
}
