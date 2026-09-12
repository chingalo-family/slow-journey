class StreakCalculator {
  static int currentStreak(Set<String> completedDates, String todayIso) {
    if (completedDates.isEmpty) return 0;
    var cursor = DateTime.parse(todayIso);
    if (!completedDates.contains(todayIso)) {
      cursor = cursor.subtract(const Duration(days: 1));
      final yesterday = _iso(cursor);
      if (!completedDates.contains(yesterday)) return 0;
    }
    var streak = 0;
    while (completedDates.contains(_iso(cursor))) {
      streak += 1;
      cursor = cursor.subtract(const Duration(days: 1));
    }
    return streak;
  }

  static int longestStreak(Set<String> completedDates) {
    if (completedDates.isEmpty) return 0;
    final sorted = completedDates.map(DateTime.parse).toList()..sort();
    var longest = 1;
    var run = 1;
    for (var dateIndex = 1; dateIndex < sorted.length; dateIndex++) {
      final gap = sorted[dateIndex].difference(sorted[dateIndex - 1]).inDays;
      if (gap == 1) {
        run += 1;
        if (run > longest) longest = run;
      } else if (gap > 1) {
        run = 1;
      }
    }
    return longest;
  }

  static String _iso(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}
