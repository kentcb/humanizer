import 'package:test/test.dart';
import 'package:humanizer/humanizer.dart';

void main() {
  _toSentenceCase();
  _toTitleCase();
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
          final transformation = ToSentenceCaseTransformation(convertAcronyms: convertAcronyms);
          final result = transformation.transform(input, '');
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
    verifyToSentenceCase(
        input: 'alternative punctuation! see? cool: one — two',
        expected: 'Alternative punctuation! See? Cool: One — Two');
    verifyToSentenceCase(
        input: 'here is some text, FYI. I hope you like it! peace',
        expected: 'Here is some text, FYI. I hope you like it! Peace');
  });
}

void _toTitleCase() {
  group('to title case', () {
    void verifyToTitleCase({
      required String input,
      required String expected,
      bool convertAcronyms = false,
    }) {
      test(
        '$input → $expected',
        () {
          final transformation = ToTitleCaseTransformation(convertAcronyms: convertAcronyms);
          final result = transformation.transform(input, '');
          expect(result, expected);
        },
      );
    }

    verifyToTitleCase(input: '', expected: '');
    verifyToTitleCase(input: 'Abc', expected: 'Abc');
    verifyToTitleCase(input: 'abc', expected: 'Abc');
    verifyToTitleCase(input: 'ABC', expected: 'ABC');
    verifyToTitleCase(input: 'ABC', expected: 'Abc', convertAcronyms: true);
    verifyToTitleCase(input: 'ACRONYM first', expected: 'ACRONYM First');
    verifyToTitleCase(input: 'ACRONYM first', expected: 'Acronym First', convertAcronyms: true);
    verifyToTitleCase(input: 'acronym SECOND', expected: 'Acronym SECOND');
    verifyToTitleCase(input: 'acronym SECOND', expected: 'Acronym Second', convertAcronyms: true);
    verifyToTitleCase(input: 'first sentence. second sentence.', expected: 'First Sentence. Second Sentence.');
    verifyToTitleCase(input: 'FIRST sentence. SECOND sentence.', expected: 'FIRST Sentence. SECOND Sentence.');
    verifyToTitleCase(
        input: 'FIRST sentence. SECOND sentence.', expected: 'First Sentence. Second Sentence.', convertAcronyms: true);
    verifyToTitleCase(input: 'first. \tsecond.', expected: 'First. \tSecond.');
    verifyToTitleCase(input: 'extra whitespace .   second .  ', expected: 'Extra Whitespace .   Second .  ');
    verifyToTitleCase(
        input: 'alternative punctuation! see? cool: one — two',
        expected: 'Alternative Punctuation! See? Cool: One — Two');
    verifyToTitleCase(
        input: 'here is some text, FYI. I hope you like it! peace',
        expected: 'Here Is Some Text, FYI. I Hope You Like It! Peace');
  });
}
