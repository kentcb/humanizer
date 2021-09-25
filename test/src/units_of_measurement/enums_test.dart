import 'package:humanizer/humanizer.dart';
import 'package:test/test.dart';

void main() {
  _enums();
}

void _enums() {
  group('enums', () {
    test('humanized', () {
      final humanized = Values.enumFirst.toHumanizedName();
      expect(humanized, 'enum first');
    });
  });
}

enum Values {
  enumFirst,
  enumSecond,
}
