# Units of Measurement

This feature allows you to represent many common units of measurement in your application's domain, as well as convert them to a human-readable form.

## Domain

It's difficult to understand the extensions and transformations layers without first understanding the domain layer, so we start there. Please refer to the following table when reading the documentation below:

| Unit of Measurement | Value type name | Format type name | Rated value type name | Rated format type name |
|-|-|-|-|-|
| Area | `Area` | `AreaFormat` | `AreaRate` | `AreaRateFormat` |
| Information | `InformationSize` | `InformationSizeFormat` | `InformationRate` | `InformationRateFormat` |
| Length | `Length` | `LengthFormat` | `LengthRate` | `LengthRateFormat` |
| Quantity | `Quantity` | `QuantityFormat` | `QuantityRate` | `QuantityRateFormat` |
| Temperature | `Temperature` | `TemperatureFormat` | `TemperatureRate` | `TemperatureRateFormat` |
| Time | `Time` | `TimeFormat` | `TimeRate` | `TimeRateFormat` |
| Volume | `Volume` | `VolumeFormat` | `VolumeRate` | `VolumeRateFormat` |
| Weight | `Weight` | `WeightFormat` | `WeightRate` | `WeightRateFormat` |

### Values

Each unit of measurement has two corresponding value types, and each of those value types has a corresponding format type. To create values, you can use either factory methods on the type or extension methods against `int` and `Rational`:

```dart
final l = Rational.fromInt(42);

final length1 = Length.fromMeters(l);

final length2 = 42.meters();

final length3 = l.meters();
```

Regardless of which approach you take, each unit of measurement value wraps a single `Rational`. Unfortunately, Dart does not have built-in rational, or even decimal, support and it [seems like it never will](https://github.com/dart-lang/sdk/issues/681). Dealing with rationals adds a bit of friction to the code, as you can see above. This is somewhat alleviated by the extensions layer.

Once you have a domain type like `Length`, there are many things you can do with it, some of which are demonstrated here:

```dart
final length = Length.fromMeters(Rational.fromInt(42));

// Determine how many feet are in the length (in this case, 137.795).
final feet = length.feet;

// You can also use the general getUnits method and pass in the desired unit.
final yards = length.getUnits(LengthUnit.yard);

final anotherLength = Length.fromFeet(Rational.fromInt(137));

// Equality test (this is false).
final equal = length == anotherLength;

// Relational test (this is true).
final larger = length > anotherLength;

// Divide a value (this is false).
final halfIsLarger = (length / Rational.fromInt(2)) > anotherLength;

// Determine the largest unit in the value (in this case, a yard).
final largestUnit = length.getLargestUnit(permissibleUnits: LengthUnits.imperial);

// Perform arithmetic against values (extendedLength is 42.5 meters).
final extendedLength = length + Length.fromCentimeters(Rational.fromInt(50));

// Round the value (rounded is 42 meters).
final rounded = length.round(LengthUnit.meter);
```

### Dimensionless Quantities

One special entry in the above table is `Quantity`, which represents a dimensionless quantity (a quantity not tied to any particular dimension, such as length or weight). A `Quantity` is useful for humanizing large numbers, and for moving between other units of measurement when performing calculations. As an example, suppose you need to calculate how many kilograms of concrete you require for a footpath. You know that you need 90kg per square meter and that the footpath will be 1.2m wide and 15m long. Here's some code that calculates the required weight of concrete:

```dart
final width = 120.centimeters();
final length = 15.meters();
final area = (width.centimeters * length.centimeters).squareCentimeters();

// You'll need 1620kg, in case you're wondering.
final weight = (area.squareMeters * Rational.fromInt(90)).kilograms();
```

> NOTE: future versions of Humanizer may allow more seamless transition between dimensional and dimensionless values. For example, multiplying two `Length` values to yield an `Area`, or dividing a `Length` by another `Length` to yield a `Quantity`. The main challenge with achieving this is the lack of method/operator overloading in Dart.

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

final quantity = 42.million() + 100.thousand();

// 42.1M (you'll get the same calling toString on quantity)
final formattedQuantity = QuantityFormat().format(quantity);
```

You can find in-depth discussion on formatting in the API documentation for each format type.

## Extensions

The units of measurement feature provides a vast array of extension members; far too many to list individually. Instead, this code demonstrates the general usage via extensions:

```dart
// Extensions on int (and Rational) make it easier to create units of measurement values.
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