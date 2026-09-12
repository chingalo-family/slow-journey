import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/constants/notification_copy_pack.dart';
import 'package:slowjourney/core/utils/l10n_util.dart';

void main() {
  test('morning and evening reminder pools are large and distinct', () {
    final l10n = L10nUtil.english();
    final morning = NotificationCopyPack.morning(l10n);
    final evening = NotificationCopyPack.evening(l10n);
    expect(morning.length, 40);
    expect(evening.length, 40);
    expect(
      morning.map((copy) => '${copy.title}|${copy.body}').toSet().length,
      40,
    );
    expect(
      evening.map((copy) => '${copy.title}|${copy.body}').toSet().length,
      40,
    );
  });

  test('reminder copy is stable for a date and varies across days', () {
    final l10n = L10nUtil.english();
    final first = DateTime(2026, 9, 12);
    expect(
      NotificationCopyPack.morningForDate(first, l10n).title,
      NotificationCopyPack.morningForDate(first, l10n).title,
    );
    expect(
      NotificationCopyPack.eveningForDate(first, l10n).body,
      isNot(NotificationCopyPack.morningForDate(first, l10n).body),
    );
    final morningTitles = {
      for (var dayOffset = 0; dayOffset < 21; dayOffset++)
        NotificationCopyPack.morningForDate(
          first.add(Duration(days: dayOffset)),
          l10n,
        ).title,
    };
    expect(morningTitles.length, greaterThan(8));
  });
}
