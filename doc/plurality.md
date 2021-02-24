# Plurality

This feature allows you to convert input words to plural or singular form.

## Extensions

The following extensions are provided by this feature:

* `toSingularForm`
* `toPluralForm`
* `toPluralFormForQuantity`

The first two take only an input `String` and convert its plurality. The last allows you to change the plurality of the input `String` based on a numerical quantity: if the quantity is `1`, singular form is chosen, otherwise plural.

```dart
// 'dog'
'dogs'.toSingularForm();

// 'dogs'
'dog'.toPluralForm();

// '2 dogs'
'dog'.toPluralFormForQuantity(2);

// 'dogs'
'dog'.toPluralFormForQuantity(2, includeQuantity: false);

// 'men'
'man'.toPluralForm();

// 'oxen'
'ox'.toPluralForm();
```

## Transformations

The `PluralityTransformation` class implements the sole transformation provided by this feature. Its `targetPlurality` parameter indicates the desired plurality when transforming inputs.

```dart
// 'dog'
const PluralityTransformation(targetPlurality: Plurality.singular).transform('dogs', 'en');

// 'dogs'
const PluralityTransformation(targetPlurality: Plurality.plural).transform('dog', 'en');

// 'men'
const PluralityTransformation(targetPlurality: Plurality.plural).transform('man', 'en');

// 'oxen'
const PluralityTransformation(targetPlurality: Plurality.plural).transform('ox', 'en');
```