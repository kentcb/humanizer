# Ordinal Numbers

This feature converts input integers into their ordinal form (`1st` / `first`, `2nd` / `second` etc).

## Extensions

Two extensions are provided:

* `toOrdinalNumerical`
* `toOrdinalWords`

Both convert the input integer to ordinal form, but the form differs depending on the extension chosen.

```dart
// '42nd'
42.toOrdinalNumerical();

// '1,113th'
1113.toOrdinalNumerical();

// 'forty-second'
42.toOrdinalWords();
```

## Transformations

Corresponding to the two extensions are two transformations classes:

* `OrdinalNumericalTransformation`
* `OrdinalWordsTransformation`

The former supports providing a `numberFormat` parameter to control how the number portion of the output is formatted.

```dart
// '42nd'
const OrdinalNumericalTransformation().transform(42, 'en');

// '1,113th'
const OrdinalNumericalTransformation().transform(1113, 'en');

// '1113th'
OrdinalNumericalTransformation(numberFormat: NumberFormat('#', 'en')).transform(1113, 'en');

// 'forty-second'
const OrdinalWordsTransformation().transform(42, 'en');
```