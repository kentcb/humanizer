import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/transformations/cardinal.dart';
import 'package:test/test.dart';

void main() {
  _cardinalWords();
}

void _cardinalWords() {
  group('cardinal words', () {
    void verify({
      required int input,
      required String expected,
    }) {
      const transformation = CardinalWordsTransformation();
      final result = transformation.transform(input, '');
      expect(result, expected);
    }

    test('correct output', () {
      verify(input: 0, expected: 'zero');
      verify(input: 1, expected: 'one');
      verify(input: 2, expected: 'two');
      verify(input: 3, expected: 'three');
      verify(input: 4, expected: 'four');
      verify(input: 5, expected: 'five');
      verify(input: 6, expected: 'six');
      verify(input: 7, expected: 'seven');
      verify(input: 8, expected: 'eight');
      verify(input: 9, expected: 'nine');
      verify(input: 10, expected: 'ten');
      verify(input: 11, expected: 'eleven');
      verify(input: 12, expected: 'twelve');
      verify(input: 13, expected: 'thirteen');
      verify(input: 14, expected: 'fourteen');
      verify(input: 15, expected: 'fifteen');
      verify(input: 16, expected: 'sixteen');
      verify(input: 17, expected: 'seventeen');
      verify(input: 18, expected: 'eighteen');
      verify(input: 19, expected: 'nineteen');
      verify(input: 20, expected: 'twenty');
      verify(input: 21, expected: 'twenty-one');
      verify(input: 22, expected: 'twenty-two');
      verify(input: 23, expected: 'twenty-three');
      verify(input: 24, expected: 'twenty-four');
      verify(input: 25, expected: 'twenty-five');
      verify(input: 26, expected: 'twenty-six');
      verify(input: 27, expected: 'twenty-seven');
      verify(input: 28, expected: 'twenty-eight');
      verify(input: 29, expected: 'twenty-nine');
      verify(input: 30, expected: 'thirty');
      verify(input: 101, expected: 'one hundred and one');
      verify(input: 103, expected: 'one hundred and three');
      verify(input: 105, expected: 'one hundred and five');
      verify(input: 111, expected: 'one hundred and eleven');
      verify(input: 123, expected: 'one hundred and twenty-three');
      verify(
        input: 13238189,
        expected: 'thirteen million two hundred and thirty-eight thousand one hundred and eighty-nine',
      );
    });

    test('negative values are supported', () {
      verify(input: -1, expected: 'negative one');
      verify(input: -2, expected: 'negative two');
      verify(input: -3, expected: 'negative three');
      verify(input: -4, expected: 'negative four');
      verify(input: -5, expected: 'negative five');
      verify(input: -6, expected: 'negative six');
      verify(input: -7, expected: 'negative seven');
      verify(input: -8, expected: 'negative eight');
      verify(input: -9, expected: 'negative nine');
      verify(input: -10, expected: 'negative ten');
      verify(input: -11, expected: 'negative eleven');
      verify(input: -12, expected: 'negative twelve');
      verify(input: -13, expected: 'negative thirteen');
      verify(input: -14, expected: 'negative fourteen');
      verify(input: -15, expected: 'negative fifteen');
      verify(input: -16, expected: 'negative sixteen');
      verify(input: -17, expected: 'negative seventeen');
      verify(input: -18, expected: 'negative eighteen');
      verify(input: -19, expected: 'negative nineteen');
      verify(input: -20, expected: 'negative twenty');
      verify(input: -21, expected: 'negative twenty-one');
      verify(input: -22, expected: 'negative twenty-two');
      verify(input: -23, expected: 'negative twenty-three');
      verify(input: -24, expected: 'negative twenty-four');
      verify(input: -25, expected: 'negative twenty-five');
      verify(input: -26, expected: 'negative twenty-six');
      verify(input: -27, expected: 'negative twenty-seven');
      verify(input: -28, expected: 'negative twenty-eight');
      verify(input: -29, expected: 'negative twenty-nine');
      verify(input: -30, expected: 'negative thirty');
      verify(input: -101, expected: 'negative one hundred and one');
      verify(input: -103, expected: 'negative one hundred and three');
      verify(input: -105, expected: 'negative one hundred and five');
      verify(input: -111, expected: 'negative one hundred and eleven');
      verify(input: -123, expected: 'negative one hundred and twenty-three');
      verify(
        input: -13238189,
        expected: 'negative thirteen million two hundred and thirty-eight thousand one hundred and eighty-nine',
      );
    });
  });
}
