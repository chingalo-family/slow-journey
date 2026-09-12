import 'package:flutter/widgets.dart';
import 'package:slowjourney/core/utils/app_date.dart';
import 'package:slowjourney/l10n/app_localizations.dart';

class L10nUtil {
  static const locale = Locale('en');

  static AppLocalizations english() => lookupAppLocalizations(locale);

  static String learningTagLabel(AppLocalizations l10n, String storedId) {
    switch (storedId) {
      case 'Mindfulness':
        return l10n.tagMindfulness;
      case 'Focus':
        return l10n.tagFocus;
      case 'Rest':
        return l10n.tagRest;
      case 'Discipline':
        return l10n.tagDiscipline;
      case 'Gratitude':
        return l10n.tagGratitude;
      case 'Movement':
        return l10n.tagMovement;
      case 'Presence':
        return l10n.tagPresence;
      default:
        return storedId;
    }
  }

  static String feedCardDate(
    AppLocalizations l10n,
    DateTime date, [
    DateTime? now,
  ]) {
    final weekday = AppDate.weekdayName(date);
    switch (AppDate.feedDateKind(date, now)) {
      case FeedDateKind.today:
        return l10n.feedDateToday(weekday);
      case FeedDateKind.yesterday:
        return l10n.feedDateYesterday(weekday);
      case FeedDateKind.calendar:
        return AppDate.feedCalendarDate(date, now);
    }
  }
}

extension SlowJourneyL10n on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
