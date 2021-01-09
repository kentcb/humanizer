import 'package:test/test.dart';
import 'package:humanizer/humanizer.dart';

void main() {
  _toSentenceCase();
}

void _toSentenceCase() {
  group('to sentence case', () {
    void verifyToSentenceCase({
      required String input,
      required String expected,
      bool convertAcronyms = false,
    }) {
      test(
        '$input → $expected',
        () {
          final result = input.toSentenceCase(convertAcryonyms: convertAcronyms);
          expect(result, expected);
        },
      );
    }

    verifyToSentenceCase(input: '', expected: '');
    verifyToSentenceCase(input: 'Abc', expected: 'Abc');
    verifyToSentenceCase(input: 'abc', expected: 'Abc');
    verifyToSentenceCase(input: 'ABC', expected: 'ABC');
    verifyToSentenceCase(input: 'ABC', expected: 'Abc', convertAcronyms: true);
    verifyToSentenceCase(input: 'ACRONYM first', expected: 'ACRONYM first');
    verifyToSentenceCase(input: 'ACRONYM first', expected: 'Acronym first', convertAcronyms: true);
    verifyToSentenceCase(input: 'acronym SECOND', expected: 'Acronym SECOND');
    verifyToSentenceCase(input: 'acronym SECOND', expected: 'Acronym second', convertAcronyms: true);
    verifyToSentenceCase(input: 'first sentence. second sentence.', expected: 'First sentence. Second sentence.');
    verifyToSentenceCase(input: 'FIRST sentence. SECOND sentence.', expected: 'FIRST sentence. SECOND sentence.');
    verifyToSentenceCase(
        input: 'FIRST sentence. SECOND sentence.', expected: 'First sentence. Second sentence.', convertAcronyms: true);
    verifyToSentenceCase(input: 'first. \tsecond.', expected: 'First. \tSecond.');
    verifyToSentenceCase(input: 'extra whitespace .   second .  ', expected: 'Extra whitespace .   Second .  ');
    verifyToSentenceCase(input: 'alternative punctuation! see? cool', expected: 'Alternative punctuation! See? Cool');
    verifyToSentenceCase(
        input: 'here is some text, FYI. I hope you like it! peace',
        expected: 'Here is some text, FYI. I hope you like it! Peace');
  });
}
