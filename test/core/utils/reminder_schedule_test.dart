import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/utils/reminder_schedule.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

void main() {
  late tz.Location darEsSalaam;

  setUpAll(() {
    tzdata.initializeTimeZones();
    darEsSalaam = tz.getLocation('Africa/Dar_es_Salaam');
  });

  test('parses reminder clock times with a fallback', () {
    expect(ReminderClockTime.parse('07:30').hour, 7);
    expect(ReminderClockTime.parse('07:30').minute, 30);
    expect(ReminderClockTime.parse('21:00').hour, 21);
    expect(ReminderClockTime.parse('bad').hour, 7);
    expect(ReminderClockTime.parse('bad').minute, 0);
  });

  test('schedules later today when the clock is still ahead', () {
    final now = tz.TZDateTime(darEsSalaam, 2026, 9, 11, 6, 0);
    final fire = ReminderClockTime.nextDailyFire(
      location: darEsSalaam,
      now: now,
      hour: 7,
      minute: 0,
    );
    expect(fire.day, 11);
    expect(fire.hour, 7);
    expect(fire.minute, 0);
  });

  test('rolls to tomorrow when today\'s reminder already passed', () {
    final now = tz.TZDateTime(darEsSalaam, 2026, 9, 11, 7, 1);
    final fire = ReminderClockTime.nextDailyFire(
      location: darEsSalaam,
      now: now,
      hour: 7,
      minute: 0,
    );
    expect(fire.day, 12);
    expect(fire.hour, 7);
  });

  test('horizon fires keep the clock and step one day at a time', () {
    final now = tz.TZDateTime(darEsSalaam, 2026, 9, 11, 6, 0);
    final fires = ReminderClockTime.nextHorizonFires(
      location: darEsSalaam,
      now: now,
      hour: 7,
      minute: 0,
      dayCount: 3,
    );
    expect(fires.length, 3);
    expect(fires[0].day, 11);
    expect(fires[1].day, 12);
    expect(fires[2].day, 13);
    expect(fires[0].hour, 7);
    expect(fires[1].hour, 7);
  });
}
