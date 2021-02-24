# Cardinal Numbers

This feature converts input integers into their cardinal form (`one`, `two` etc).

## Extensions

The sole extension provided by this feature is `toCardinalWords`.

```dart
// 'forty-two'
42.toCardinalWords();

// 'one hundred and four'
104.toCardinalWords();
```

## Transformations

The corresponding transformation provided by this feature is `CardinalWordsTransformation`.

```dart
// 'one'
const CardinalWordsTransformation().transform(1, 'en');

// 'two'
const CardinalWordsTransformation().transform(2, 'en');

// 'one hundred and four'
const CardinalWordsTransformation().transform(104, 'en');

// 'one thousand one hundred and thirteen'
const CardinalWordsTransformation().transform(1113, 'en');
```
