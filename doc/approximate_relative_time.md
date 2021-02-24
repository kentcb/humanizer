# Approximate Relative Time

This feature converts a `DateTime` to a human-readable form by considering its relativity to now. It supports two levels of granularity for the output, allowing you to opt for a more specific, longer output if that is desired.

## Extensions

The `humanizeRelativeDateTime` extension method is the sole extension provided by this feature.

```dart
// When reading the below examples, assume that the current time is noon on October 26th, 2021.

// 'now'
DateTime(2021, 10, 26, 12, 00, 00).humanizeRelativeDateTime();

// 'tomorrow'
DateTime(2021, 10, 27, 12, 00, 00).humanizeRelativeDateTime();

// 'yesterday'
DateTime(2021, 10, 25, 12, 00, 00).humanizeRelativeDateTime();

// '3 hours from now'
DateTime(2021, 10, 26, 14, 40, 00).humanizeRelativeDateTime();

// '2 hours from now'
DateTime(2021, 10, 26, 14, 40, 00).humanizeRelativeDateTime(round: false);

// 'under 3 hours from now'
DateTime(2021, 10, 26, 14, 40, 00).humanizeRelativeDateTime(granularity: Granularity.primaryAndSecondaryUnits);
```

## Transformations

The `ApproximateRelativeTimeTransformation` class implements the sole transformation for this feature. Importantly, its input is a `Duration` rather than a `DateTime`. The extensions layer makes an assumption that the `Duration` will be the delta between two `DateTime` instances, but the transformation layer is agnostic of this.

```dart
// 'now'
ApproximateRelativeTimeTransformation(
  granularity: Granularity.primaryUnit,
  round: true).transform(Duration.zero);

// 'tomorrow'
ApproximateRelativeTimeTransformation(
  granularity: Granularity.primaryUnit,
  round: true).transform(Duration(days: 1));

// 'yesterday'
ApproximateRelativeTimeTransformation(
  granularity: Granularity.primaryUnit,
  round: true).transform(Duration(days: -1));

// '3 hours from now'
ApproximateRelativeTimeTransformation(
  granularity: Granularity.primaryUnit,
  round: true).transform(Duration(hours: 2, minutes: 40));

// '2 hours from now'
ApproximateRelativeTimeTransformation(
  granularity: Granularity.primaryUnit,
  round: false).transform(Duration(hours: 2, minutes: 40));

// 'under 3 hours from now'
ApproximateRelativeTimeTransformation(
  granularity: Granularity.primaryAndSecondaryUnits,
  round: true).transform(Duration(hours: 2, minutes: 40));
```