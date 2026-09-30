// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Slow Journey';

  @override
  String get tagline => 'Pause · Reflect · Grow';

  @override
  String get yourJourney => 'Your Journey';

  @override
  String feedDateToday(String weekday) {
    return 'Today · $weekday';
  }

  @override
  String feedDateYesterday(String weekday) {
    return 'Yesterday · $weekday';
  }

  @override
  String get yourDailyCycle => 'Your Daily Cycle';

  @override
  String get cycleSubtitle =>
      'A gentle rhythm for intention, guided by your inner voice.';

  @override
  String get cycleMorningTitle => 'Morning · Set Intentions';

  @override
  String get cycleMorningSubtitle => 'Begin with three quiet aims.';

  @override
  String get cycleEveningTitle => 'Evening · Reflect & Celebrate';

  @override
  String get cycleEveningSubtitle =>
      'Close the day with learning and gratitude.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get startYourJourney => 'Start your journey';

  @override
  String get welcomeProfileSubtitle =>
      'A local profile stays on this device. No account required.';

  @override
  String get hintYourName => 'Your name';

  @override
  String get hintEmailOptional => 'Email (optional)';

  @override
  String get hintBirthdayOptional => 'Birthday (optional)';

  @override
  String get begin => 'Begin';

  @override
  String get saving => 'Saving…';

  @override
  String get pinLaterHint =>
      'You can add a PIN later in Setup. Everything stays offline.';

  @override
  String get morningIntentions => 'Morning Intentions';

  @override
  String get intentionTodayTitle => 'Today\'s Intentions';

  @override
  String get greetingFriend => 'friend';

  @override
  String goodMorningName(String name) {
    return 'Good morning, $name';
  }

  @override
  String goodAfternoonName(String name) {
    return 'Good afternoon, $name';
  }

  @override
  String goodEveningName(String name) {
    return 'Good evening, $name';
  }

  @override
  String get morningFraming =>
      'Welcome the day with stillness. Focus your energy on three intentions to guide your journey today.';

  @override
  String get top3Intentions => 'Top 3 Intentions';

  @override
  String filledOfThree(int count) {
    return '$count OF 3';
  }

  @override
  String get intentionHintBreath => 'Focus on breathing…';

  @override
  String get intentionHintDraft => 'Finish project draft…';

  @override
  String get intentionHintWalk => 'Evening walk…';

  @override
  String get setMyDay => 'Set My Day';

  @override
  String get setIntentionsLater => 'I\'ll set them in the planner';

  @override
  String get editIntentions => 'Edit intentions';

  @override
  String honoredOfThree(int count, int total) {
    return '$count of $total honored';
  }

  @override
  String get nextSetIntentionsTitle => 'Begin with three quiet aims';

  @override
  String get nextSetIntentionsBody =>
      'Name what matters today. Three is enough.';

  @override
  String get nextLiveDayTitle => 'Live what you named';

  @override
  String get nextLiveDayBody =>
      'Tick an intention when you have honored it. Nothing is lost if you leave some open.';

  @override
  String get nextCloseDayTitle => 'Close the day with kindness';

  @override
  String get nextCloseDayBody =>
      'A short reflection is how this day becomes part of your journey.';

  @override
  String get nextRestTitle => 'This day is complete';

  @override
  String get nextRestBody => 'Rest. You can reopen the reflection anytime.';

  @override
  String get nextFutureTitle => 'This day has not arrived';

  @override
  String get nextFutureBody =>
      'Come back when it does. There is nothing to prepare here yet.';

  @override
  String get nextPastTitle => 'You can still close this day';

  @override
  String get nextPastBody =>
      'You can set intentions or write a reflection for this day. A late close still counts.';

  @override
  String get reflectionOpensThisEvening =>
      'Evening reflection opens after 5:00 PM.';

  @override
  String get addAPhoto => 'Add a photo';

  @override
  String get cropPhoto => 'Crop photo';

  @override
  String get cropPhotoDone => 'Crop';

  @override
  String get viewPhoto => 'View photo';

  @override
  String get changePhoto => 'Change photo';

  @override
  String get completeDayNeedsWords =>
      'Write a lesson or a win to complete the day.';

  @override
  String get growthEmptyChart =>
      'Your weekly shape appears after a few evenings.';

  @override
  String get growthEmptyTags => 'Tags grow from the words you write at night.';

  @override
  String get growthChartCaption => 'Evenings completed each week';

  @override
  String growthEveningCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count evenings',
      one: '1 evening',
    );
    return '$_temp0';
  }

  @override
  String get insightEmpty =>
      'Your monthly insight will appear after a few evening reflections.';

  @override
  String get emptyFeedAction => 'Set today\'s intentions';

  @override
  String get makeTodayWorthRemembering => 'Make today worth remembering.';

  @override
  String get dailyPlanner => 'Daily Planner';

  @override
  String get plannerWeek => 'Week';

  @override
  String get plannerMonth => 'Month';

  @override
  String get plannerPrevious => 'Previous';

  @override
  String get plannerNext => 'Next';

  @override
  String get plannerJumpToToday => 'Today';

  @override
  String get plannerPickDate => 'Choose a date';

  @override
  String get noIntentionsYet => 'No intentions for this day yet.';

  @override
  String get setIntentions => 'Set intentions';

  @override
  String get eveningReflection => 'Evening Reflection';

  @override
  String get todayCompleteRest => 'Today is complete. Rest well.';

  @override
  String get waitingEvening => 'Waiting for your evening reflection...';

  @override
  String get viewReflection => 'View reflection';

  @override
  String get startReflection => 'Start Reflection';

  @override
  String get todaysWisdom => 'Today\'s Wisdom';

  @override
  String get reflection => 'Reflection';

  @override
  String get eveningRitual => 'Evening Ritual';

  @override
  String get restYourMind => 'Rest your mind.';

  @override
  String get restSubtitle =>
      'Take a gentle look back at your journey today and find peace in your progress.';

  @override
  String get optionalDayTitle => 'Optional title for this day';

  @override
  String get whatDidILearn => 'What did I learn?';

  @override
  String get learnHint => 'A new insight or a small lesson...';

  @override
  String get celebrationsWins => 'Celebrations & Wins';

  @override
  String get winsHint => 'What moment made you feel proud today?';

  @override
  String get gratitudeScore => 'Daily Gratitude Score';

  @override
  String get gratitudeSemantics => 'Daily gratitude score';

  @override
  String gratitudeOptionLabel(String label, int score) {
    return 'Gratitude $label, $score of 4';
  }

  @override
  String get gratitudeTender => 'Tender';

  @override
  String get gratitudeSteady => 'Steady';

  @override
  String get gratitudeGrateful => 'Grateful';

  @override
  String get gratitudeGlowing => 'Glowing';

  @override
  String get completeDay => 'Complete Day';

  @override
  String get reflectionThemes => 'Themes';

  @override
  String get reflectionThemesHint =>
      'Start with the presets. Tap to keep suggestions, reuse earlier evenings, or add a theme of your own.';

  @override
  String get reflectionAddTheme => 'Add theme';

  @override
  String get reflectionAddThemeHint => 'A short name, like Family or Craft';

  @override
  String get reflectionAddThemeConfirm => 'Add';

  @override
  String get reflectionAddThemeCancel => 'Not now';

  @override
  String get dayComplete => 'Day complete';

  @override
  String consistentForDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Consistent for $count days · Well done',
      one: 'Consistent for 1 day · Well done',
    );
    return '$_temp0';
  }

  @override
  String consistentForDaysFooter(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Consistent for $count days · Well done',
      one: 'Consistent for 1 day · Well done',
    );
    return '$_temp0';
  }

  @override
  String get navFeed => 'Feed';

  @override
  String get navPlanner => 'Planner';

  @override
  String get navGrowth => 'Growth';

  @override
  String get navSetup => 'Setup';

  @override
  String get welcomeBack => 'Welcome back';

  @override
  String welcomeBackName(String name) {
    return 'Welcome back, $name';
  }

  @override
  String get enterLocalPin => 'Enter your four-digit PIN to continue.';

  @override
  String get pinUnlockDeviceNote => 'Your PIN stays on this device.';

  @override
  String get pinHint => 'PIN';

  @override
  String get continueAction => 'Continue';

  @override
  String get pinDoesNotMatch => 'That PIN does not match. Try again.';

  @override
  String get firstReflectionTonight => 'Your first reflection starts tonight.';

  @override
  String get emptyFeedHint =>
      'Tonight, take a few minutes to notice one lesson and one win.';

  @override
  String nDayStreak(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count-day streak',
      one: '1-day streak',
    );
    return '$_temp0';
  }

  @override
  String get streakShort => 'streak';

  @override
  String get streakBegin => 'start';

  @override
  String get eveningReflectionFallbackTitle => 'Evening reflection';

  @override
  String get growthData => 'Growth';

  @override
  String get statReflections => 'Reflections';

  @override
  String get statDayStreak => 'Day streak';

  @override
  String get statLongest => 'Longest';

  @override
  String get growthOverview => 'This month';

  @override
  String get keyLearnings => 'Key Learnings';

  @override
  String get monthlyInsight => 'Monthly Insight';

  @override
  String insightLongStreak(String habit) {
    return 'You\'re most consistent with $habit. This quiet streak suggests you find more calm when you return to yourself each evening.';
  }

  @override
  String insightDefault(String habit) {
    return 'You\'re most consistent with $habit. This suggests you find more calm in the second half of the month.';
  }

  @override
  String growthTagCount(String tag, int count) {
    return '$tag · $count';
  }

  @override
  String get setup => 'Setup';

  @override
  String get localProfile => 'Local profile';

  @override
  String get onThisDeviceOnly => 'On this device only';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsSubtitle =>
      'Morning start and evening reflection invitations';

  @override
  String get mutedDark => 'Muted Dark';

  @override
  String get mutedDarkSubtitle => 'A calmer night palette';

  @override
  String get manageProfile => 'Manage Profile';

  @override
  String get memberSince => 'Member since';

  @override
  String get profileSection => 'Your profile';

  @override
  String get securitySection => 'PIN and auto-lock';

  @override
  String get fieldName => 'Name';

  @override
  String get fieldEmail => 'Email';

  @override
  String get fieldBirthday => 'Birthday';

  @override
  String get hintName => 'Name';

  @override
  String get hintEmail => 'Email';

  @override
  String get saveProfile => 'Save profile';

  @override
  String get savedOnThisDevice => 'Saved on this device';

  @override
  String get localPin => 'Local PIN';

  @override
  String get hintOptionalPin => 'Enter four digits to save a PIN.';

  @override
  String get hintChangePin => 'Enter four digits to change your PIN.';

  @override
  String get setPin => 'Set PIN';

  @override
  String get clearPin => 'Clear PIN';

  @override
  String get removePinTitle => 'Remove PIN?';

  @override
  String get removePinBody =>
      'Slow Journey will stay unlocked on this device. Auto-lock turns off.';

  @override
  String get removeAction => 'Remove';

  @override
  String get pinMustBeFourDigits => 'Use four digits for your PIN.';

  @override
  String get pinEntrySemantics => 'Four-digit PIN';

  @override
  String get pinKeypadBackspace => 'Delete last digit';

  @override
  String get pinSaved =>
      'PIN saved. Slow Journey will ask for it when you open the app again.';

  @override
  String get pinCleared =>
      'PIN removed. The app will stay open on this device.';

  @override
  String get pinIsSet => 'A PIN is saved on this device.';

  @override
  String get pinNotSet =>
      'No PIN yet. Set one to lock Slow Journey when you open the app again.';

  @override
  String get autoLock => 'Auto-lock';

  @override
  String autoLockSubtitle(int minutes) {
    return 'Lock after $minutes minutes away from the app';
  }

  @override
  String get autoLockNeedsPin => 'Set a PIN first to use auto-lock.';

  @override
  String get autoLockIdleLabel => 'Away for';

  @override
  String autoLockAfterMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get wipeLocalData => 'Wipe local data';

  @override
  String get wipeSubtitle =>
      'Removes reflections, intentions, and your profile from this device.';

  @override
  String get wipeThisDevice => 'Wipe this device?';

  @override
  String get wipeWarning =>
      'Reflections, intentions, and counters will be removed. This cannot be undone.';

  @override
  String get keep => 'Keep';

  @override
  String get wipe => 'Wipe';

  @override
  String get planMyDay => 'Plan My Day';

  @override
  String get reflectCelebrate => 'Reflect & Celebrate';

  @override
  String get changeTime => 'Change time';

  @override
  String get remindersInvitation =>
      'Reminders stay on this device. They are invitations, never nags.';

  @override
  String get notificationsOsBlocked =>
      'Notifications are turned off for Slow Journey. Enable them in system Settings to receive reminders.';

  @override
  String get notificationMorningTitle => 'Plan your day';

  @override
  String get notificationMorningBody =>
      'A quiet moment to set three intentions.';

  @override
  String get notificationMorning02Title => 'Begin softly';

  @override
  String get notificationMorning02Body =>
      'You do not need a perfect plan. Three kind aims will do.';

  @override
  String get notificationMorning03Title => 'Three quiet aims';

  @override
  String get notificationMorning03Body =>
      'Name what matters this morning. Let the rest wait.';

  @override
  String get notificationMorning04Title => 'Start with still';

  @override
  String get notificationMorning04Body =>
      'One breath, then choose how you want to show up today.';

  @override
  String get notificationMorning05Title => 'A new page';

  @override
  String get notificationMorning05Body =>
      'Yesterday is closed. Set your intentions for this day.';

  @override
  String get notificationMorning06Title => 'Show up kindly';

  @override
  String get notificationMorning06Body =>
      'Motivation can be gentle. Open Planner and plant three aims.';

  @override
  String get notificationMorning07Title => 'Plant one tree';

  @override
  String get notificationMorning07Body =>
      'You do not have to finish the forest. Begin with three small intentions.';

  @override
  String get notificationMorning08Title => 'Morning light';

  @override
  String get notificationMorning08Body =>
      'A calm start still counts as courage. Set your day.';

  @override
  String get notificationMorning09Title => 'Name what matters';

  @override
  String get notificationMorning09Body =>
      'Write three intentions before the noise of the day arrives.';

  @override
  String get notificationMorning10Title => 'Breathe, then begin';

  @override
  String get notificationMorning10Body =>
      'Stillness first. Then the next true thing on your list.';

  @override
  String get notificationMorning11Title => 'Slow is still motion';

  @override
  String get notificationMorning11Body =>
      'An unhurried morning can hold a whole worthy day.';

  @override
  String get notificationMorning12Title => 'Welcome this morning';

  @override
  String get notificationMorning12Body =>
      'Arrive before you rush. Choose three aims with care.';

  @override
  String get notificationMorning13Title => 'Intention over hurry';

  @override
  String get notificationMorning13Body =>
      'Hustle can wait. Set a kind pace for the hours ahead.';

  @override
  String get notificationMorning14Title => 'Make room for three';

  @override
  String get notificationMorning14Body =>
      'Three intentions are enough. Leave space to live them.';

  @override
  String get notificationMorning15Title => 'A gentle start';

  @override
  String get notificationMorning15Body =>
      'Motivation does not have to shout. Open the day softly.';

  @override
  String get notificationMorning16Title => 'Today can be small';

  @override
  String get notificationMorning16Body =>
      'Small, clear aims still move a life. Write yours now.';

  @override
  String get notificationMorning17Title => 'Open the day';

  @override
  String get notificationMorning17Body =>
      'The morning is an invitation. Set My Day when you are ready.';

  @override
  String get notificationMorning18Title => 'Courage, quietly';

  @override
  String get notificationMorning18Body =>
      'Showing up is already a beginning. Name three intentions.';

  @override
  String get notificationMorning19Title => 'Set your compass';

  @override
  String get notificationMorning19Body =>
      'Point the day toward what you value. Three notes will steer you.';

  @override
  String get notificationMorning20Title => 'First light';

  @override
  String get notificationMorning20Body =>
      'Before the lists pile up, choose how you want this day to feel.';

  @override
  String get notificationMorning21Title => 'Arrive before you rush';

  @override
  String get notificationMorning21Body =>
      'Give yourself a minute. Then plant today’s three aims.';

  @override
  String get notificationMorning22Title => 'Soft focus';

  @override
  String get notificationMorning22Body =>
      'Clarity loves a quiet start. Write what you will honor today.';

  @override
  String get notificationMorning23Title => 'Begin again';

  @override
  String get notificationMorning23Body =>
      'You can start this morning without erasing yesterday.';

  @override
  String get notificationMorning24Title => 'The day is waiting';

  @override
  String get notificationMorning24Body =>
      'It does not need a grand speech. It needs three honest intentions.';

  @override
  String get notificationMorning25Title => 'Choose a kind pace';

  @override
  String get notificationMorning25Body =>
      'Motivation can be a walk, not a sprint. Set your day gently.';

  @override
  String get notificationMorning26Title => 'Wake the garden';

  @override
  String get notificationMorning26Body =>
      'Your attention is a garden. Water what you want to grow today.';

  @override
  String get notificationMorning27Title => 'Three is enough';

  @override
  String get notificationMorning27Body =>
      'Do not wait for a longer list. Three aims will carry the morning.';

  @override
  String get notificationMorning28Title => 'Meet the morning';

  @override
  String get notificationMorning28Body =>
      'Say hello to the day. Then name how you will walk through it.';

  @override
  String get notificationMorning29Title => 'A calm first step';

  @override
  String get notificationMorning29Body =>
      'Start where you are. Open Planner and set three intentions.';

  @override
  String get notificationMorning30Title => 'Let today be true';

  @override
  String get notificationMorning30Body =>
      'Not impressive. True. Write the three things that matter.';

  @override
  String get notificationMorning31Title => 'Rise without hurry';

  @override
  String get notificationMorning31Body =>
      'There is time to begin well. Set a gentle plan for today.';

  @override
  String get notificationMorning32Title => 'Offer the day a name';

  @override
  String get notificationMorning32Body =>
      'Give this morning a direction. Three intentions are a good name.';

  @override
  String get notificationMorning33Title => 'Stillness, then aim';

  @override
  String get notificationMorning33Body =>
      'Pause long enough to hear what you already know. Then begin.';

  @override
  String get notificationMorning34Title => 'Your attention, please';

  @override
  String get notificationMorning34Body =>
      'Where you look, the day follows. Choose three worthy places.';

  @override
  String get notificationMorning35Title => 'Start where you are';

  @override
  String get notificationMorning35Body =>
      'No perfect mood required. Set My Day from this exact morning.';

  @override
  String get notificationMorning36Title => 'Morning invitation';

  @override
  String get notificationMorning36Body =>
      'Come as you are. Plant three aims and let the day unfold.';

  @override
  String get notificationMorning37Title => 'Unfold slowly';

  @override
  String get notificationMorning37Body =>
      'A slow start is still a start. Write your intentions when ready.';

  @override
  String get notificationMorning38Title => 'A worthy beginning';

  @override
  String get notificationMorning38Body =>
      'Make today worth remembering, one quiet intention at a time.';

  @override
  String get notificationMorning39Title => 'Clear a little space';

  @override
  String get notificationMorning39Body =>
      'Leave room for breath. Then choose three things to honor.';

  @override
  String get notificationMorning40Title => 'Walk into today';

  @override
  String get notificationMorning40Body =>
      'You do not have to run. Step in with three kind aims.';

  @override
  String get notificationEveningTitle => 'Reflect & celebrate';

  @override
  String get notificationEveningBody =>
      'Rest your mind. Look back on the day with kindness.';

  @override
  String get notificationEvening02Title => 'Close the day';

  @override
  String get notificationEvening02Body =>
      'A short reflection is how this day becomes part of your journey.';

  @override
  String get notificationEvening03Title => 'Look back kindly';

  @override
  String get notificationEvening03Body =>
      'Notice what you learned. Let that be enough for tonight.';

  @override
  String get notificationEvening04Title => 'Rest your mind';

  @override
  String get notificationEvening04Body =>
      'The day is allowed to be unfinished and still worthy.';

  @override
  String get notificationEvening05Title => 'Celebrate the ordinary';

  @override
  String get notificationEvening05Body =>
      'Name a win, even a small one. Ordinary wins build the path.';

  @override
  String get notificationEvening06Title => 'Evening stillness';

  @override
  String get notificationEvening06Body =>
      'Pause. Write what you learned and what you are grateful for.';

  @override
  String get notificationEvening07Title => 'A gentle review';

  @override
  String get notificationEvening07Body =>
      'No scoreboard. Just a honest look at how you showed up.';

  @override
  String get notificationEvening08Title => 'Harvest the day';

  @override
  String get notificationEvening08Body =>
      'Gather one lesson and one celebration before you rest.';

  @override
  String get notificationEvening09Title => 'Kindness at dusk';

  @override
  String get notificationEvening09Body =>
      'Speak to yourself the way you would to a friend tonight.';

  @override
  String get notificationEvening10Title => 'Let the day land';

  @override
  String get notificationEvening10Body =>
      'Complete the evening ritual so tomorrow can begin lighter.';

  @override
  String get notificationEvening11Title => 'Gratitude, then rest';

  @override
  String get notificationEvening11Body =>
      'Choose a gratitude face. Then put the day down.';

  @override
  String get notificationEvening12Title => 'What did you learn?';

  @override
  String get notificationEvening12Body =>
      'One sentence is enough. Insight prefers quiet more than urgency.';

  @override
  String get notificationEvening13Title => 'Honor what went well';

  @override
  String get notificationEvening13Body =>
      'Celebrations can be small. Write the one that warmed you.';

  @override
  String get notificationEvening14Title => 'Fold the day';

  @override
  String get notificationEvening14Body =>
      'Like a letter. Close it with learning, wins, and rest.';

  @override
  String get notificationEvening15Title => 'Evening invitation';

  @override
  String get notificationEvening15Body =>
      'Come back to yourself. Reflect & celebrate when you are ready.';

  @override
  String get notificationEvening16Title => 'The light is lowering';

  @override
  String get notificationEvening16Body =>
      'A good time to look back without rushing the next thing.';

  @override
  String get notificationEvening17Title => 'Be proud of showing up';

  @override
  String get notificationEvening17Body =>
      'If you began, that counts. Write the rest of the story tonight.';

  @override
  String get notificationEvening18Title => 'Release the unfinished';

  @override
  String get notificationEvening18Body =>
      'Leave open loops on the page. Rest is part of the work.';

  @override
  String get notificationEvening19Title => 'A quiet harvest';

  @override
  String get notificationEvening19Body =>
      'Collect one lesson. Thank one moment. Then stop.';

  @override
  String get notificationEvening20Title => 'Tonight is for kindness';

  @override
  String get notificationEvening20Body =>
      'Review the day as a gardener, not a judge.';

  @override
  String get notificationEvening21Title => 'Write it down';

  @override
  String get notificationEvening21Body =>
      'Memory is tender. A few lines will keep today’s growth.';

  @override
  String get notificationEvening22Title => 'Come home to the day';

  @override
  String get notificationEvening22Body =>
      'You lived it. Now give it a closing: learn, celebrate, rest.';

  @override
  String get notificationEvening23Title => 'Softer than a summary';

  @override
  String get notificationEvening23Body =>
      'You do not need a report. You need a honest evening look.';

  @override
  String get notificationEvening24Title => 'Save a seed';

  @override
  String get notificationEvening24Body =>
      'Tonight’s lesson is tomorrow’s soil. Write a little of it.';

  @override
  String get notificationEvening25Title => 'Dim the noise';

  @override
  String get notificationEvening25Body =>
      'One reflection is enough light. Close the day with it.';

  @override
  String get notificationEvening26Title => 'You can rest now';

  @override
  String get notificationEvening26Body =>
      'First, a kind look back. Then let the night hold you.';

  @override
  String get notificationEvening27Title => 'Mark the path';

  @override
  String get notificationEvening27Body =>
      'A completed evening keeps the streak of returning, not perfection.';

  @override
  String get notificationEvening28Title => 'Thank the hours';

  @override
  String get notificationEvening28Body =>
      'Even mixed days carried something. Name a win and a lesson.';

  @override
  String get notificationEvening29Title => 'Evening compass';

  @override
  String get notificationEvening29Body =>
      'Where did you grow? Point to it, then put the compass down.';

  @override
  String get notificationEvening30Title => 'A late close still counts';

  @override
  String get notificationEvening30Body =>
      'If the day ran long, you can still reflect with kindness.';

  @override
  String get notificationEvening31Title => 'Sit with what was';

  @override
  String get notificationEvening31Body =>
      'Not what should have been. What was. Then celebrate a piece of it.';

  @override
  String get notificationEvening32Title => 'Turn the page';

  @override
  String get notificationEvening32Body =>
      'Reflection is how you turn it. Learning, wins, gratitude, rest.';

  @override
  String get notificationEvening33Title => 'Keep the good';

  @override
  String get notificationEvening33Body =>
      'Let the hard things be true. Keep the good in writing tonight.';

  @override
  String get notificationEvening34Title => 'Night garden';

  @override
  String get notificationEvening34Body =>
      'Water gratitude. Weed nothing in a hurry. Then sleep.';

  @override
  String get notificationEvening35Title => 'Close with peace';

  @override
  String get notificationEvening35Body =>
      'Peace is a practice. A short evening ritual is that practice.';

  @override
  String get notificationEvening36Title => 'Your journey, tonight';

  @override
  String get notificationEvening36Body =>
      'Add this day to the path. Open Reflect & Celebrate.';

  @override
  String get notificationEvening37Title => 'Enough for today';

  @override
  String get notificationEvening37Body =>
      'You can stop striving. Look back once, then rest well.';

  @override
  String get notificationEvening38Title => 'A candle, not a spotlight';

  @override
  String get notificationEvening38Body =>
      'Soft light on the day is enough. Write what you notice.';

  @override
  String get notificationEvening39Title => 'Return to yourself';

  @override
  String get notificationEvening39Body =>
      'The world can wait until morning. Close this day with care.';

  @override
  String get notificationEvening40Title => 'Good night, almost';

  @override
  String get notificationEvening40Body =>
      'One last kind look at today. Then you are allowed to rest.';

  @override
  String get notificationChannelName => 'Daily rhythm';

  @override
  String get notificationChannelDescription =>
      'Changing morning start and evening reflection invitations';

  @override
  String get tagMindfulness => 'Mindfulness';

  @override
  String get tagFocus => 'Focus';

  @override
  String get tagRest => 'Rest';

  @override
  String get tagDiscipline => 'Discipline';

  @override
  String get tagGratitude => 'Gratitude';

  @override
  String get tagMovement => 'Movement';

  @override
  String get tagPresence => 'Presence';

  @override
  String get wisdomQuote01 =>
      'Growth is a slow process, but quitting won’t speed it up.';

  @override
  String get wisdomQuote02 => 'Make today worth remembering.';

  @override
  String get wisdomQuote03 => 'Rest is not a reward. It is part of the work.';

  @override
  String get wisdomQuote04 => 'Small, kind steps still count as progress.';

  @override
  String get wisdomQuote05 =>
      'You do not have to finish the forest to plant a tree.';

  @override
  String get wisdomQuote06 => 'Quiet mornings make braver afternoons.';

  @override
  String get wisdomQuote07 =>
      'Notice what went well. Let that be enough for tonight.';

  @override
  String get wisdomQuote08 => 'Consistency is a form of self-respect.';

  @override
  String get wisdomQuote09 => 'A gentle pace still arrives.';

  @override
  String get wisdomQuote10 =>
      'Your attention is a garden. Water what you want to grow.';

  @override
  String get wisdomQuote11 =>
      'Pause long enough to hear what you already know.';

  @override
  String get wisdomQuote12 =>
      'Celebrate the ordinary wins. They build the extraordinary days.';

  @override
  String get wisdomQuote13 => 'You can begin again without erasing yesterday.';

  @override
  String get wisdomQuote14 => 'Peace is a practice, not a prize.';

  @override
  String get wisdomQuote15 => 'Let the day be unfinished and still worthy.';

  @override
  String get wisdomQuote16 => 'Breath first. Then the next true thing.';

  @override
  String get wisdomQuote17 => 'The slow path is still a path.';

  @override
  String get wisdomQuote18 => 'Kindness toward yourself is a daily intention.';

  @override
  String get wisdomQuote19 => 'Insight prefers quiet more than urgency.';

  @override
  String get wisdomQuote20 => 'Show up softly. Stay a little longer.';
}
