import 'package:humanizer/humanizer.dart';
import 'package:intl/intl.dart';

/// Provides humanizing extensions on [DateTime].
extension ApproximateRelativeTimeExtensions on DateTime {
  /// Gets a humanized transformation of this [DateTime] relative to [DateTime.now()].
  ///
  /// The input [DateTime] will be transformed to a human-readable form relative to [relativeTo], which defaults to
  /// [DateTime.now()] if `null`.
  ///
  /// The [granularity] determines the trade-off between specificity and length of output, and defaults to preferring
  /// shorter output ([Granularity.primaryUnit]).
  ///
  /// By default, the delta between the two [DateTime] instances is rounded as appropriate to the granularity, but that
  /// behavior can be disabled by setting [round] to `false`.
  ///
  /// ```
  /// // 'an hour from now'
  /// DateTime.now().add(Duration(hours: 1, minutes: 29)).humanizeRelativeDateTime();
  ///
  /// // '2 hours from now'
  /// DateTime.now().add(Duration(hours: 1, minutes: 40)).humanizeRelativeDateTime();
  ///
  /// // 'an hour from now'
  /// DateTime.now().add(Duration(hours: 1, minutes: 40)).humanizeRelativeDateTime(round: false);
  ///
  /// // 'just under 2 hours from now'
  /// DateTime.now().add(Duration(hours: 1, minutes: 55)).humanizeRelativeDateTime(granularity: Granularity.primaryAndSecondaryUnits);
  /// ```
  ///
  /// See also:
  /// * [ApproximateRelativeTimeTransformation]
  String humanizeRelativeDateTime({
    DateTime? relativeTo,
    Granularity granularity = Granularity.primaryUnit,
    bool round = true,
    String? locale,
  }) {
    relativeTo ??= DateTime.now();

    final localDateTime = toLocal();
    final delta = localDateTime.difference(relativeTo);
    return ApproximateRelativeTimeTransformation(
      granularity: granularity,
      round: round,
    ).transform(delta, locale ?? Intl.getCurrentLocale());
  }
}
