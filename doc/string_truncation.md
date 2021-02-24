# String Truncation

This feature allows you to truncate an input `String` with varying algorithms and options. The algorithmic options are to truncate to a fixed length, a fixed length ignoring whitespace characters, or a fixed number of words. Options include being able to specify the truncation indicator and the location at which to truncate the `String` (start or end).

## Extensions

The following extensions are provided corresponding to the various algorithms discussed above:

* `truncateToFixedLength`
* `truncateToFixedNonWhitespaceLength`
* `truncateToFixedWordLength`

All these extensions include a `truncationIndicator` parameter (which defaults to a single character ellipsis, `…`) and a `truncateAt` parameter (which defaults to `TruncateAt.end`).

```dart
// 'Some text…'
'Some text that is too long'.truncateToFixedLength(10);

// 'Some text tha…'
'Some text that is too long'.truncateToFixedNonWhitespaceLength(12);

// 'Some text that…'
'Some text that is too long'.truncateToFixedWordLength(3);

// 'Some te...'
'Some text that is too long'.truncateToFixedLength(10, truncationIndicator: '...');

// '…too long'
'Some text that is too long'.truncateToFixedWordLength(2, truncateAt: TruncateAt.start);
```

## Transformations

The various algorithms are implemented by the following transformations:

* `TruncateToFixedLengthTransformation`
* `TruncateToFixedNonWhitespaceLengthTransformation`
* `TruncateToFixedWordLengthTransformation`

```dart
// 'Some text…'
const TruncateToFixedLengthTransformation(
  length: 10,
  truncationIndicator: '…',
  truncateAt: TruncateAt.end).transform('Some text that is too long');

// 'Some text tha…'
const TruncateToFixedNonWhitespaceLengthTransformation(
  length: 12,
  truncationIndicator: '…',
  truncateAt: TruncateAt.end).transform('Some text that is too long');

// 'Some text that…'
const TruncateToFixedWordLengthTransformation(
  length: 3,
  truncationIndicator: '…',
  truncateAt: TruncateAt.end).transform('Some text that is too long');
```