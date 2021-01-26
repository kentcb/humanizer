import 'package:humanizer/src/transformations/approximate_relative_time.dart';
import 'package:test/test.dart';

void main() {
  _timeRange();
  _humanize();
}

void _timeRange() {
  group('time range', () {
    void verifyRound({
      required String scenario,
      required Duration timeRangeDuration,
      required Unit roundTo,
      required Duration expectedRoundedDuration,
    }) {
      test(scenario, () {
        final timeRange = TimeRange.fromDuration(timeRangeDuration);
        final result = timeRange.round(roundTo);
        final expected = TimeRange.fromDuration(expectedRoundedDuration);
        expect(result, expected);
      });
    }

    group('round', () {
      verifyRound(
        scenario: 'rounding to seconds simply truncates smaller units',
        timeRangeDuration: const Duration(minutes: 2, seconds: 45, milliseconds: 100, microseconds: 50),
        roundTo: Unit.second,
        expectedRoundedDuration: const Duration(minutes: 2, seconds: 45),
      );

      verifyRound(
        scenario: 'rounding to minutes rounds down where appropriate',
        timeRangeDuration: const Duration(minutes: 2, seconds: 29),
        roundTo: Unit.minute,
        expectedRoundedDuration: const Duration(minutes: 2),
      );
      verifyRound(
        scenario: 'rounding to minutes rounds up where appropriate',
        timeRangeDuration: const Duration(minutes: 2, seconds: 30),
        roundTo: Unit.minute,
        expectedRoundedDuration: const Duration(minutes: 3),
      );

      verifyRound(
        scenario: 'rounding to hours rounds down where appropriate',
        timeRangeDuration: const Duration(hours: 2, minutes: 29, seconds: 59),
        roundTo: Unit.hour,
        expectedRoundedDuration: const Duration(hours: 2),
      );
      verifyRound(
        scenario: 'rounding to hours rounds up where appropriate',
        timeRangeDuration: const Duration(hours: 2, minutes: 30, seconds: 12),
        roundTo: Unit.hour,
        expectedRoundedDuration: const Duration(hours: 3),
      );

      verifyRound(
        scenario: 'rounding to days rounds down where appropriate',
        timeRangeDuration: const Duration(days: 2, hours: 11, minutes: 59, seconds: 59),
        roundTo: Unit.day,
        expectedRoundedDuration: const Duration(days: 2),
      );
      verifyRound(
        scenario: 'rounding to days rounds up where appropriate',
        timeRangeDuration: const Duration(days: 2, hours: 12, minutes: 30, seconds: 12),
        roundTo: Unit.day,
        expectedRoundedDuration: const Duration(days: 3),
      );

      verifyRound(
        scenario: 'rounding to weeks rounds down where appropriate',
        timeRangeDuration: const Duration(days: 17, hours: 23, minutes: 59, seconds: 59),
        roundTo: Unit.week,
        expectedRoundedDuration: const Duration(days: 14),
      );
      verifyRound(
        scenario: 'rounding to weeks rounds up where appropriate',
        timeRangeDuration: const Duration(days: 18, hours: 1, minutes: 30, seconds: 12),
        roundTo: Unit.week,
        expectedRoundedDuration: const Duration(days: 21),
      );

      verifyRound(
        scenario: 'rounding to months rounds down where appropriate',
        timeRangeDuration: const Duration(days: 73, hours: 23, minutes: 59, seconds: 59),
        roundTo: Unit.month,
        expectedRoundedDuration: const Duration(days: 61),
      );
      verifyRound(
        scenario: 'rounding to months rounds up where appropriate',
        timeRangeDuration: const Duration(days: 74, hours: 1, minutes: 30, seconds: 12),
        roundTo: Unit.month,
        expectedRoundedDuration: const Duration(days: 92),
      );

      verifyRound(
        scenario: 'rounding to years rounds down where appropriate',
        timeRangeDuration: const Duration(days: 912, hours: 23, minutes: 59, seconds: 59),
        roundTo: Unit.year,
        expectedRoundedDuration: const Duration(days: 731),
      );
      verifyRound(
        scenario: 'rounding to years rounds up where appropriate',
        timeRangeDuration: const Duration(days: 913, hours: 1, minutes: 30, seconds: 12),
        roundTo: Unit.year,
        expectedRoundedDuration: const Duration(days: 1096),
      );
    });
  });
}

