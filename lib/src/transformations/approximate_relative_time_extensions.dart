import 'package:humanizer/humanizer.dart';
import 'package:intl/intl.dart';

/// Provides humanizing extensions on [DateTime].
extension ApproximateRelativeTimeExtensions on DateTime {
  /// Gets a humanized transformation of this [DateTime] relative to [DateTime.now()].
  ///
  /// Only the primary unit is considered when humanizing the delta between this [DateTime] and [DateTime.now()] and
  /// rounding is performed based on the secondary unit value. Further control can be obtained by using an
  /// [ApproximateRelativeTimeTransformation] directly.
  ///
  /// ```
  /// // 'an hour from now'
  /// DateTime.now().add(Duration(hours: 1, minutes: 29)).humanizeRelativeDateTime();
  ///
  /// // '2 hours from now'
  /// DateTime.now().add(Duration(hours: 1, minutes: 40)).humanizeRelativeDateTime();
  /// ```
  ///
  /// See also:
  /// * [ApproximateRelativeTimeTransformation]
  String humanizeRelativeDateTime({
    DateTime? relativeTo,
    String? locale,
  }) {
    relativeTo ??= DateTime.now();

    final localDateTime = toLocal();
    final delta = localDateTime.difference(relativeTo);
    return const ApproximateRelativeTimeTransformation(
      granularity: Granularity.primaryUnit,
      round: true,
    ).transform(delta, locale ?? Intl.getCurrentLocale());
  }
}
