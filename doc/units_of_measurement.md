# Units of Measurement

This feature allows you to represent many common units of measurement in your application's domain, as well as convert them to a human-readable form.

## Domain

It's difficult to understand the extensions and transformations layers without first understanding the domain layer, so we start there. Please refer to the following table when reading the documentation below:

| Unit of Measurement | Value type name | Format type name | Rated value type name | Rated format type name |
|-|-|-|-|-|
| Area | `Area` | `AreaFormat` | `AreaRate` | `AreaRateFormat` |
| Information | `InformationSize` | `InformationSizeFormat` | `InformationRate` | `InformationRateFormat` |
| Length | `Length` | `LengthFormat` | `LengthRate` | `LengthRateFormat` |
| Temperature | `Temperature` | `TemperatureFormat` | `TemperatureRate` | `TemperatureRateFormat` |
| Time | `Time` | `TimeFormat` | `TimeRate` | `TimeRateFormat` |
| Volume | `Volume` | `VolumeFormat` | `VolumeRate` | `VolumeRateFormat` |
| Weight | `Weight` | `WeightFormat` | `WeightRate` | `WeightRateFormat` |

### Values

Each unit of measurement has two corresponding value types, and each of those value types has a corresponding format type. To create values, you can use either factory methods on the type or extension methods against `int` and `Decimal`:

```dart
final l = Decimal.fromInt(42);

final length1 = Length.fromMeters(l);

final length2 = 42.meters();

final length3 = l.meters();
```

Regardless of which approach you take, each unit of measurement value wraps a single `Decimal`, which is an amount in the most accurate unit for that unit of measurement. For example, the 42 meters above will be internally converted into nanometers, which is stored as a `Decimal` and wrapped by the `Length` instance. The implications here are that nanometers are the most accurate measurement for length, and you cannot represent anything smaller than a nanometer.


Unfortunately, Dart does not have built-in decimal support and it [seems like it never will](https://github.com/dart-lang/sdk/issues/681). Dealing with decimals adds a bit of friction to the code, as you can see above. This is somewhat alleviated by the extensions layer.

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

### Rated Values

You can also create a "rated" version of any such domain type:

```dart
final speed = length.per(const Duration(minutes: 1));
```

This will give you a new value, in this case of type `LengthRate`. A rate encapsulates an underlying value and a period that indicates how frequently that value is occurring or compounding. The period can be any `Duration`, but only specific periods will be used during formatting (see below).

### Formatting

Regardless of whether you're using "raw" values like `Length` or "rated" values like `LengthRate`, formatting them requires the use of a separate format type. Per the above table, simply append "Format" to the type name.

All format types work in the same manner, and the pattern specifiers are detailed in the API documentation. Here is an example of their usage (continuing from the above examples):

```dart
// 42.5m (you'll get the same calling toString on extendedLength)
final formattedLength = LengthFormat().format(extendedLength);

// 42,500,000 μm
final anotherFormattedLength = LengthFormat(
  pattern: '###,##0.## u:μm',
  permissibleValueUnits: LengthUnits.si,
).format(extendedLength);

// 42m/min (you'll get the same calling toString on speed)
final formattedRate = LengthRateFormat().format(speed);

// 252000 centimeters per hr
final anotherFormattedRate = LengthRateFormat(
  pattern: "#0.## U:cm 'per' r:hr",
  permissibleRateUnits: RateUnits.all,
).format(speed);
```

You can find in-depth discussion on formatting in the API documentation for each format type.

## Extensions

The units of measurement feature provides a vast array of extension members; far too many to list individually. Instead, this code demonstrates the general usage via extensions:

```dart
// Extensions on int (and Decimal) make it easier to create units of measurement values.
final downloadSize = 7134872.bytes();

// Simply invoke toString to format a value with default settings (in this case, '6.8MiB')
final formattedSize = downloadSize.toString();

// Rates are created from the underlying value - no need for extension support.
final downloadRate = 18192.bytes().per(const Duration(seconds: 1));

// Again, use toString to format with defaults (resulting in '17.77KiB/s' here)
final formattedRate = downloadRate.toString();
```

## Transformations

The units of measurement feature also provides many transformations: one for each value and rate type. For example, the weight unit of measurement provides a `WeightTransformation` and `WeightRateTransformation`. Each of these transformations will create a formatted version of the input domain type. You specify a desired pattern and the permissible units to use when formatting values.

All these transformations work in a similar fashion, and the below is a typical usage example:

```dart
final weight = 42000.grams();

// Uses the default pattern and permissible units (resulting in '42kg')
final transformed = const WeightTransformation().transform(weight, 'en');

// Use imperial units (resulting in '92.59lb')
final imperial = const WeightTransformation(
  permissibleValueUnits: WeightUnits.imperial,
).transform(weight, 'en');

// Use imperial units and request ounces as the value unit (resulting in '1481.51 oz')
final ounces = const WeightTransformation(
  pattern: '0.## u:oz',
  permissibleValueUnits: WeightUnits.imperial,
).transform(weight, 'en');
```