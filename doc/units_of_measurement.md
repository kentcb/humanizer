# Units of Measurement

This feature allows you to represent many common units of measurement in your application's domain, as well as convert them to a human-readable form. The supported units of measurement are:

* Area
* Information
* Length
* Temperature
* Time
* Volume
* Weight

Regardless of the unit of measurement, the feature works in a consistent manner.

## Domain

It's difficult to understand the extensions and transformations layers without first understanding the domain layer, so we start there.

Each unit of measurement has a corresponding domain type. They all have the same name as the unit of measurement apart from information, which uses `InformationSize` as the domain type. For example, to create a length one can write:

```dart
final length = Length.fromMeters(Decimal.fromInt(42));
```

Various `fromXxx` constructors exist for different units within the unit of measurement. Regardless, Notice the use of a `Decimal` to represent the underlying value. All the entry-point domain types like `Length` are wrappers around a single `Decimal`. Unfortunately, Dart does not have built-in decimal support and it [seems like it never will](https://github.com/dart-lang/sdk/issues/681), so dealing with decimals adds a bit of friction that is somewhat alleviated by the extensions layer (but is limited even there due to lack of language support).

Once you have a domain type like `Length`, there are many things you can do with it, some of which are demonstrated here:

```dart
final length = Length.fromMeters(Decimal.fromInt(42));

// Determine how many feet are in the length (in this case, 137.795).
final feet = length.feet;

// You can also use the general getUnits method and pass in the desired unit.
final yards = length.getUnits(LengthUnit.yard);

final anotherLength = Length.fromFeet(Decimal.fromInt(137));

// Equality test (this is false).
final equal = length == anotherLength;

// Relational test (this is true).
final larger = length > anotherLength;

// Divide a value (this is false).
final halfIsLarger = (length / Decimal.fromInt(2)) > anotherLength;

// Determine the largest unit in the value (in this case, a yard).
final largestUnit = length.getLargestUnit(permissibleUnits: LengthUnits.imperial);

// Perform arithmetic against values (extendedLength is 42.5 meters).
final extendedLength = length + Length.fromCentimeters(Decimal.fromInt(50));

// Round the value (rounded is 42 meters).
final rounded = length.round(LengthUnit.meter);
```

You can also create a "rated" version of any such domain type:

```dart
final speed = length.per(const Duration(minutes: 1));
```

This will give you a new value, in this case of type `LengthRate`. A rate encapsulates an underlying value and a period that indicates how frequently that value is occurring or compounding.

### Formatting

Regardless of whether you're using "raw" values like `Length` or "rated" values like `LengthRate`, formatting them requires the use of a separate format type. Simply append "Format" to the type name. For `Length`, it's `LengthFormat`, and for `LengthRate`, it's `LengthRateFormat`.

All format types work in the same manner, and the pattern specifiers are detailed in the API documentation. Here is an example of their usage (continuing from the above examples):

```dart
// 42.5 m (you'll get the same calling toString on extendedLength)
final formattedLength = LengthFormat().format(extendedLength);

// 42,500,000 μm
final anotherFormattedLength = LengthFormat(
  pattern: '###,##0.## u:μm',
  permissibleValueUnits: LengthUnits.si,
).format(extendedLength);

// 42 m/min (you'll get the same calling toString on speed)
final formattedRate = LengthRateFormat().format(speed);

// 252000 centimeters per hr
final anotherFormattedRate = LengthRateFormat(
  pattern: "#0.## U:cm 'per' r:hr",
  permissibleRateUnits: RateUnits.all,
).format(speed);
```

## Extensions

The units of measurement feature provides a vast array of extension members; far too many to list individually. Instead, this code demonstrates the general usage via extensions:

```dart
// Extensions on int (and Decimal) make it easier to create units of measurement values.
final downloadSize = 7134872.bytes();

// Simply invoke the humanize extension method to get a formatted value (in this case, '6.8 MiB')
final formattedSize = downloadSize.humanize();

// Or provide your own pattern (resulting in '57,078,976 bytes' here)
final alternativeFormattedSize = downloadSize.humanize(pattern: '#,##0 U:b');

// Rates are created from the underlying value - no need for extension support.
final downloadRate = 18192.bytes().per(const Duration(seconds: 1));

// There is also a humanize extension for rate (resulting in '17.77 KiB/s' here)
final formattedRate = downloadRate.humanize();

// Again, the pattern can be explicitly provided (resulting in '62.46 mebibytes every hour' here)
final alternativeFormattedRate = downloadRate.humanize(pattern: "0.## U:MiB 'every' R:hr");
```

## Transformations

The units of measurement feature also provides many transformations: one for each domain value and rate type. For example, the weight unit of measurement provides a `WeightTransformation` and `WeightRateTransformation`. Each of these transformations will create a humanized version of the input domain type. You specify a desired pattern and the permissible units to use when formatting values.

All these transformations work in a similar fashion, and the below is a typical usage example:

```dart
final weight = 42000.grams();

// Uses the default pattern and permissible units (resulting in '42 kg')
final transformed = const WeightTransformation().transform(weight, 'en');

// Use imperial units (resulting in '92.59 lb')
final imperial = const WeightTransformation(
  permissibleValueUnits: WeightUnits.imperial,
).transform(weight, 'en');

// Use imperial units and request ounces as the value unit (resulting in '1481.51 oz')
final ounces = const WeightTransformation(
  pattern: '0.## u:oz',
  permissibleValueUnits: WeightUnits.imperial,
).transform(weight, 'en');
```