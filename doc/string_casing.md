# String Casing

This feature allows you to convert the casing of input sentences to either `Sentence casing` or `Title Casing`.

## Extensions

The `toSentenceCase` extension converts to `Sentence casing` and the `toTitleCase` extension converts to `Title Casing`. In both cases, you can optionally choose to convert acronyms as well (the default behavior is to leave acronyms as is).

```dart
// 'A lowercase sentence with an ACRONYM'
'a lowercase sentence with an ACRONYM'.toSentenceCase();

// 'A Lowercase Sentence With An ACRONYM'
'a lowercase sentence with an ACRONYM'.toTitleCase();

// 'A lowercase sentence with an acronym'
'a lowercase sentence with an ACRONYM'.toSentenceCase(convertAcryonyms: true);
```

## Transformations

The `ToSentenceCaseTransformation` transformation performs sentence-casing transformations and the `ToTitleCaseTransformation` performs title-casing transformations.

```dart
// 'A lowercase sentence with an ACRONYM'
const ToSentenceCaseTransformation().transform('a lowercase sentence with an ACRONYM', 'en');

// 'A Lowercase Sentence With An ACRONYM'
const ToTitleCaseTransformation().transform('a lowercase sentence with an ACRONYM', 'en');
```