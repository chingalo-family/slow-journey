import 'package:timezone/timezone.dart' as tz;

class ReminderClockTime {
  const ReminderClockTime({required this.hour, required this.minute});

  final int hour;
  final int minute;

  static ReminderClockTime parse(String hhmm) {
    final parts = hhmm.split(':');
    final parsedHour = int.tryParse(parts.isNotEmpty ? parts.first : '') ?? 7;
    final parsedMinute =
        int.tryParse(parts.length > 1 ? parts[1] : '') ?? 0;
    return ReminderClockTime(
      hour: parsedHour.clamp(0, 23),
      minute: parsedMinute.clamp(0, 59),
    );
  }

  static tz.TZDateTime nextDailyFire({
    required tz.Location location,
    required DateTime now,
    required int hour,
    required int minute,
  }) {
    final instant = now.isUtc ? now : now.toUtc();
    final nowLocal = tz.TZDateTime.from(instant, location);
    var scheduled = tz.TZDateTime(
      location,
      nowLocal.year,
      nowLocal.month,
      nowLocal.day,
      hour,
      minute,
    );
    if (!scheduled.isAfter(nowLocal)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  static List<tz.TZDateTime> nextHorizonFires({
    required tz.Location location,
    required DateTime now,
    required int hour,
    required int minute,
    required int dayCount,
  }) {
    final first = nextDailyFire(
      location: location,
      now: now,
      hour: hour,
      minute: minute,
    );
    return [
      for (var dayOffset = 0; dayOffset < dayCount; dayOffset++)
        first.add(Duration(days: dayOffset)),
    ];
  }
}
