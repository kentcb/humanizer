import 'package:humanizer/humanizer.dart';
import 'package:test/test.dart';

void main() {
  _symbolToHumanizedName();
}

void _symbolToHumanizedName() {
  void verify({
    required String input,
    required String expected,
  }) {
    test(
      '$input → $expected',
      () {
        const transformation = SymbolToHumanizedNameTransformation();
        final result = transformation.transform(SymbolName(input), '');
        expect(result, expected);
      },
    );
  }

  group('shared cases', () {
    verify(input: '', expected: '');
    verify(input: 'A', expected: 'A');
    verify(input: 'B', expected: 'B');
    verify(input: 'ABC', expected: 'ABC');
    verify(input: '?)@', expected: '');
    verify(input: '?', expected: '');

    // Hyphens/underscores with surrounding space are treated as camel/pascal-cased.
    verify(input: 'some- thing', expected: 'some thing');
    verify(input: 'some_ thing', expected: 'some thing');
    verify(input: 'some -thing', expected: 'some thing');
    verify(input: 'some _thing', expected: 'some thing');
    verify(input: 'some - thing', expected: 'some thing');
    verify(input: 'some _ thing', expected: 'some thing');
  });

  group('camel-cased', () {
    verify(input: 'camelCaseInputString', expected: 'camel case input string');
    verify(input: 'anUpperCaseIIsSpecialCased', expected: 'an upper case I is special cased');
    verify(input: 'anACRONYMIsSpecialCased', expected: 'an ACRONYM is special cased');
    verify(input: 'youAndIAreAwesome', expected: 'you and I are awesome');
    verify(input: 'atTheEnd42', expected: 'at the end 42');
    verify(input: 'ordinalNumberLike5th', expected: 'ordinal number like 5th');
    verify(input: 'contains?\')Symbol@Characters', expected: 'contains symbol characters');
  });

  group('pascal-cased', () {
    verify(input: 'PascalCaseInputString', expected: 'pascal case input string');
    verify(input: 'AnUpperCaseIIsSpecialCased', expected: 'an upper case I is special cased');
    verify(input: 'AnACRONYMIsSpecialCased', expected: 'an ACRONYM is special cased');
    verify(input: 'YouAndIAreAwesome', expected: 'you and I are awesome');
    verify(input: '42AtTheStart', expected: '42 at the start');
    verify(input: 'AtTheEnd42', expected: 'at the end 42');
    verify(input: 'OrdinalNumberLike5th', expected: 'ordinal number like 5th');
    verify(input: 'XFirstWordIsSingleCapitalLetter', expected: 'x first word is single capital letter');
    verify(
        input: 'XFirstWordIsSingleCapitalLetter FollowedBySpace',
        expected: 'x first word is single capital letter followed by space');
    verify(input: 'Contains?\')Symbol@Characters', expected: 'contains symbol characters');
  });

  group('snake-cased', () {
    verify(input: 'snake_case_input_string', expected: 'snake case input string');
    verify(input: 'an_upper_case_I_is_special_cased', expected: 'an upper case I is special cased');
    verify(input: 'an_ACRONYM_is_special_cased', expected: 'an ACRONYM is special cased');
    verify(input: 'you-and-I-are-awesome', expected: 'you and I are awesome');
    verify(input: '42_at_the_start', expected: '42 at the start');
    verify(input: 'at_the__end_42', expected: 'at the end 42');
    verify(input: 'ordinal_number_like_5th', expected: 'ordinal number like 5th');
    verify(input: 'X_first_word_is_single_capital_letter', expected: 'x first word is single capital letter');
    verify(
        input: 'X_first_word_is_single_capital_letter followed_by_space',
        expected: 'x first word is single capital letter followed by space');
    verify(input: 'contains_?\')_Symbol@_Characters', expected: 'contains symbol characters');
  });

  group('kebab-cased', () {
    verify(input: 'kebab-case-input-string', expected: 'kebab case input string');
    verify(input: 'an-upper-case-I-is-special-cased', expected: 'an upper case I is special cased');
    verify(input: 'an-ACRONYM-is-special-cased', expected: 'an ACRONYM is special cased');
    verify(input: 'you-and-I-are-awesome', expected: 'you and I are awesome');
    verify(input: '42-at-the-start', expected: '42 at the start');
    verify(input: 'at-the-end-42', expected: 'at the end 42');
    verify(input: 'ordinal-number-like-5th', expected: 'ordinal number like 5th');
    verify(input: 'X-first-word-is-single-capital-letter', expected: 'x first word is single capital letter');
    verify(
        input: 'X-first-word-is-single-capital-letter followed-by-space',
        expected: 'x first word is single capital letter followed by space');
    verify(input: 'contains-?\')-Symbol@-Characters', expected: 'contains symbol characters');
  });
}
