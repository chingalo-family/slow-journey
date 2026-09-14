import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/utils/app_date.dart';
import 'package:slowjourney/core/utils/learning_tags.dart';

void main() {
  group('AppDate', () {
    test('isoDate is calendar date only', () {
      expect(AppDate.isoDate(DateTime(2026, 9, 11, 21, 15)), '2026-09-11');
    });

    test('weekContaining starts on Monday', () {
      final week = AppDate.weekContaining(DateTime(2026, 9, 11));
      expect(week.length, 7);
      expect(week.first.weekday, DateTime.monday);
      expect(week.first.day, 7);
    });

    test('shiftWeeks moves to another week', () {
      final previous = AppDate.shiftWeeks(DateTime(2026, 9, 11), -1);
      expect(AppDate.isoDate(previous), '2026-09-04');
    });

    test('shiftMonths keeps the day when it exists', () {
      final previous = AppDate.shiftMonths(DateTime(2026, 9, 11), -1);
      expect(AppDate.isoDate(previous), '2026-08-11');
    });

    test('shiftMonths clamps to the last day of shorter months', () {
      final february = AppDate.shiftMonths(DateTime(2026, 3, 31), -1);
      expect(AppDate.isoDate(february), '2026-02-28');
    });

    test('monthGrid starts on Monday and covers the selected month', () {
      final grid = AppDate.monthGrid(DateTime(2026, 9, 11));
      expect(grid.first.weekday, DateTime.monday);
      expect(grid.last.weekday, DateTime.sunday);
      expect(grid.any((day) => day.month == 9 && day.day == 1), isTrue);
      expect(grid.any((day) => day.month == 9 && day.day == 30), isTrue);
    });

    test('plannerVisibleRange uses the month grid in month mode', () {
      final range = AppDate.plannerVisibleRange(
        DateTime(2026, 9, 11),
        month: true,
      );
      expect(range.start, AppDate.monthGrid(DateTime(2026, 9, 11)).first);
      expect(range.end, AppDate.monthGrid(DateTime(2026, 9, 11)).last);
    });

    test('feedDateKind names today, yesterday, and other calendar days', () {
      final now = DateTime(2026, 9, 11, 21);
      expect(AppDate.feedDateKind(DateTime(2026, 9, 11), now), FeedDateKind.today);
      expect(
        AppDate.feedDateKind(DateTime(2026, 9, 10), now),
        FeedDateKind.yesterday,
      );
      expect(
        AppDate.feedDateKind(DateTime(2026, 9, 4), now),
        FeedDateKind.calendar,
      );
    });

    test('feedCalendarDate keeps weekday and month for other days', () {
      expect(
        AppDate.feedCalendarDate(DateTime(2026, 9, 4), DateTime(2026, 9, 11)),
        'Friday · Sep 4',
      );
      expect(
        AppDate.feedCalendarDate(DateTime(2025, 12, 24), DateTime(2026, 9, 11)),
        'Wednesday · Dec 24, 2025',
      );
    });
  });

  group('LearningTags', () {
    test('infers mindfulness and rest from copy', () {
      final tags = LearningTags.infer(
        'Morning meditation helped me stay still',
        'An evening walk felt calm',
      );
      expect(tags, containsAll(['Mindfulness', 'Rest']));
    });

    test('falls back to Presence when there is a lesson but no keywords', () {
      expect(
        LearningTags.infer('I noticed the weather', ''),
        ['Presence'],
      );
    });

    test('sanitize keeps catalog ids and custom theme names', () {
      expect(
        LearningTags.sanitize(['focus', 'family dinner', 'Rest', 'FOCUS', '']),
        ['Focus', 'Family Dinner', 'Rest'],
      );
    });

    test('normalize maps presets and rejects empty labels', () {
      expect(LearningTags.normalize('  gratitude '), 'Gratitude');
      expect(LearningTags.normalize('self-care'), 'Self-care');
      expect(LearningTags.normalize('   '), isNull);
      expect(LearningTags.normalize('123'), isNull);
    });

    test('picker order puts previously used catalog and custom tags first', () {
      expect(
        LearningTags.pickerOrder(previouslyUsed: ['Gratitude', 'Family']),
        [
          'Gratitude',
          'Family',
          'Mindfulness',
          'Focus',
          'Rest',
          'Discipline',
          'Movement',
          'Presence',
        ],
      );
    });

    test('resolve prefers chosen tags over inferred keywords', () {
      expect(
        LearningTags.resolve(
          learning: 'Morning meditation',
          wins: 'A calm walk',
          chosen: ['Focus'],
        ),
        ['Focus'],
      );
    });
  });
}
