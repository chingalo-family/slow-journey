import 'app_date.dart';

enum DayMoment { morning, afternoon, evening }

enum DayNextKind {
  setIntentions,
  liveTheDay,
  closeTheDay,
  rest,
  waitForDay,
  closePastDay,
}

class DayRhythm {
  static DayMoment momentFor(DateTime now) {
    final hour = now.hour;
    if (hour < 12) {
      return DayMoment.morning;
    }
    if (hour < 17) {
      return DayMoment.afternoon;
    }
    return DayMoment.evening;
  }

  static String firstName(String fullName, String fallback) {
    final trimmed = fullName.trim();
    if (trimmed.isEmpty) {
      return fallback;
    }
    return trimmed.split(RegExp(r'\s+')).first;
  }

  static DayNextKind nextKind({
    required DateTime selectedDay,
    required DateTime now,
    required bool hasIntentions,
    required bool dayComplete,
  }) {
    final today = AppDate.dateOnly(now);
    final selected = AppDate.dateOnly(selectedDay);
    if (selected.isAfter(today)) {
      return DayNextKind.waitForDay;
    }
    if (dayComplete) {
      return DayNextKind.rest;
    }
    if (selected.isBefore(today)) {
      return DayNextKind.closePastDay;
    }
    if (!hasIntentions) {
      return DayNextKind.setIntentions;
    }
    if (momentFor(now) == DayMoment.evening) {
      return DayNextKind.closeTheDay;
    }
    return DayNextKind.liveTheDay;
  }

  static bool canEditIntentions({
    required DateTime selectedDay,
    required DateTime now,
  }) {
    final selected = AppDate.dateOnly(selectedDay);
    final today = AppDate.dateOnly(now);
    return !selected.isAfter(today);
  }

  static bool canOpenReflection({
    required DateTime selectedDay,
    required DateTime now,
    required bool dayComplete,
  }) {
    final selected = AppDate.dateOnly(selectedDay);
    final today = AppDate.dateOnly(now);
    if (selected.isAfter(today)) {
      return false;
    }
    if (selected.isBefore(today) || dayComplete) {
      return true;
    }
    return momentFor(now) == DayMoment.evening;
  }
}
