import 'package:humanizer/humanizer.dart';
import 'package:humanizer/src/transformations/approximate_time.dart';
import 'package:test/test.dart';

void main() {
  _transformation();
}

void _transformation() {
  void verify({
    required Duration input,
    required Granularity granularity,
    required bool round,
    required bool isRelativeToNow,
    required dynamic matcher,
    DateTime? now,
  }) {
    final transformation = ApproximateTimeTransformation(
      granularity: granularity,
      round: round,
      isRelativeToNow: isRelativeToNow,
    );
    final result = transformation.transform(input, '');
    expect(result, matcher);
  }

  const oneMicrosecond = Duration(microseconds: 1);

  group('near zero', () {
    test('an input of zero transforms correctly', () {
      verify(
        input: Duration.zero,
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: 'zero',
      );

      verify(
        input: Duration.zero,
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'now',
      );
    });

    test('an input of ±1 second transforms correctly', () {
      verify(
        input: const Duration(seconds: 1) - oneMicrosecond,
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: 'zero',
      );
      verify(
        input: const Duration(seconds: -1) + oneMicrosecond,
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: 'zero',
      );
      verify(
        input: const Duration(seconds: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: isNot('zero'),
      );
      verify(
        input: const Duration(seconds: -1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: isNot('zero'),
      );

      verify(
        input: const Duration(seconds: 1) - oneMicrosecond,
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'now',
      );
      verify(
        input: const Duration(seconds: -1) + oneMicrosecond,
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'now',
      );
      verify(
        input: const Duration(seconds: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: isNot('now'),
      );
      verify(
        input: const Duration(seconds: -1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: isNot('now'),
      );

      // Granularity makes no difference.
      verify(
        input: Duration.zero,
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'zero',
      );
      verify(
        input: const Duration(seconds: 1) - oneMicrosecond,
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'zero',
      );
      verify(
        input: const Duration(seconds: -1) + oneMicrosecond,
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'zero',
      );
      verify(
        input: Duration.zero,
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'now',
      );
      verify(
        input: const Duration(seconds: 1) - oneMicrosecond,
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'now',
      );
      verify(
        input: const Duration(seconds: -1) + oneMicrosecond,
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'now',
      );

      // Rounding makes no difference.
      verify(
        input: Duration.zero,
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: 'zero',
      );
      verify(
        input: const Duration(seconds: 1) - oneMicrosecond,
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: 'zero',
      );
      verify(
        input: const Duration(seconds: -1) + oneMicrosecond,
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: 'zero',
      );
      verify(
        input: Duration.zero,
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'now',
      );
      verify(
        input: const Duration(seconds: 1) - oneMicrosecond,
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'now',
      );
      verify(
        input: const Duration(seconds: -1) + oneMicrosecond,
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'now',
      );
    });
  });

  group('seconds', () {
    test('an input of ±1 second transforms correctly', () {
      verify(
        input: const Duration(seconds: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 second',
      );
      verify(
        input: const Duration(seconds: -1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 second',
      );

      verify(
        input: const Duration(seconds: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'a second from now',
      );
      verify(
        input: const Duration(seconds: -1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'a second ago',
      );
    });

    test('an input of ± multiple seconds transforms correctly', () {
      verify(
        input: const Duration(seconds: 3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 seconds',
      );
      verify(
        input: const Duration(seconds: -3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 seconds',
      );
      verify(
        input: const Duration(seconds: 59),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '59 seconds',
      );
      verify(
        input: const Duration(seconds: -59),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '59 seconds',
      );

      verify(
        input: const Duration(seconds: 3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 seconds from now',
      );
      verify(
        input: const Duration(seconds: -3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 seconds ago',
      );
      verify(
        input: const Duration(seconds: 59),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '59 seconds from now',
      );
      verify(
        input: const Duration(seconds: -59),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '59 seconds ago',
      );
    });

    test('granularity makes no difference when the primary unit is seconds',
        () {
      verify(
        input: const Duration(seconds: 1),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: '1 second',
      );
      verify(
        input: const Duration(seconds: 3),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: '3 seconds',
      );
      verify(
        input: const Duration(seconds: -1),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: '1 second',
      );
      verify(
        input: const Duration(seconds: -3),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: '3 seconds',
      );

      verify(
        input: const Duration(seconds: 1),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'a second from now',
      );
      verify(
        input: const Duration(seconds: 3),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: '3 seconds from now',
      );
      verify(
        input: const Duration(seconds: -1),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'a second ago',
      );
      verify(
        input: const Duration(seconds: -3),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: '3 seconds ago',
      );
    });

    test('rounding makes no difference when the primary unit is seconds', () {
      verify(
        input: const Duration(seconds: 1, milliseconds: 500),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '1 second',
      );
      verify(
        input: const Duration(seconds: 3, milliseconds: 500),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '3 seconds',
      );
      verify(
        input: const Duration(seconds: -1, milliseconds: -500),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '1 second',
      );
      verify(
        input: const Duration(seconds: -3, milliseconds: -500),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '3 seconds',
      );

      verify(
        input: const Duration(seconds: 1, milliseconds: 500),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'a second from now',
      );
      verify(
        input: const Duration(seconds: 3, milliseconds: 500),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: '3 seconds from now',
      );
      verify(
        input: const Duration(seconds: -1, milliseconds: -500),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'a second ago',
      );
      verify(
        input: const Duration(seconds: -3, milliseconds: -500),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: '3 seconds ago',
      );
    });
  });

  group('minutes', () {
    test('an input of ±1 minute transforms correctly', () {
      verify(
        input: const Duration(minutes: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 minute',
      );
      verify(
        input: const Duration(minutes: -1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 minute',
      );

      verify(
        input: const Duration(minutes: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'a minute from now',
      );
      verify(
        input: const Duration(minutes: -1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'a minute ago',
      );
    });

    test('an input of ± multiple minutes transforms correctly', () {
      verify(
        input: const Duration(minutes: 3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 minutes',
      );
      verify(
        input: const Duration(minutes: -3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 minutes',
      );
      verify(
        input: const Duration(minutes: 59),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '59 minutes',
      );
      verify(
        input: const Duration(minutes: -59),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '59 minutes',
      );

      verify(
        input: const Duration(minutes: 3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 minutes from now',
      );
      verify(
        input: const Duration(minutes: -3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 minutes ago',
      );
      verify(
        input: const Duration(minutes: 59),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '59 minutes from now',
      );
      verify(
        input: const Duration(minutes: -59),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '59 minutes ago',
      );
    });

    test('granularity determines whether seconds affect the result', () {
      verify(
        input: const Duration(minutes: 1, seconds: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 minute',
      );
      verify(
        input: const Duration(minutes: 1, seconds: 1),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 1 minute',
      );

      verify(
        input: const Duration(minutes: 1, seconds: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'a minute from now',
      );
      verify(
        input: const Duration(minutes: 1, seconds: 1),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over a minute from now',
      );
    });

    test('number of seconds determines secondary granularity', () {
      verify(
        input: const Duration(minutes: 1, seconds: 10),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 1 minute',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -10),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 1 minute',
      );
      verify(
        input: const Duration(minutes: 1, seconds: 25),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'over 1 minute',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -25),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'over 1 minute',
      );
      verify(
        input: const Duration(minutes: 1, seconds: 35),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'under 2 minutes',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -35),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'under 2 minutes',
      );
      verify(
        input: const Duration(minutes: 1, seconds: 55),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just under 2 minutes',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -55),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just under 2 minutes',
      );

      verify(
        input: const Duration(minutes: 1, seconds: 10),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over a minute from now',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -10),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over a minute ago',
      );
      verify(
        input: const Duration(minutes: 1, seconds: 25),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'over a minute from now',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -25),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'over a minute ago',
      );
      verify(
        input: const Duration(minutes: 1, seconds: 35),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'under 2 minutes from now',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -35),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'under 2 minutes ago',
      );
      verify(
        input: const Duration(minutes: 1, seconds: 55),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just under 2 minutes from now',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -55),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just under 2 minutes ago',
      );
    });

    test('rounding considers seconds if granularity is primary unit only', () {
      verify(
        input: const Duration(minutes: 1, seconds: 29),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '1 minute',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -29),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '1 minute',
      );
      verify(
        input: const Duration(minutes: 1, seconds: 30),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '2 minutes',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -30),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '2 minutes',
      );

      verify(
        input: const Duration(minutes: 1, seconds: 29),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'a minute from now',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -29),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'a minute ago',
      );
      verify(
        input: const Duration(minutes: 1, seconds: 30),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: '2 minutes from now',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -30),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: '2 minutes ago',
      );
    });

    test('rounding has no effect if secondary units are included', () {
      verify(
        input: const Duration(minutes: 1, seconds: 29),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'over 1 minute',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -29),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'over 1 minute',
      );
      verify(
        input: const Duration(minutes: 1, seconds: 30),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'under 2 minutes',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -30),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'under 2 minutes',
      );

      verify(
        input: const Duration(minutes: 1, seconds: 29),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'over a minute from now',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -29),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'over a minute ago',
      );
      verify(
        input: const Duration(minutes: 1, seconds: 30),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'under 2 minutes from now',
      );
      verify(
        input: const Duration(minutes: -1, seconds: -30),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'under 2 minutes ago',
      );
    });
  });

  group('hours', () {
    test('an input of ±1 hour transforms correctly', () {
      verify(
        input: const Duration(hours: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 hour',
      );
      verify(
        input: const Duration(hours: -1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 hour',
      );

      verify(
        input: const Duration(hours: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'an hour from now',
      );
      verify(
        input: const Duration(hours: -1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'an hour ago',
      );
    });

    test('an input of ± multiple hours transforms correctly', () {
      verify(
        input: const Duration(hours: 3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 hours',
      );
      verify(
        input: const Duration(hours: -3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 hours',
      );
      verify(
        input: const Duration(hours: 23),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '23 hours',
      );
      verify(
        input: const Duration(hours: -23),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '23 hours',
      );

      verify(
        input: const Duration(hours: 3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 hours from now',
      );
      verify(
        input: const Duration(hours: -3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 hours ago',
      );
      verify(
        input: const Duration(hours: 23),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '23 hours from now',
      );
      verify(
        input: const Duration(hours: -23),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '23 hours ago',
      );
    });

    test('granularity determines whether minutes affect the result', () {
      verify(
        input: const Duration(hours: 1, minutes: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 hour',
      );
      verify(
        input: const Duration(hours: 1, minutes: 1),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 1 hour',
      );

      verify(
        input: const Duration(hours: 1, minutes: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'an hour from now',
      );
      verify(
        input: const Duration(hours: 1, minutes: 1),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over an hour from now',
      );
    });

    test('number of minutes determines secondary granularity', () {
      verify(
        input: const Duration(hours: 1, minutes: 10),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 1 hour',
      );
      verify(
        input: const Duration(hours: -1, minutes: -10),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 1 hour',
      );
      verify(
        input: const Duration(hours: 1, minutes: 25),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'over 1 hour',
      );
      verify(
        input: const Duration(hours: -1, minutes: -25),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'over 1 hour',
      );
      verify(
        input: const Duration(hours: 1, minutes: 35),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'under 2 hours',
      );
      verify(
        input: const Duration(hours: -1, minutes: -35),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'under 2 hours',
      );
      verify(
        input: const Duration(hours: 1, minutes: 55),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just under 2 hours',
      );
      verify(
        input: const Duration(hours: -1, minutes: -55),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just under 2 hours',
      );

      verify(
        input: const Duration(hours: 1, minutes: 10),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over an hour from now',
      );
      verify(
        input: const Duration(hours: -1, minutes: -10),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over an hour ago',
      );
      verify(
        input: const Duration(hours: 1, minutes: 25),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'over an hour from now',
      );
      verify(
        input: const Duration(hours: -1, minutes: -25),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'over an hour ago',
      );
      verify(
        input: const Duration(hours: 1, minutes: 35),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'under 2 hours from now',
      );
      verify(
        input: const Duration(hours: -1, minutes: -35),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'under 2 hours ago',
      );
      verify(
        input: const Duration(hours: 1, minutes: 55),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just under 2 hours from now',
      );
      verify(
        input: const Duration(hours: -1, minutes: -55),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just under 2 hours ago',
      );
    });

    test('rounding considers minutes if granularity is primary unit only', () {
      verify(
        input: const Duration(hours: 1, minutes: 29),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '1 hour',
      );
      verify(
        input: const Duration(hours: -1, minutes: -29),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '1 hour',
      );
      verify(
        input: const Duration(hours: 1, minutes: 30),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '2 hours',
      );
      verify(
        input: const Duration(hours: -1, minutes: -30),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '2 hours',
      );

      verify(
        input: const Duration(hours: 1, minutes: 29),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'an hour from now',
      );
      verify(
        input: const Duration(hours: -1, minutes: -29),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'an hour ago',
      );
      verify(
        input: const Duration(hours: 1, minutes: 30),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: '2 hours from now',
      );
      verify(
        input: const Duration(hours: -1, minutes: -30),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: '2 hours ago',
      );
    });

    test(
        'rounding considers seconds if granularity is primary and secondary units',
        () {
      verify(
        input: const Duration(hours: 1, minutes: 29, seconds: 29),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'over 1 hour',
      );
      verify(
        input: const Duration(hours: -1, minutes: -29, seconds: -29),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'over 1 hour',
      );
      verify(
        input: const Duration(hours: 1, minutes: 29, seconds: 30),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'under 2 hours',
      );
      verify(
        input: const Duration(hours: -1, minutes: -29, seconds: -30),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'under 2 hours',
      );

      verify(
        input: const Duration(hours: 1, minutes: 29, seconds: 29),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'over an hour from now',
      );
      verify(
        input: const Duration(hours: -1, minutes: -29, seconds: -29),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'over an hour ago',
      );
      verify(
        input: const Duration(hours: 1, minutes: 29, seconds: 30),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'under 2 hours from now',
      );
      verify(
        input: const Duration(hours: -1, minutes: -29, seconds: -30),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'under 2 hours ago',
      );
    });
  });

  group('days', () {
    test('an input of ±1 day transforms correctly', () {
      verify(
        input: const Duration(days: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 day',
      );
      verify(
        input: const Duration(days: -1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 day',
      );

      verify(
        input: const Duration(days: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'tomorrow',
      );
      verify(
        input: const Duration(days: -1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'yesterday',
      );
    });

    test('an input of ± multiple days transforms correctly', () {
      verify(
        input: const Duration(days: 3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 days',
      );
      verify(
        input: const Duration(days: -3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 days',
      );
      verify(
        input: const Duration(days: 6),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '6 days',
      );
      verify(
        input: const Duration(days: -6),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '6 days',
      );

      verify(
        input: const Duration(days: 3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 days from now',
      );
      verify(
        input: const Duration(days: -3),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 days ago',
      );
      verify(
        input: const Duration(days: 6),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '6 days from now',
      );
      verify(
        input: const Duration(days: -6),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '6 days ago',
      );
    });

    test('granularity determines whether hours affect the result', () {
      verify(
        input: const Duration(days: 1, hours: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'tomorrow',
      );
      verify(
        input: const Duration(days: 1, hours: 1),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over a day from now',
      );

      verify(
        input: const Duration(days: 1, hours: 1),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'tomorrow',
      );
      verify(
        input: const Duration(days: 1, hours: 1),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over a day from now',
      );
    });

    test('number of hours determines secondary granularity', () {
      verify(
        input: const Duration(days: 1, hours: 5),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 1 day',
      );
      verify(
        input: const Duration(days: -1, hours: -5),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 1 day',
      );
      verify(
        input: const Duration(days: 1, hours: 11),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'over 1 day',
      );
      verify(
        input: const Duration(days: -1, hours: -11),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'over 1 day',
      );
      verify(
        input: const Duration(days: 1, hours: 17),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'under 2 days',
      );
      verify(
        input: const Duration(days: -1, hours: -17),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'under 2 days',
      );
      verify(
        input: const Duration(days: 1, hours: 23),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just under 2 days',
      );
      verify(
        input: const Duration(days: -1, hours: -23),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just under 2 days',
      );

      verify(
        input: const Duration(days: 1, hours: 5),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over a day from now',
      );
      verify(
        input: const Duration(days: -1, hours: -5),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over a day ago',
      );
      verify(
        input: const Duration(days: 1, hours: 11),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'over a day from now',
      );
      verify(
        input: const Duration(days: -1, hours: -11),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'over a day ago',
      );
      verify(
        input: const Duration(days: 1, hours: 17),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'under 2 days from now',
      );
      verify(
        input: const Duration(days: -1, hours: -17),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'under 2 days ago',
      );
      verify(
        input: const Duration(days: 1, hours: 23),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just under 2 days from now',
      );
      verify(
        input: const Duration(days: -1, hours: -23),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just under 2 days ago',
      );
    });

    test('rounding considers hours if granularity is primary unit only', () {
      verify(
        input: const Duration(days: 1, hours: 11),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '1 day',
      );
      verify(
        input: const Duration(days: -1, hours: -11),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '1 day',
      );
      verify(
        input: const Duration(days: 1, hours: 12),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '2 days',
      );
      verify(
        input: const Duration(days: -1, hours: -12),
        granularity: Granularity.primaryUnit,
        round: true,
        matcher: '2 days',
        isRelativeToNow: false,
      );

      verify(
        input: const Duration(days: 1, hours: 11),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'tomorrow',
      );
      verify(
        input: const Duration(days: -1, hours: -11),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'yesterday',
      );
      verify(
        input: const Duration(days: 1, hours: 12),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: '2 days from now',
      );
      verify(
        input: const Duration(days: -1, hours: -12),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: '2 days ago',
      );
    });

    test(
        'rounding considers minutes if granularity is primary and secondary units',
        () {
      verify(
        input: const Duration(days: 1, hours: 11, minutes: 29),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'over 1 day',
      );
      verify(
        input: const Duration(days: -1, hours: -11, minutes: -29),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'over 1 day',
      );
      verify(
        input: const Duration(days: 1, hours: 11, minutes: 30),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'under 2 days',
      );
      verify(
        input: const Duration(days: -1, hours: -11, minutes: -30),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'under 2 days',
      );

      verify(
        input: const Duration(days: 1, hours: 11, minutes: 29),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'over a day from now',
      );
      verify(
        input: const Duration(days: -1, hours: -11, minutes: -29),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'over a day ago',
      );
      verify(
        input: const Duration(days: 1, hours: 11, minutes: 30),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'under 2 days from now',
      );
      verify(
        input: const Duration(days: -1, hours: -11, minutes: -30),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'under 2 days ago',
      );
    });
  });

  group('weeks', () {
    test('an input of ±1 week transforms correctly', () {
      verify(
        input: const Duration(days: 7),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 week',
      );
      verify(
        input: const Duration(days: -7),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 week',
      );

      verify(
        input: const Duration(days: 7),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'a week from now',
      );
      verify(
        input: const Duration(days: -7),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'a week ago',
      );
    });

    test('an input of ± multiple weeks transforms correctly', () {
      verify(
        input: const Duration(days: 21),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 weeks',
      );
      verify(
        input: const Duration(days: -21),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 weeks',
      );

      verify(
        input: const Duration(days: 21),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 weeks from now',
      );
      verify(
        input: const Duration(days: -21),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 weeks ago',
      );
    });

    test('granularity determines whether days affect the result', () {
      verify(
        input: const Duration(days: 23),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 weeks',
      );
      verify(
        input: const Duration(days: 23),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'over 3 weeks',
      );

      verify(
        input: const Duration(days: 23),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 weeks from now',
      );
      verify(
        input: const Duration(days: 23),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'over 3 weeks from now',
      );
    });

    test('number of days determines secondary granularity', () {
      verify(
        input: const Duration(days: 8),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 1 week',
      );
      verify(
        input: const Duration(days: -8),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 1 week',
      );
      verify(
        input: const Duration(days: 10),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'over 1 week',
      );
      verify(
        input: const Duration(days: -10),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'over 1 week',
      );
      verify(
        input: const Duration(days: 12),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'under 2 weeks',
      );
      verify(
        input: const Duration(days: -12),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'under 2 weeks',
      );
      verify(
        input: const Duration(days: 13),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just under 2 weeks from now',
      );
      verify(
        input: const Duration(days: -13),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just under 2 weeks ago',
      );

      verify(
        input: const Duration(days: 8),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over a week from now',
      );
      verify(
        input: const Duration(days: -8),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over a week ago',
      );
      verify(
        input: const Duration(days: 10),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'over a week from now',
      );
      verify(
        input: const Duration(days: -10),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'over a week ago',
      );
      verify(
        input: const Duration(days: 12),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'under 2 weeks from now',
      );
      verify(
        input: const Duration(days: -12),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'under 2 weeks ago',
      );
      verify(
        input: const Duration(days: 13),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just under 2 weeks from now',
      );
      verify(
        input: const Duration(days: -13),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just under 2 weeks ago',
      );
    });

    test('rounding considers days if granularity is primary unit only', () {
      verify(
        input: const Duration(days: 10),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '1 week',
      );
      verify(
        input: const Duration(days: -10),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '1 week',
      );
      verify(
        input: const Duration(days: 11),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '2 weeks',
      );
      verify(
        input: const Duration(days: -11),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '2 weeks',
      );

      verify(
        input: const Duration(days: 10),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'a week from now',
      );
      verify(
        input: const Duration(days: -10),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'a week ago',
      );
      verify(
        input: const Duration(days: 11),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: '2 weeks from now',
      );
      verify(
        input: const Duration(days: -11),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: '2 weeks ago',
      );
    });

    test(
        'rounding considers hours if granularity is primary and secondary units',
        () {
      verify(
        input: const Duration(days: 10, hours: 11),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'over 1 week',
      );
      verify(
        input: const Duration(days: -10, hours: -11),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'over 1 week',
      );
      verify(
        input: const Duration(days: 10, hours: 12),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'under 2 weeks',
      );
      verify(
        input: const Duration(days: -10, hours: -12),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'under 2 weeks',
      );

      verify(
        input: const Duration(days: 10, hours: 11),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'over a week from now',
      );
      verify(
        input: const Duration(days: -10, hours: -11),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'over a week ago',
      );
      verify(
        input: const Duration(days: 10, hours: 12),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'under 2 weeks from now',
      );
      verify(
        input: const Duration(days: -10, hours: -12),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'under 2 weeks ago',
      );
    });
  });

  group('months', () {
    test('an input of ±1 month transforms correctly', () {
      verify(
        input: const Duration(days: 31),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 month',
      );
      verify(
        input: const Duration(days: -31),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 month',
      );

      verify(
        input: const Duration(days: 31),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'a month from now',
      );
      verify(
        input: const Duration(days: -31),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'a month ago',
      );
    });

    test('an input of ± multiple months transforms correctly', () {
      verify(
        input: const Duration(days: 92),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 months',
      );
      verify(
        input: const Duration(days: -92),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 months',
      );
      verify(
        input: const Duration(days: 92),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 months from now',
      );
      verify(
        input: const Duration(days: -92),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 months ago',
      );
    });

    test('granularity determines whether weeks affect the result', () {
      verify(
        input: const Duration(days: 98),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 months',
      );
      verify(
        input: const Duration(days: 98),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 3 months',
      );

      verify(
        input: const Duration(days: 98),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 months from now',
      );
      verify(
        input: const Duration(days: 98),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over 3 months from now',
      );
    });

    test('number of weeks determines secondary granularity', () {
      verify(
        input: const Duration(days: 37),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 1 month',
      );
      verify(
        input: const Duration(days: -37),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 1 month',
      );
      verify(
        input: const Duration(days: 44),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'over 1 month',
      );
      verify(
        input: const Duration(days: -44),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'over 1 month',
      );
      verify(
        input: const Duration(days: 46),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'under 2 months',
      );
      verify(
        input: const Duration(days: -46),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'under 2 months',
      );
      verify(
        input: const Duration(days: 60),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just under 2 months',
      );
      verify(
        input: const Duration(days: -60),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just under 2 months',
      );

      verify(
        input: const Duration(days: 37),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over a month from now',
      );
      verify(
        input: const Duration(days: -37),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over a month ago',
      );
      verify(
        input: const Duration(days: 44),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'over a month from now',
      );
      verify(
        input: const Duration(days: -44),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'over a month ago',
      );
      verify(
        input: const Duration(days: 46),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'under 2 months from now',
      );
      verify(
        input: const Duration(days: -46),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'under 2 months ago',
      );
      verify(
        input: const Duration(days: 60),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just under 2 months from now',
      );
      verify(
        input: const Duration(days: -60),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just under 2 months ago',
      );
    });

    test('rounding considers weeks if granularity is primary unit only', () {
      verify(
        input: const Duration(days: 37),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '1 month',
      );
      verify(
        input: const Duration(days: -37),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '1 month',
      );
      verify(
        input: const Duration(days: 46),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '2 months',
      );
      verify(
        input: const Duration(days: -46),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '2 months',
      );

      verify(
        input: const Duration(days: 37),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'a month from now',
      );
      verify(
        input: const Duration(days: -37),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'a month ago',
      );
      verify(
        input: const Duration(days: 46),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: '2 months from now',
      );
      verify(
        input: const Duration(days: -46),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: '2 months ago',
      );
    });

    test(
        'rounding considers days if granularity is primary and secondary units',
        () {
      verify(
        input: const Duration(days: 34),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'just over 1 month',
      );
      verify(
        input: const Duration(days: -34),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'just over 1 month',
      );
      verify(
        input: const Duration(days: 59),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'just under 2 months',
      );
      verify(
        input: const Duration(days: -59),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'just under 2 months',
      );

      verify(
        input: const Duration(days: 34),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'just over a month from now',
      );
      verify(
        input: const Duration(days: -34),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'just over a month ago',
      );
      verify(
        input: const Duration(days: 59),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'just under 2 months from now',
      );
      verify(
        input: const Duration(days: -59),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'just under 2 months ago',
      );
    });
  });

  group('years', () {
    test('an input of ±1 year transforms correctly', () {
      verify(
        input: const Duration(days: 366),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 year',
      );
      verify(
        input: const Duration(days: -366),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '1 year',
      );

      verify(
        input: const Duration(days: 366),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'a year from now',
      );
      verify(
        input: const Duration(days: -366),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: 'a year ago',
      );
    });

    test('an input of ± multiple years transforms correctly', () {
      verify(
        input: const Duration(days: 1096),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 years',
      );
      verify(
        input: const Duration(days: -1096),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 years',
      );

      verify(
        input: const Duration(days: 1096),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 years from now',
      );
      verify(
        input: const Duration(days: -1096),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 years ago',
      );
    });

    test('granularity determines whether months affect the result', () {
      verify(
        input: const Duration(days: 1127),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: false,
        matcher: '3 years',
      );
      verify(
        input: const Duration(days: 1127),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 3 years',
      );

      verify(
        input: const Duration(days: 1127),
        granularity: Granularity.primaryUnit,
        round: false,
        isRelativeToNow: true,
        matcher: '3 years from now',
      );
      verify(
        input: const Duration(days: 1127),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over 3 years from now',
      );
    });

    test('number of months determines secondary granularity', () {
      verify(
        input: const Duration(days: 396),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 1 year',
      );
      verify(
        input: const Duration(days: -396),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just over 1 year',
      );
      verify(
        input: const Duration(days: 457),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'over 1 year',
      );
      verify(
        input: const Duration(days: -457),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'over 1 year',
      );
      verify(
        input: const Duration(days: 548),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'under 2 years',
      );
      verify(
        input: const Duration(days: -548),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'under 2 years',
      );
      verify(
        input: const Duration(days: 640),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just under 2 years',
      );
      verify(
        input: const Duration(days: -640),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: false,
        matcher: 'just under 2 years',
      );

      verify(
        input: const Duration(days: 396),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over a year from now',
      );
      verify(
        input: const Duration(days: -396),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just over a year ago',
      );
      verify(
        input: const Duration(days: 457),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'over a year from now',
      );
      verify(
        input: const Duration(days: -457),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'over a year ago',
      );
      verify(
        input: const Duration(days: 548),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'under 2 years from now',
      );
      verify(
        input: const Duration(days: -548),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'under 2 years ago',
      );
      verify(
        input: const Duration(days: 640),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just under 2 years from now',
      );
      verify(
        input: const Duration(days: -640),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: false,
        isRelativeToNow: true,
        matcher: 'just under 2 years ago',
      );
    });

    test('rounding considers months if granularity is primary unit only', () {
      verify(
        input: const Duration(days: 518),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '1 year',
      );
      verify(
        input: const Duration(days: -518),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '1 year',
      );
      verify(
        input: const Duration(days: 548),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '2 years',
      );
      verify(
        input: const Duration(days: -548),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: false,
        matcher: '2 years',
      );

      verify(
        input: const Duration(days: 518),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'a year from now',
      );
      verify(
        input: const Duration(days: -518),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: 'a year ago',
      );
      verify(
        input: const Duration(days: 548),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: '2 years from now',
      );
      verify(
        input: const Duration(days: -548),
        granularity: Granularity.primaryUnit,
        round: true,
        isRelativeToNow: true,
        matcher: '2 years ago',
      );
    });

    test(
        'rounding considers weeks if granularity is primary and secondary units',
        () {
      verify(
        input: const Duration(days: 525),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'over 1 year',
      );
      verify(
        input: const Duration(days: -525),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'over 1 year',
      );
      verify(
        input: const Duration(days: 590),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'under 2 years',
      );
      verify(
        input: const Duration(days: -590),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: false,
        matcher: 'under 2 years',
      );

      verify(
        input: const Duration(days: 525),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'over a year from now',
      );
      verify(
        input: const Duration(days: -525),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'over a year ago',
      );
      verify(
        input: const Duration(days: 590),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'under 2 years from now',
      );
      verify(
        input: const Duration(days: -590),
        granularity: Granularity.primaryAndSecondaryUnits,
        round: true,
        isRelativeToNow: true,
        matcher: 'under 2 years ago',
      );
    });
  });
}
