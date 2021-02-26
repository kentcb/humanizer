import 'package:test/test.dart';
import 'package:humanizer/humanizer.dart';

void main() {
  _humanizeSymbolName();
}

void _humanizeSymbolName() {
  group('humanize symbol name', () {
    void verifyHumanizeSymbolName({
      required String input,
      required String expected,
    }) {
      test(
        '$input → $expected',
        () {
          const transformation = SymbolNameTransformation();
          final result = transformation.transform(input, '');
          expect(result, expected);
        },
      );
    }

    group('shared cases', () {
      verifyHumanizeSymbolName(input: '', expected: '');
      verifyHumanizeSymbolName(input: 'A', expected: 'A');
      verifyHumanizeSymbolName(input: 'B', expected: 'B');
      verifyHumanizeSymbolName(input: 'ABC', expected: 'ABC');
      verifyHumanizeSymbolName(input: '?)@', expected: '');
      verifyHumanizeSymbolName(input: '?', expected: '');

      // Hyphens/underscores with surrounding space are treated as camel/pascal-cased.
      verifyHumanizeSymbolName(input: 'some- thing', expected: 'some thing');
      verifyHumanizeSymbolName(input: 'some_ thing', expected: 'some thing');
      verifyHumanizeSymbolName(input: 'some -thing', expected: 'some thing');
      verifyHumanizeSymbolName(input: 'some _thing', expected: 'some thing');
      verifyHumanizeSymbolName(input: 'some - thing', expected: 'some thing');
      verifyHumanizeSymbolName(input: 'some _ thing', expected: 'some thing');
    });

    group('camel-cased', () {
      verifyHumanizeSymbolName(
          input: 'camelCaseInputString', expected: 'camel case input string');
      verifyHumanizeSymbolName(
          input: 'anUpperCaseIIsSpecialCased',
          expected: 'an upper case I is special cased');
      verifyHumanizeSymbolName(
          input: 'anACRONYMIsSpecialCased',
          expected: 'an ACRONYM is special cased');
      verifyHumanizeSymbolName(
          input: 'youAndIAreAwesome', expected: 'you and I are awesome');
      verifyHumanizeSymbolName(input: 'atTheEnd42', expected: 'at the end 42');
      verifyHumanizeSymbolName(
          input: 'ordinalNumberLike5th', expected: 'ordinal number like 5th');
      verifyHumanizeSymbolName(
          input: 'contains?\')Symbol@Characters',
          expected: 'contains symbol characters');
    });

    group('pascal-cased', () {
      verifyHumanizeSymbolName(
          input: 'PascalCaseInputString', expected: 'pascal case input string');
      verifyHumanizeSymbolName(
          input: 'AnUpperCaseIIsSpecialCased',
          expected: 'an upper case I is special cased');
      verifyHumanizeSymbolName(
          input: 'AnACRONYMIsSpecialCased',
          expected: 'an ACRONYM is special cased');
      verifyHumanizeSymbolName(
          input: 'YouAndIAreAwesome', expected: 'you and I are awesome');
      verifyHumanizeSymbolName(
          input: '42AtTheStart', expected: '42 at the start');
      verifyHumanizeSymbolName(input: 'AtTheEnd42', expected: 'at the end 42');
      verifyHumanizeSymbolName(
          input: 'OrdinalNumberLike5th', expected: 'ordinal number like 5th');
      verifyHumanizeSymbolName(
          input: 'XFirstWordIsSingleCapitalLetter',
          expected: 'x first word is single capital letter');
      verifyHumanizeSymbolName(
          input: 'XFirstWordIsSingleCapitalLetter FollowedBySpace',
          expected: 'x first word is single capital letter followed by space');
      verifyHumanizeSymbolName(
          input: 'Contains?\')Symbol@Characters',
          expected: 'contains symbol characters');
    });

    group('snake-cased', () {
      verifyHumanizeSymbolName(
          input: 'snake_case_input_string',
          expected: 'snake case input string');
      verifyHumanizeSymbolName(
          input: 'an_upper_case_I_is_special_cased',
          expected: 'an upper case I is special cased');
      verifyHumanizeSymbolName(
          input: 'an_ACRONYM_is_special_cased',
          expected: 'an ACRONYM is special cased');
      verifyHumanizeSymbolName(
          input: 'you-and-I-are-awesome', expected: 'you and I are awesome');
      verifyHumanizeSymbolName(
          input: '42_at_the_start', expected: '42 at the start');
      verifyHumanizeSymbolName(
          input: 'at_the__end_42', expected: 'at the end 42');
      verifyHumanizeSymbolName(
          input: 'ordinal_number_like_5th',
          expected: 'ordinal number like 5th');
      verifyHumanizeSymbolName(
          input: 'X_first_word_is_single_capital_letter',
          expected: 'x first word is single capital letter');
      verifyHumanizeSymbolName(
          input: 'X_first_word_is_single_capital_letter followed_by_space',
          expected: 'x first word is single capital letter followed by space');
      verifyHumanizeSymbolName(
          input: 'contains_?\')_Symbol@_Characters',
          expected: 'contains symbol characters');
    });

    group('kebab-cased', () {
      verifyHumanizeSymbolName(
          input: 'kebab-case-input-string',
          expected: 'kebab case input string');
      verifyHumanizeSymbolName(
          input: 'an-upper-case-I-is-special-cased',
          expected: 'an upper case I is special cased');
      verifyHumanizeSymbolName(
          input: 'an-ACRONYM-is-special-cased',
          expected: 'an ACRONYM is special cased');
      verifyHumanizeSymbolName(
          input: 'you-and-I-are-awesome', expected: 'you and I are awesome');
      verifyHumanizeSymbolName(
          input: '42-at-the-start', expected: '42 at the start');
      verifyHumanizeSymbolName(
          input: 'at-the-end-42', expected: 'at the end 42');
      verifyHumanizeSymbolName(
          input: 'ordinal-number-like-5th',
          expected: 'ordinal number like 5th');
      verifyHumanizeSymbolName(
          input: 'X-first-word-is-single-capital-letter',
          expected: 'x first word is single capital letter');
      verifyHumanizeSymbolName(
          input: 'X-first-word-is-single-capital-letter followed-by-space',
          expected: 'x first word is single capital letter followed by space');
      verifyHumanizeSymbolName(
          input: 'contains-?\')-Symbol@-Characters',
          expected: 'contains symbol characters');
    });
  });
}
