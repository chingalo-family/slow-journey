import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/utils/streak.dart';

void main() {
  group('StreakCalculator', () {
    test('returns 0 when empty', () {
      expect(StreakCalculator.currentStreak({}, '2026-09-11'), 0);
    });

    test('counts consecutive days including today', () {
      expect(
        StreakCalculator.currentStreak(
          {'2026-09-09', '2026-09-10', '2026-09-11'},
          '2026-09-11',
        ),
        3,
      );
    });

    test('allows yesterday when today is not complete', () {
      expect(
        StreakCalculator.currentStreak(
          {'2026-09-10'},
          '2026-09-11',
        ),
        1,
      );
    });

    test('resets after a skipped day', () {
      expect(
        StreakCalculator.currentStreak(
          {'2026-09-01', '2026-09-10'},
          '2026-09-11',
        ),
        1,
      );
    });

    test('longest streak ignores gaps', () {
      expect(
        StreakCalculator.longestStreak({
          '2026-09-01',
          '2026-09-02',
          '2026-09-03',
          '2026-09-10',
        }),
        3,
      );
    });
  });
}
