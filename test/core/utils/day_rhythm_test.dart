import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/utils/day_rhythm.dart';

void main() {
  group('DayRhythm.nextKind', () {
    final today = DateTime(2026, 9, 11, 10, 0);

    test('asks for intentions when today is still empty', () {
      expect(
        DayRhythm.nextKind(
          selectedDay: today,
          now: today,
          hasIntentions: false,
          dayComplete: false,
        ),
        DayNextKind.setIntentions,
      );
    });

    test('invites living the day before evening', () {
      expect(
        DayRhythm.nextKind(
          selectedDay: today,
          now: DateTime(2026, 9, 11, 14, 0),
          hasIntentions: true,
          dayComplete: false,
        ),
        DayNextKind.liveTheDay,
      );
    });

    test('invites closing the day in the evening', () {
      expect(
        DayRhythm.nextKind(
          selectedDay: today,
          now: DateTime(2026, 9, 11, 20, 0),
          hasIntentions: true,
          dayComplete: false,
        ),
        DayNextKind.closeTheDay,
      );
    });

    test('rests when the day is already complete', () {
      expect(
        DayRhythm.nextKind(
          selectedDay: today,
          now: DateTime(2026, 9, 11, 21, 0),
          hasIntentions: true,
          dayComplete: true,
        ),
        DayNextKind.rest,
      );
    });

    test('lets a past incomplete day still be closed', () {
      expect(
        DayRhythm.nextKind(
          selectedDay: DateTime(2026, 9, 10),
          now: today,
          hasIntentions: false,
          dayComplete: false,
        ),
        DayNextKind.closePastDay,
      );
    });

    test('waits on a future day', () {
      expect(
        DayRhythm.nextKind(
          selectedDay: DateTime(2026, 9, 12),
          now: today,
          hasIntentions: false,
          dayComplete: false,
        ),
        DayNextKind.waitForDay,
      );
    });
  });

  test('firstName uses the given name', () {
    expect(DayRhythm.firstName('Alex Rivers', 'friend'), 'Alex');
    expect(DayRhythm.firstName('  ', 'friend'), 'friend');
  });

  group('DayRhythm day actions', () {
    final morning = DateTime(2026, 9, 11, 9);
    final afternoon = DateTime(2026, 9, 11, 14);
    final evening = DateTime(2026, 9, 11, 18);

    test('keeps today reflection closed until evening', () {
      expect(
        DayRhythm.canOpenReflection(
          selectedDay: morning,
          now: morning,
          dayComplete: false,
        ),
        isFalse,
      );
      expect(
        DayRhythm.canOpenReflection(
          selectedDay: afternoon,
          now: afternoon,
          dayComplete: false,
        ),
        isFalse,
      );
      expect(
        DayRhythm.canOpenReflection(
          selectedDay: evening,
          now: evening,
          dayComplete: false,
        ),
        isTrue,
      );
    });

    test('lets today intentions stay open through the day', () {
      expect(
        DayRhythm.canEditIntentions(selectedDay: morning, now: morning),
        isTrue,
      );
      expect(
        DayRhythm.canEditIntentions(selectedDay: afternoon, now: afternoon),
        isTrue,
      );
    });

    test('opens intentions and reflection for a past day', () {
      final past = DateTime(2026, 9, 10);
      expect(
        DayRhythm.canEditIntentions(selectedDay: past, now: morning),
        isTrue,
      );
      expect(
        DayRhythm.canOpenReflection(
          selectedDay: past,
          now: morning,
          dayComplete: false,
        ),
        isTrue,
      );
    });

    test('keeps a future day closed', () {
      final future = DateTime(2026, 9, 12);
      expect(
        DayRhythm.canEditIntentions(selectedDay: future, now: evening),
        isFalse,
      );
      expect(
        DayRhythm.canOpenReflection(
          selectedDay: future,
          now: evening,
          dayComplete: false,
        ),
        isFalse,
      );
    });

    test('lets a completed today be reopened before evening', () {
      expect(
        DayRhythm.canOpenReflection(
          selectedDay: morning,
          now: morning,
          dayComplete: true,
        ),
        isTrue,
      );
    });
  });

  test('momentFor splits morning afternoon and evening', () {
    expect(DayRhythm.momentFor(DateTime(2026, 9, 11, 8)), DayMoment.morning);
    expect(DayRhythm.momentFor(DateTime(2026, 9, 11, 13)), DayMoment.afternoon);
    expect(DayRhythm.momentFor(DateTime(2026, 9, 11, 19)), DayMoment.evening);
  });
}
