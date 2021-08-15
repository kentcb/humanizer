# Approximate Relative Time

This feature converts a `Duration` to a human-readable form. It supports two levels of granularity for the output, allowing you to opt for a more specific, longer output if that is desired. In addition, it supports rounding of input values and the ability to treat the input as relative to now, which allows for more nuance in the output (for example, `'tomorrow'` instead of `'1 day'`).

## Extensions

The `toApproximateTime` extension method is the sole extension provided by this feature.

```dart
// 'now'
Duration.zero.toApproximateTime();

// 'tomorrow'
Duration(days: 1).toApproximateTime();

// '1 day'
Duration(days: 1).toApproximateTime(isRelativeToNow: false);

// 'yesterday'
Duration(days: 01).toApproximateTime();

// '3 hours from now'
Duration(hours: 2, minutes: 40).toApproximateTime();

// '2 hours from now'
Duration(hours: 2, minutes: 40).toApproximateTime(round: false);

// 'under 3 hours from now'
Duration(hours: 2, minutes: 40).toApproximateTime(granularity: Granularity.primaryAndSecondaryUnits);
```

## Transformations

The `ApproximateTimeTransformation` class implements the sole transformation for this feature.

```dart
// 'now'
ApproximateTimeTransformation(
  granularity: Granularity.primaryUnit,
  round: true,
  isRelativeToNow: true,
).transform(Duration.zero, 'en');


// 'zero'
ApproximateTimeTransformation(
  granularity: Granularity.primaryUnit,
  round: true,
  isRelativeToNow: false,
).transform(Duration.zero, 'en');

// 'tomorrow'
ApproximateTimeTransformation(
  granularity: Granularity.primaryUnit,
  round: true,
  isRelativeToNow: true,
).transform(Duration(days: 1)), 'en');

// 'yesterday'
ApproximateTimeTransformation(
  granularity: Granularity.primaryUnit,
  round: true,
  isRelativeToNow: true,
).transform(Duration(days: -1)), 'en');

// '3 hours from now'
ApproximateTimeTransformation(
  granularity: Granularity.primaryUnit,
  round: true,
  isRelativeToNow: true,
).transform(Duration(hours: 2, minutes: 40)), 'en');

// '2 hours from now'
ApproximateTimeTransformation(
  granularity: Granularity.primaryUnit,
  round: false,
  isRelativeToNow: true,
).transform(Duration(hours: 2, minutes: 40)), 'en');

// 'under 3 hours from now'
ApproximateTimeTransformation(
  granularity: Granularity.primaryAndSecondaryUnits,
  round: false,
  isRelativeToNow: true,
).transform(Duration(hours: 2, minutes: 40)), 'en');
```