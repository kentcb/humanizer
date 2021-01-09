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
          final result = input.humanizeSymbolName();
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
      verifyHumanizeSymbolName(input: 'some- thing', expected: 'Some thing');
      verifyHumanizeSymbolName(input: 'some_ thing', expected: 'Some thing');
      verifyHumanizeSymbolName(input: 'some -thing', expected: 'Some thing');
      verifyHumanizeSymbolName(input: 'some _thing', expected: 'Some thing');
      verifyHumanizeSymbolName(input: 'some - thing', expected: 'Some thing');
      verifyHumanizeSymbolName(input: 'some _ thing', expected: 'Some thing');
    });

    group('camel-cased', () {
      verifyHumanizeSymbolName(input: 'camelCaseInputString', expected: 'Camel case input string');
      verifyHumanizeSymbolName(input: 'anUpperCaseIIsSpecialCased', expected: 'An upper case I is special cased');
      verifyHumanizeSymbolName(input: 'anACRONYMIsSpecialCased', expected: 'An ACRONYM is special cased');
      verifyHumanizeSymbolName(input: 'youAndIAreAwesome', expected: 'You and I are awesome');
      verifyHumanizeSymbolName(input: 'atTheEnd42', expected: 'At the end 42');
      verifyHumanizeSymbolName(input: 'ordinalNumberLike5th', expected: 'Ordinal number like 5th');
      verifyHumanizeSymbolName(input: 'contains?\')Symbol@Characters', expected: 'Contains symbol characters');
    });

    group('pascal-cased', () {
      verifyHumanizeSymbolName(input: 'PascalCaseInputString', expected: 'Pascal case input string');
      verifyHumanizeSymbolName(input: 'AnUpperCaseIIsSpecialCased', expected: 'An upper case I is special cased');
      verifyHumanizeSymbolName(input: 'AnACRONYMIsSpecialCased', expected: 'An ACRONYM is special cased');
      verifyHumanizeSymbolName(input: 'YouAndIAreAwesome', expected: 'You and I are awesome');
      verifyHumanizeSymbolName(input: '42AtTheStart', expected: '42 at the start');
      verifyHumanizeSymbolName(input: 'AtTheEnd42', expected: 'At the end 42');
      verifyHumanizeSymbolName(input: 'OrdinalNumberLike5th', expected: 'Ordinal number like 5th');
      verifyHumanizeSymbolName(
          input: 'XFirstWordIsSingleCapitalLetter', expected: 'X first word is single capital letter');
      verifyHumanizeSymbolName(
          input: 'XFirstWordIsSingleCapitalLetter FollowedBySpace',
          expected: 'X first word is single capital letter followed by space');
      verifyHumanizeSymbolName(input: 'Contains?\')Symbol@Characters', expected: 'Contains symbol characters');
    });

    group('snake-cased', () {
      verifyHumanizeSymbolName(input: 'snake_case_input_string', expected: 'Snake case input string');
      verifyHumanizeSymbolName(input: 'an_upper_case_I_is_special_cased', expected: 'An upper case I is special cased');
      verifyHumanizeSymbolName(input: 'an_ACRONYM_is_special_cased', expected: 'An ACRONYM is special cased');
      verifyHumanizeSymbolName(input: 'you-and-I-are-awesome', expected: 'You and I are awesome');
      verifyHumanizeSymbolName(input: '42_at_the_start', expected: '42 at the start');
      verifyHumanizeSymbolName(input: 'at_the__end_42', expected: 'At the end 42');
      verifyHumanizeSymbolName(input: 'ordinal_number_like_5th', expected: 'Ordinal number like 5th');
      verifyHumanizeSymbolName(
          input: 'X_first_word_is_single_capital_letter', expected: 'X first word is single capital letter');
      verifyHumanizeSymbolName(
          input: 'X_first_word_is_single_capital_letter followed_by_space',
          expected: 'X first word is single capital letter followed by space');
      verifyHumanizeSymbolName(input: 'contains_?\')_Symbol@_Characters', expected: 'Contains symbol characters');
    });

    group('kebab-cased', () {
      verifyHumanizeSymbolName(input: 'kebab-case-input-string', expected: 'Kebab case input string');
      verifyHumanizeSymbolName(input: 'an-upper-case-I-is-special-cased', expected: 'An upper case I is special cased');
      verifyHumanizeSymbolName(input: 'an-ACRONYM-is-special-cased', expected: 'An ACRONYM is special cased');
      verifyHumanizeSymbolName(input: 'you-and-I-are-awesome', expected: 'You and I are awesome');
      verifyHumanizeSymbolName(input: '42-at-the-start', expected: '42 at the start');
      verifyHumanizeSymbolName(input: 'at-the-end-42', expected: 'At the end 42');
      verifyHumanizeSymbolName(input: 'ordinal-number-like-5th', expected: 'Ordinal number like 5th');
      verifyHumanizeSymbolName(
          input: 'X-first-word-is-single-capital-letter', expected: 'X first word is single capital letter');
      verifyHumanizeSymbolName(
          input: 'X-first-word-is-single-capital-letter followed-by-space',
          expected: 'X first word is single capital letter followed by space');
      verifyHumanizeSymbolName(input: 'contains-?\')-Symbol@-Characters', expected: 'Contains symbol characters');
    });
  });
}
