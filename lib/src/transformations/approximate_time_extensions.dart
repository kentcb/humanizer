import 'package:humanizer/humanizer.dart';
import 'package:intl/intl.dart';

/// Provides humanizing extensions on [Duration].
extension ApproximateTimeExtensions on Duration {
  /// Gets a humanized transformation of this [Duration].
  ///
  /// The input [Duration] will be transformed to a human-readable form, which is an approximation of the [Duration]'s
  /// value.
  ///
  /// The [granularity] determines the trade-off between specificity and length of output, and defaults to preferring
  /// shorter output ([Granularity.primaryUnit]).
  ///
  /// By default, the [Duration] is rounded as appropriate for the granularity, but that behavior can be disabled by
  /// setting [round] to `false`.
  ///
  /// Also by default, the input [Duration] is assumed to be relative to now. This means the output can be tailored
  /// under that assumption, such as producing `'now'` or `'tomorrow'` where relevant. If relative output is not
  /// desired, the [isRelativeToNow] parameter can be set to `false`. This will produce more generic output, such as
  /// `'zero'` or `'1 day'`.
  ///
  /// ```
  /// // 'an hour from now'
  /// const Duration(hours: 1).toApproximateTime();
  ///
  /// // '1 hour'
  /// const Duration(hours: 1).toApproximateTime(isRelativeToNow: false);
  ///
  /// // '2 hours from now'
  /// const Duration(hours: 1, minutes: 40).toApproximateTime();
  ///
  /// // '2 hours'
  /// const Duration(hours: 1, minutes: 40).toApproximateTime(isRelativeToNow: false);
  ///
  /// // 'an hour from now'
  /// const Duration(hours: 1, minutes: 40).toApproximateTime(round: false);
  ///
  /// // '1 hour'
  /// const Duration(hours: 1, minutes: 40).toApproximateTime(isRelativeToNow: false, round: false);
  ///
  /// // 'just under 2 hours from now'
  /// const Duration(hours: 1, minutes: 55).toApproximateTime(granularity: Granularity.primaryAndSecondaryUnits);
  ///
  /// // 'just under 2 hours'
  /// const Duration(hours: 1, minutes: 55).toApproximateTime(isRelativeToNow: false, granularity: Granularity.primaryAndSecondaryUnits);
  /// ```
  ///
  /// See also:
  /// * [ApproximateTimeTransformation]
  String toApproximateTime({
    Granularity granularity = Granularity.primaryUnit,
    bool round = true,
    bool isRelativeToNow = true,
    String? locale,
  }) =>
      ApproximateTimeTransformation(
        granularity: granularity,
        round: round,
        isRelativeToNow: isRelativeToNow,
      ).transform(this, locale ?? Intl.getCurrentLocale());
}
