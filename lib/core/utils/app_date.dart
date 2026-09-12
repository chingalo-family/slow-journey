import 'package:intl/intl.dart';

class AppDate {
  static DateTime nowLocal() => DateTime.now();

  static DateTime dateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  static String isoDate([DateTime? date]) =>
      DateFormat('yyyy-MM-dd').format(dateOnly(date ?? nowLocal()));

  static DateTime parseIso(String value) => DateTime.parse(value);

  static String friendlyDay([DateTime? date]) =>
      DateFormat('EEEE, MMMM d').format(date ?? nowLocal());

  static String monthDay([DateTime? date]) =>
      DateFormat('MMMM d, y').format(date ?? nowLocal());

  static String plannerHeader([DateTime? date]) =>
      DateFormat('MMMM d, y').format(date ?? nowLocal());

  static String periodKey([DateTime? date]) =>
      DateFormat('yyyy-MM').format(date ?? nowLocal());

  static bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  static bool isSameMonth(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month;

  static FeedDateKind feedDateKind(DateTime date, [DateTime? now]) {
    final day = dateOnly(date);
    final today = dateOnly(now ?? nowLocal());
    if (isSameDay(day, today)) return FeedDateKind.today;
    if (isSameDay(day, today.subtract(const Duration(days: 1)))) {
      return FeedDateKind.yesterday;
    }
    return FeedDateKind.calendar;
  }

  static String weekdayName(DateTime date) => DateFormat('EEEE').format(date);

  static String feedCalendarDate(DateTime date, [DateTime? now]) {
    final day = dateOnly(date);
    final today = dateOnly(now ?? nowLocal());
    if (day.year == today.year) {
      return DateFormat('EEEE · MMM d').format(day);
    }
    return DateFormat('EEEE · MMM d, y').format(day);
  }

  static String yesterdayIso([DateTime? date]) {
    final d = dateOnly(date ?? nowLocal()).subtract(const Duration(days: 1));
    return isoDate(d);
  }

  static List<DateTime> weekContaining(DateTime date) {
    final start = dateOnly(date).subtract(Duration(days: date.weekday - 1));
    return [
      for (var dayOffset = 0; dayOffset < 7; dayOffset++)
        start.add(Duration(days: dayOffset)),
    ];
  }

  static DateTime shiftWeeks(DateTime date, int weekCount) =>
      dateOnly(date).add(Duration(days: 7 * weekCount));

  static DateTime shiftMonths(DateTime date, int monthCount) {
    final base = dateOnly(date);
    final monthStart = DateTime(base.year, base.month + monthCount, 1);
    final lastDay = DateTime(monthStart.year, monthStart.month + 1, 0).day;
    final dayNumber = base.day < lastDay ? base.day : lastDay;
    return DateTime(monthStart.year, monthStart.month, dayNumber);
  }

  static List<DateTime> monthGrid(DateTime date) {
    final monthStart = DateTime(date.year, date.month, 1);
    final monthEnd = DateTime(date.year, date.month + 1, 0);
    var cursor = weekContaining(monthStart).first;
    final last = weekContaining(monthEnd).last;
    final days = <DateTime>[];
    while (!cursor.isAfter(last)) {
      days.add(cursor);
      cursor = cursor.add(const Duration(days: 1));
    }
    return days;
  }

  static ({DateTime start, DateTime end}) plannerVisibleRange(
    DateTime selected, {
    required bool month,
  }) {
    if (month) {
      final grid = monthGrid(selected);
      return (start: grid.first, end: grid.last);
    }
    final week = weekContaining(selected);
    return (start: week.first, end: week.last);
  }

  static String weekRangeLabel(DateTime date) {
    final week = weekContaining(date);
    if (week.first.month == week.last.month) {
      return '${DateFormat('MMM d').format(week.first)}–${DateFormat('d, y').format(week.last)}';
    }
    if (week.first.year == week.last.year) {
      return '${DateFormat('MMM d').format(week.first)}–${DateFormat('MMM d, y').format(week.last)}';
    }
    return '${DateFormat('MMM d, y').format(week.first)}–${DateFormat('MMM d, y').format(week.last)}';
  }

  static String monthLabel(DateTime date) => DateFormat('MMMM y').format(date);
}

enum FeedDateKind { today, yesterday, calendar }