void _humanize() {
  group('humanize', () {
    void verifyHumanize({
      required Duration input,
      required Granularity granularity,
      required bool round,
      required dynamic matcher,
      DateTime? now,
    }) {
      final transformation = ApproximateRelativeTimeTransformation(
        granularity: granularity,
        round: round,
      );
      final result = transformation.transform(input, '');
      expect(result, matcher);
    }

    const oneMicrosecond = Duration(microseconds: 1);

    group('now', () {
      test('an input of zero transforms correctly', () {
        verifyHumanize(
          input: Duration.zero,
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'now',
        );
      });

      test('an input of ±1 second classifies as "now"', () {
        verifyHumanize(
          input: const Duration(seconds: 1) - oneMicrosecond,
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'now',
        );
        verifyHumanize(
          input: const Duration(seconds: -1) + oneMicrosecond,
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'now',
        );
        verifyHumanize(
          input: const Duration(seconds: 1),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: isNot('now'),
        );
        verifyHumanize(
          input: const Duration(seconds: -1),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: isNot('now'),
        );
      });

      test('granularity makes no difference', () {
        verifyHumanize(
          input: Duration.zero,
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'now',
        );
        verifyHumanize(
          input: const Duration(seconds: 1) - oneMicrosecond,
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'now',
        );
        verifyHumanize(
          input: const Duration(seconds: -1) + oneMicrosecond,
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'now',
        );
      });

      test('rounding makes no difference', () {
        verifyHumanize(
          input: Duration.zero,
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'now',
        );
        verifyHumanize(
          input: const Duration(seconds: 1) - oneMicrosecond,
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'now',
        );
        verifyHumanize(
          input: const Duration(seconds: -1) + oneMicrosecond,
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'now',
        );
      });
    });

    group('seconds', () {
      test('an input of ±1 second transforms correctly', () {
        verifyHumanize(
          input: const Duration(seconds: 1),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'a second from now',
        );
        verifyHumanize(
          input: const Duration(seconds: -1),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'a second ago',
        );
      });

      test('an input of ± multiple seconds transforms correctly', () {
        verifyHumanize(
          input: const Duration(seconds: 3),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 seconds from now',
        );
        verifyHumanize(
          input: const Duration(seconds: -3),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 seconds ago',
        );
        verifyHumanize(
          input: const Duration(seconds: 59),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '59 seconds from now',
        );
        verifyHumanize(
          input: const Duration(seconds: -59),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '59 seconds ago',
        );
      });

      test('granularity makes no difference when the primary unit is seconds', () {
        verifyHumanize(
          input: const Duration(seconds: 1),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'a second from now',
        );
        verifyHumanize(
          input: const Duration(seconds: 3),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: '3 seconds from now',
        );
        verifyHumanize(
          input: const Duration(seconds: -1),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'a second ago',
        );
        verifyHumanize(
          input: const Duration(seconds: -3),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: '3 seconds ago',
        );
      });

      test('rounding makes no difference when the primary unit is seconds', () {
        verifyHumanize(
          input: const Duration(seconds: 1, milliseconds: 500),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'a second from now',
        );
        verifyHumanize(
          input: const Duration(seconds: 3, milliseconds: 500),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: '3 seconds from now',
        );
        verifyHumanize(
          input: const Duration(seconds: -1, milliseconds: -500),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'a second ago',
        );
        verifyHumanize(
          input: const Duration(seconds: -3, milliseconds: -500),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: '3 seconds ago',
        );
      });
    });

    group('minutes', () {
      test('an input of ±1 minute transforms correctly', () {
        verifyHumanize(
          input: const Duration(minutes: 1),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'a minute from now',
        );
        verifyHumanize(
          input: const Duration(minutes: -1),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'a minute ago',
        );
      });

      test('an input of ± multiple minutes transforms correctly', () {
        verifyHumanize(
          input: const Duration(minutes: 3),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 minutes from now',
        );
        verifyHumanize(
          input: const Duration(minutes: -3),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 minutes ago',
        );
        verifyHumanize(
          input: const Duration(minutes: 59),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '59 minutes from now',
        );
        verifyHumanize(
          input: const Duration(minutes: -59),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '59 minutes ago',
        );
      });

      test('granularity determines whether seconds affect the result', () {
        verifyHumanize(
          input: const Duration(minutes: 1, seconds: 1),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'a minute from now',
        );
        verifyHumanize(
          input: const Duration(minutes: 1, seconds: 1),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just over a minute from now',
        );
      });

      test('number of seconds determines secondary granularity', () {
        verifyHumanize(
          input: const Duration(minutes: 1, seconds: 10),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just over a minute from now',
        );
        verifyHumanize(
          input: const Duration(minutes: -1, seconds: -10),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just over a minute ago',
        );
        verifyHumanize(
          input: const Duration(minutes: 1, seconds: 25),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'over a minute from now',
        );
        verifyHumanize(
          input: const Duration(minutes: -1, seconds: -25),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'over a minute ago',
        );
        verifyHumanize(
          input: const Duration(minutes: 1, seconds: 35),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'under 2 minutes from now',
        );
        verifyHumanize(
          input: const Duration(minutes: -1, seconds: -35),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'under 2 minutes ago',
        );
        verifyHumanize(
          input: const Duration(minutes: 1, seconds: 55),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just under 2 minutes from now',
        );
        verifyHumanize(
          input: const Duration(minutes: -1, seconds: -55),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just under 2 minutes ago',
        );
      });

      test('rounding considers seconds if granularity is primary unit only', () {
        verifyHumanize(
          input: const Duration(minutes: 1, seconds: 29),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'a minute from now',
        );
        verifyHumanize(
          input: const Duration(minutes: -1, seconds: -29),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'a minute ago',
        );
        verifyHumanize(
          input: const Duration(minutes: 1, seconds: 30),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: '2 minutes from now',
        );
        verifyHumanize(
          input: const Duration(minutes: -1, seconds: -30),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: '2 minutes ago',
        );
      });

      test('rounding has no effect if secondary units are included', () {
        verifyHumanize(
          input: const Duration(minutes: 1, seconds: 29),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'over a minute from now',
        );
        verifyHumanize(
          input: const Duration(minutes: -1, seconds: -29),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'over a minute ago',
        );
        verifyHumanize(
          input: const Duration(minutes: 1, seconds: 30),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'under 2 minutes from now',
        );
        verifyHumanize(
          input: const Duration(minutes: -1, seconds: -30),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'under 2 minutes ago',
        );
      });
    });

    group('hours', () {
      test('an input of ±1 hour transforms correctly', () {
        verifyHumanize(
          input: const Duration(hours: 1),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'an hour from now',
        );
        verifyHumanize(
          input: const Duration(hours: -1),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'an hour ago',
        );
      });

      test('an input of ± multiple hours transforms correctly', () {
        verifyHumanize(
          input: const Duration(hours: 3),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 hours from now',
        );
        verifyHumanize(
          input: const Duration(hours: -3),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 hours ago',
        );
        verifyHumanize(
          input: const Duration(hours: 23),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '23 hours from now',
        );
        verifyHumanize(
          input: const Duration(hours: -23),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '23 hours ago',
        );
      });

      test('granularity determines whether minutes affect the result', () {
        verifyHumanize(
          input: const Duration(hours: 1, minutes: 1),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'an hour from now',
        );
        verifyHumanize(
          input: const Duration(hours: 1, minutes: 1),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just over an hour from now',
        );
      });

      test('number of minutes determines secondary granularity', () {
        verifyHumanize(
          input: const Duration(hours: 1, minutes: 10),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just over an hour from now',
        );
        verifyHumanize(
          input: const Duration(hours: -1, minutes: -10),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just over an hour ago',
        );
        verifyHumanize(
          input: const Duration(hours: 1, minutes: 25),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'over an hour from now',
        );
        verifyHumanize(
          input: const Duration(hours: -1, minutes: -25),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'over an hour ago',
        );
        verifyHumanize(
          input: const Duration(hours: 1, minutes: 35),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'under 2 hours from now',
        );
        verifyHumanize(
          input: const Duration(hours: -1, minutes: -35),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'under 2 hours ago',
        );
        verifyHumanize(
          input: const Duration(hours: 1, minutes: 55),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just under 2 hours from now',
        );
        verifyHumanize(
          input: const Duration(hours: -1, minutes: -55),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just under 2 hours ago',
        );
      });

      test('rounding considers minutes if granularity is primary unit only', () {
        verifyHumanize(
          input: const Duration(hours: 1, minutes: 29),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'an hour from now',
        );
        verifyHumanize(
          input: const Duration(hours: -1, minutes: -29),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'an hour ago',
        );
        verifyHumanize(
          input: const Duration(hours: 1, minutes: 30),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: '2 hours from now',
        );
        verifyHumanize(
          input: const Duration(hours: -1, minutes: -30),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: '2 hours ago',
        );
      });

      test('rounding considers seconds if granularity is primary and secondary units', () {
        verifyHumanize(
          input: const Duration(hours: 1, minutes: 29, seconds: 29),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'over an hour from now',
        );
        verifyHumanize(
          input: const Duration(hours: -1, minutes: -29, seconds: -29),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'over an hour ago',
        );
        verifyHumanize(
          input: const Duration(hours: 1, minutes: 29, seconds: 30),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'under 2 hours from now',
        );
        verifyHumanize(
          input: const Duration(hours: -1, minutes: -29, seconds: -30),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'under 2 hours ago',
        );
      });
    });

    group('days', () {
      test('an input of ±1 day transforms correctly', () {
        verifyHumanize(
          input: const Duration(days: 1),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'tomorrow',
        );
        verifyHumanize(
          input: const Duration(days: -1),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'yesterday',
        );
      });

      test('an input of ± multiple days transforms correctly', () {
        verifyHumanize(
          input: const Duration(days: 3),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 days from now',
        );
        verifyHumanize(
          input: const Duration(days: -3),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 days ago',
        );
        verifyHumanize(
          input: const Duration(days: 6),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '6 days from now',
        );
        verifyHumanize(
          input: const Duration(days: -6),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '6 days ago',
        );
      });

      test('granularity determines whether hours affect the result', () {
        verifyHumanize(
          input: const Duration(days: 1, hours: 1),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'tomorrow',
        );
        verifyHumanize(
          input: const Duration(days: 1, hours: 1),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just over a day from now',
        );
      });

      test('number of hours determines secondary granularity', () {
        verifyHumanize(
          input: const Duration(days: 1, hours: 5),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just over a day from now',
        );
        verifyHumanize(
          input: const Duration(days: -1, hours: -5),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just over a day ago',
        );
        verifyHumanize(
          input: const Duration(days: 1, hours: 11),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'over a day from now',
        );
        verifyHumanize(
          input: const Duration(days: -1, hours: -11),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'over a day ago',
        );
        verifyHumanize(
          input: const Duration(days: 1, hours: 17),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'under 2 days from now',
        );
        verifyHumanize(
          input: const Duration(days: -1, hours: -17),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'under 2 days ago',
        );
        verifyHumanize(
          input: const Duration(days: 1, hours: 23),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just under 2 days from now',
        );
        verifyHumanize(
          input: const Duration(days: -1, hours: -23),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just under 2 days ago',
        );
      });

      test('rounding considers hours if granularity is primary unit only', () {
        verifyHumanize(
          input: const Duration(days: 1, hours: 11),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'tomorrow',
        );
        verifyHumanize(
          input: const Duration(days: -1, hours: -11),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'yesterday',
        );
        verifyHumanize(
          input: const Duration(days: 1, hours: 12),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: '2 days from now',
        );
        verifyHumanize(
          input: const Duration(days: -1, hours: -12),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: '2 days ago',
        );
      });

      test('rounding considers minutes if granularity is primary and secondary units', () {
        verifyHumanize(
          input: const Duration(days: 1, hours: 11, minutes: 29),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'over a day from now',
        );
        verifyHumanize(
          input: const Duration(days: -1, hours: -11, minutes: -29),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'over a day ago',
        );
        verifyHumanize(
          input: const Duration(days: 1, hours: 11, minutes: 30),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'under 2 days from now',
        );
        verifyHumanize(
          input: const Duration(days: -1, hours: -11, minutes: -30),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'under 2 days ago',
        );
      });
    });

    group('weeks', () {
      test('an input of ±1 week transforms correctly', () {
        verifyHumanize(
          input: const Duration(days: 7),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'a week from now',
        );
        verifyHumanize(
          input: const Duration(days: -7),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'a week ago',
        );
      });

      test('an input of ± multiple weeks transforms correctly', () {
        verifyHumanize(
          input: const Duration(days: 21),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 weeks from now',
        );
        verifyHumanize(
          input: const Duration(days: -21),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 weeks ago',
        );
      });

      test('granularity determines whether days affect the result', () {
        verifyHumanize(
          input: const Duration(days: 23),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 weeks from now',
        );
        verifyHumanize(
          input: const Duration(days: 23),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'over 3 weeks from now',
        );
      });

      test('number of days determines secondary granularity', () {
        verifyHumanize(
          input: const Duration(days: 8),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just over a week from now',
        );
        verifyHumanize(
          input: const Duration(days: -8),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just over a week ago',
        );
        verifyHumanize(
          input: const Duration(days: 10),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'over a week from now',
        );
        verifyHumanize(
          input: const Duration(days: -10),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'over a week ago',
        );
        verifyHumanize(
          input: const Duration(days: 12),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'under 2 weeks from now',
        );
        verifyHumanize(
          input: const Duration(days: -12),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'under 2 weeks ago',
        );
        verifyHumanize(
          input: const Duration(days: 13),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just under 2 weeks from now',
        );
        verifyHumanize(
          input: const Duration(days: -13),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just under 2 weeks ago',
        );
      });

      test('rounding considers days if granularity is primary unit only', () {
        verifyHumanize(
          input: const Duration(days: 10),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'a week from now',
        );
        verifyHumanize(
          input: const Duration(days: -10),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'a week ago',
        );
        verifyHumanize(
          input: const Duration(days: 11),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: '2 weeks from now',
        );
        verifyHumanize(
          input: const Duration(days: -11),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: '2 weeks ago',
        );
      });

      test('rounding considers hours if granularity is primary and secondary units', () {
        verifyHumanize(
          input: const Duration(days: 10, hours: 11),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'over a week from now',
        );
        verifyHumanize(
          input: const Duration(days: -10, hours: -11),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'over a week ago',
        );
        verifyHumanize(
          input: const Duration(days: 10, hours: 12),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'under 2 weeks from now',
        );
        verifyHumanize(
          input: const Duration(days: -10, hours: -12),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'under 2 weeks ago',
        );
      });
    });

    group('months', () {
      test('an input of ±1 month transforms correctly', () {
        verifyHumanize(
          input: const Duration(days: 31),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'a month from now',
        );
        verifyHumanize(
          input: const Duration(days: -31),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'a month ago',
        );
      });

      test('an input of ± multiple months transforms correctly', () {
        verifyHumanize(
          input: const Duration(days: 92),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 months from now',
        );
        verifyHumanize(
          input: const Duration(days: -92),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 months ago',
        );
      });

      test('granularity determines whether weeks affect the result', () {
        verifyHumanize(
          input: const Duration(days: 98),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 months from now',
        );
        verifyHumanize(
          input: const Duration(days: 98),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'over 3 months from now',
        );
      });

      test('number of weeks determines secondary granularity', () {
        verifyHumanize(
          input: const Duration(days: 37),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'over a month from now',
        );
        verifyHumanize(
          input: const Duration(days: -37),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'over a month ago',
        );
        verifyHumanize(
          input: const Duration(days: 44),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'under 2 months from now',
        );
        verifyHumanize(
          input: const Duration(days: -44),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'under 2 months ago',
        );
      });

      test('rounding considers weeks if granularity is primary unit only', () {
        verifyHumanize(
          input: const Duration(days: 37),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'a month from now',
        );
        verifyHumanize(
          input: const Duration(days: -37),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'a month ago',
        );
        verifyHumanize(
          input: const Duration(days: 44),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: '2 months from now',
        );
        verifyHumanize(
          input: const Duration(days: -44),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: '2 months ago',
        );
      });

      test('rounding considers days if granularity is primary and secondary units', () {
        verifyHumanize(
          input: const Duration(days: 34),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'over a month from now',
        );
        verifyHumanize(
          input: const Duration(days: -34),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'over a month ago',
        );
        verifyHumanize(
          input: const Duration(days: 41),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'under 2 months from now',
        );
        verifyHumanize(
          input: const Duration(days: -41),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'under 2 months ago',
        );
      });
    });

    group('years', () {
      test('an input of ±1 year transforms correctly', () {
        verifyHumanize(
          input: const Duration(days: 366),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'a year from now',
        );
        verifyHumanize(
          input: const Duration(days: -366),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: 'a year ago',
        );
      });

      test('an input of ± multiple years transforms correctly', () {
        verifyHumanize(
          input: const Duration(days: 1096),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 years from now',
        );
        verifyHumanize(
          input: const Duration(days: -1096),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 years ago',
        );
      });

      test('granularity determines whether months affect the result', () {
        verifyHumanize(
          input: const Duration(days: 1127),
          granularity: Granularity.primaryUnit,
          round: false,
          matcher: '3 years from now',
        );
        verifyHumanize(
          input: const Duration(days: 1127),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just over 3 years from now',
        );
      });

      test('number of months determines secondary granularity', () {
        verifyHumanize(
          input: const Duration(days: 396),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just over a year from now',
        );
        verifyHumanize(
          input: const Duration(days: -396),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just over a year ago',
        );
        verifyHumanize(
          input: const Duration(days: 457),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'over a year from now',
        );
        verifyHumanize(
          input: const Duration(days: -457),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'over a year ago',
        );
        verifyHumanize(
          input: const Duration(days: 548),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'under 2 years from now',
        );
        verifyHumanize(
          input: const Duration(days: -548),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'under 2 years ago',
        );
        verifyHumanize(
          input: const Duration(days: 640),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just under 2 years from now',
        );
        verifyHumanize(
          input: const Duration(days: -640),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: false,
          matcher: 'just under 2 years ago',
        );
      });

      test('rounding considers months if granularity is primary unit only', () {
        verifyHumanize(
          input: const Duration(days: 518),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'a year from now',
        );
        verifyHumanize(
          input: const Duration(days: -518),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: 'a year ago',
        );
        verifyHumanize(
          input: const Duration(days: 548),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: '2 years from now',
        );
        verifyHumanize(
          input: const Duration(days: -548),
          granularity: Granularity.primaryUnit,
          round: true,
          matcher: '2 years ago',
        );
      });

      test('rounding considers weeks if granularity is primary and secondary units', () {
        verifyHumanize(
          input: const Duration(days: 525),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'over a year from now',
        );
        verifyHumanize(
          input: const Duration(days: -525),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'over a year ago',
        );
        verifyHumanize(
          input: const Duration(days: 532),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'under 2 years from now',
        );
        verifyHumanize(
          input: const Duration(days: -532),
          granularity: Granularity.primaryAndSecondaryUnits,
          round: true,
          matcher: 'under 2 years ago',
        );
      });
    });
  });
}
