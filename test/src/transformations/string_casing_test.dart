import 'package:humanizer/humanizer.dart';
import 'package:test/test.dart';

void main() {
  _toSentenceCase();
  _toTitleCase();
}

void _toSentenceCase() {
  group('to sentence case', () {
    void verify({
      required String input,
      required String expected,
      bool convertAcronyms = false,
    }) {
      test(
        '$input → $expected',
        () {
          final transformation =
              ToSentenceCaseTransformation(convertAcronyms: convertAcronyms);
          final result = transformation.transform(input, '');
          expect(result, expected);
        },
      );
    }

    verify(input: '', expected: '');
    verify(input: 'Abc', expected: 'Abc');
    verify(input: 'abc', expected: 'Abc');
    verify(input: 'ABC', expected: 'ABC');
    verify(input: 'ABC', expected: 'Abc', convertAcronyms: true);
    verify(input: 'ACRONYM first', expected: 'ACRONYM first');
    verify(
        input: 'ACRONYM first',
        expected: 'Acronym first',
        convertAcronyms: true);
    verify(input: 'acronym SECOND', expected: 'Acronym SECOND');
    verify(
        input: 'acronym SECOND',
        expected: 'Acronym second',
        convertAcronyms: true);
    verify(
        input: 'first sentence. second sentence.',
        expected: 'First sentence. Second sentence.');
    verify(
        input: 'FIRST sentence. SECOND sentence.',
        expected: 'FIRST sentence. SECOND sentence.');
    verify(
        input: 'FIRST sentence. SECOND sentence.',
        expected: 'First sentence. Second sentence.',
        convertAcronyms: true);
    verify(input: 'first. \tsecond.', expected: 'First. \tSecond.');
    verify(
        input: 'extra whitespace .   second .  ',
        expected: 'Extra whitespace .   Second .  ');
    verify(
        input: 'alternative punctuation! see? cool: one — two',
        expected: 'Alternative punctuation! See? Cool: One — Two');
    verify(
        input: 'here is some text, FYI. I hope you like it! peace',
        expected: 'Here is some text, FYI. I hope you like it! Peace');
  });
}

void _toTitleCase() {
  group('to title case', () {
    void verify({
      required String input,
      required String expected,
      bool convertAcronyms = false,
    }) {
      test(
        '$input → $expected',
        () {
          final transformation =
              ToTitleCaseTransformation(convertAcronyms: convertAcronyms);
          final result = transformation.transform(input, '');
          expect(result, expected);
        },
      );
    }

    verify(input: '', expected: '');
    verify(input: 'Abc', expected: 'Abc');
    verify(input: 'abc', expected: 'Abc');
    verify(input: 'ABC', expected: 'ABC');
    verify(input: 'ABC', expected: 'Abc', convertAcronyms: true);
    verify(input: 'ACRONYM first', expected: 'ACRONYM First');
    verify(
        input: 'ACRONYM first',
        expected: 'Acronym First',
        convertAcronyms: true);
    verify(input: 'acronym SECOND', expected: 'Acronym SECOND');
    verify(
        input: 'acronym SECOND',
        expected: 'Acronym Second',
        convertAcronyms: true);
    verify(
        input: 'first sentence. second sentence.',
        expected: 'First Sentence. Second Sentence.');
    verify(
        input: 'FIRST sentence. SECOND sentence.',
        expected: 'FIRST Sentence. SECOND Sentence.');
    verify(
        input: 'FIRST sentence. SECOND sentence.',
        expected: 'First Sentence. Second Sentence.',
        convertAcronyms: true);
    verify(input: 'first. \tsecond.', expected: 'First. \tSecond.');
    verify(
        input: 'extra whitespace .   second .  ',
        expected: 'Extra Whitespace .   Second .  ');
    verify(
        input: 'alternative punctuation! see? cool: one — two',
        expected: 'Alternative Punctuation! See? Cool: One — Two');
    verify(
        input: 'here is some text, FYI. I hope you like it! peace',
        expected: 'Here Is Some Text, FYI. I Hope You Like It! Peace');
  });
}
