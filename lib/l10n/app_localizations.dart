import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Slow Journey'**
  String get appName;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Pause · Reflect · Grow'**
  String get tagline;

  /// No description provided for @yourJourney.
  ///
  /// In en, this message translates to:
  /// **'Your Journey'**
  String get yourJourney;

  /// No description provided for @feedDateToday.
  ///
  /// In en, this message translates to:
  /// **'Today · {weekday}'**
  String feedDateToday(String weekday);

  /// No description provided for @feedDateYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday · {weekday}'**
  String feedDateYesterday(String weekday);

  /// No description provided for @yourDailyCycle.
  ///
  /// In en, this message translates to:
  /// **'Your Daily Cycle'**
  String get yourDailyCycle;

  /// No description provided for @cycleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A gentle rhythm for intention, guided by your inner voice.'**
  String get cycleSubtitle;

  /// No description provided for @cycleMorningTitle.
  ///
  /// In en, this message translates to:
  /// **'Morning · Set Intentions'**
  String get cycleMorningTitle;

  /// No description provided for @cycleMorningSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Begin with three quiet aims.'**
  String get cycleMorningSubtitle;

  /// No description provided for @cycleEveningTitle.
  ///
  /// In en, this message translates to:
  /// **'Evening · Reflect & Celebrate'**
  String get cycleEveningTitle;

  /// No description provided for @cycleEveningSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Close the day with learning and gratitude.'**
  String get cycleEveningSubtitle;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @startYourJourney.
  ///
  /// In en, this message translates to:
  /// **'Start your journey'**
  String get startYourJourney;

  /// No description provided for @welcomeProfileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A local profile stays on this device. No account required.'**
  String get welcomeProfileSubtitle;

  /// No description provided for @hintYourName.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get hintYourName;

  /// No description provided for @hintEmailOptional.
  ///
  /// In en, this message translates to:
  /// **'Email (optional)'**
  String get hintEmailOptional;

  /// No description provided for @hintBirthdayOptional.
  ///
  /// In en, this message translates to:
  /// **'Birthday (optional)'**
  String get hintBirthdayOptional;

  /// No description provided for @begin.
  ///
  /// In en, this message translates to:
  /// **'Begin'**
  String get begin;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get saving;

  /// No description provided for @pinLaterHint.
  ///
  /// In en, this message translates to:
  /// **'You can add a PIN later in Setup. Everything stays offline.'**
  String get pinLaterHint;

  /// No description provided for @morningIntentions.
  ///
  /// In en, this message translates to:
  /// **'Morning Intentions'**
  String get morningIntentions;

  /// No description provided for @intentionTodayTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Intentions'**
  String get intentionTodayTitle;

  /// No description provided for @greetingFriend.
  ///
  /// In en, this message translates to:
  /// **'friend'**
  String get greetingFriend;

  /// No description provided for @goodMorningName.
  ///
  /// In en, this message translates to:
  /// **'Good morning, {name}'**
  String goodMorningName(String name);

  /// No description provided for @goodAfternoonName.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon, {name}'**
  String goodAfternoonName(String name);

  /// No description provided for @goodEveningName.
  ///
  /// In en, this message translates to:
  /// **'Good evening, {name}'**
  String goodEveningName(String name);

  /// No description provided for @morningFraming.
  ///
  /// In en, this message translates to:
  /// **'Welcome the day with stillness. Focus your energy on three intentions to guide your journey today.'**
  String get morningFraming;

  /// No description provided for @top3Intentions.
  ///
  /// In en, this message translates to:
  /// **'Top 3 Intentions'**
  String get top3Intentions;

  /// No description provided for @filledOfThree.
  ///
  /// In en, this message translates to:
  /// **'{count} OF 3'**
  String filledOfThree(int count);

  /// No description provided for @intentionHintBreath.
  ///
  /// In en, this message translates to:
  /// **'Focus on breathing…'**
  String get intentionHintBreath;

  /// No description provided for @intentionHintDraft.
  ///
  /// In en, this message translates to:
  /// **'Finish project draft…'**
  String get intentionHintDraft;

  /// No description provided for @intentionHintWalk.
  ///
  /// In en, this message translates to:
  /// **'Evening walk…'**
  String get intentionHintWalk;

  /// No description provided for @setMyDay.
  ///
  /// In en, this message translates to:
  /// **'Set My Day'**
  String get setMyDay;

  /// No description provided for @setIntentionsLater.
  ///
  /// In en, this message translates to:
  /// **'I\'ll set them in the planner'**
  String get setIntentionsLater;

  /// No description provided for @editIntentions.
  ///
  /// In en, this message translates to:
  /// **'Edit intentions'**
  String get editIntentions;

  /// No description provided for @honoredOfThree.
  ///
  /// In en, this message translates to:
  /// **'{count} of {total} honored'**
  String honoredOfThree(int count, int total);

  /// No description provided for @nextSetIntentionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Begin with three quiet aims'**
  String get nextSetIntentionsTitle;

  /// No description provided for @nextSetIntentionsBody.
  ///
  /// In en, this message translates to:
  /// **'Name what matters today. Three is enough.'**
  String get nextSetIntentionsBody;

  /// No description provided for @nextLiveDayTitle.
  ///
  /// In en, this message translates to:
  /// **'Live what you named'**
  String get nextLiveDayTitle;

  /// No description provided for @nextLiveDayBody.
  ///
  /// In en, this message translates to:
  /// **'Tick an intention when you have honored it. Nothing is lost if you leave some open.'**
  String get nextLiveDayBody;

  /// No description provided for @nextCloseDayTitle.
  ///
  /// In en, this message translates to:
  /// **'Close the day with kindness'**
  String get nextCloseDayTitle;

  /// No description provided for @nextCloseDayBody.
  ///
  /// In en, this message translates to:
  /// **'A short reflection is how this day becomes part of your journey.'**
  String get nextCloseDayBody;

  /// No description provided for @nextRestTitle.
  ///
  /// In en, this message translates to:
  /// **'This day is complete'**
  String get nextRestTitle;

  /// No description provided for @nextRestBody.
  ///
  /// In en, this message translates to:
  /// **'Rest. You can reopen the reflection anytime.'**
  String get nextRestBody;

  /// No description provided for @nextFutureTitle.
  ///
  /// In en, this message translates to:
  /// **'This day has not arrived'**
  String get nextFutureTitle;

  /// No description provided for @nextFutureBody.
  ///
  /// In en, this message translates to:
  /// **'Come back when it does. There is nothing to prepare here yet.'**
  String get nextFutureBody;

  /// No description provided for @nextPastTitle.
  ///
  /// In en, this message translates to:
  /// **'You can still close this day'**
  String get nextPastTitle;

  /// No description provided for @nextPastBody.
  ///
  /// In en, this message translates to:
  /// **'You can set intentions or write a reflection for this day. A late close still counts.'**
  String get nextPastBody;

  /// No description provided for @reflectionOpensThisEvening.
  ///
  /// In en, this message translates to:
  /// **'Evening reflection opens after 5:00 PM.'**
  String get reflectionOpensThisEvening;

  /// No description provided for @addAPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add a photo'**
  String get addAPhoto;

  /// No description provided for @cropPhoto.
  ///
  /// In en, this message translates to:
  /// **'Crop photo'**
  String get cropPhoto;

  /// No description provided for @cropPhotoDone.
  ///
  /// In en, this message translates to:
  /// **'Crop'**
  String get cropPhotoDone;

  /// No description provided for @viewPhoto.
  ///
  /// In en, this message translates to:
  /// **'View photo'**
  String get viewPhoto;

  /// No description provided for @changePhoto.
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get changePhoto;

  /// No description provided for @completeDayNeedsWords.
  ///
  /// In en, this message translates to:
  /// **'Write a lesson or a win to complete the day.'**
  String get completeDayNeedsWords;

  /// No description provided for @growthEmptyChart.
  ///
  /// In en, this message translates to:
  /// **'Your weekly shape appears after a few evenings.'**
  String get growthEmptyChart;

  /// No description provided for @growthEmptyTags.
  ///
  /// In en, this message translates to:
  /// **'Tags grow from the words you write at night.'**
  String get growthEmptyTags;

  /// No description provided for @growthChartCaption.
  ///
  /// In en, this message translates to:
  /// **'Evenings completed each week'**
  String get growthChartCaption;

  /// No description provided for @growthEveningCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 evening} other{{count} evenings}}'**
  String growthEveningCount(int count);

  /// No description provided for @insightEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your monthly insight will appear after a few evening reflections.'**
  String get insightEmpty;

  /// No description provided for @emptyFeedAction.
  ///
  /// In en, this message translates to:
  /// **'Set today\'s intentions'**
  String get emptyFeedAction;

  /// No description provided for @makeTodayWorthRemembering.
  ///
  /// In en, this message translates to:
  /// **'Make today worth remembering.'**
  String get makeTodayWorthRemembering;

  /// No description provided for @dailyPlanner.
  ///
  /// In en, this message translates to:
  /// **'Daily Planner'**
  String get dailyPlanner;

  /// No description provided for @plannerWeek.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get plannerWeek;

  /// No description provided for @plannerMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get plannerMonth;

  /// No description provided for @plannerPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get plannerPrevious;

  /// No description provided for @plannerNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get plannerNext;

  /// No description provided for @plannerJumpToToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get plannerJumpToToday;

  /// No description provided for @plannerPickDate.
  ///
  /// In en, this message translates to:
  /// **'Choose a date'**
  String get plannerPickDate;

  /// No description provided for @noIntentionsYet.
  ///
  /// In en, this message translates to:
  /// **'No intentions for this day yet.'**
  String get noIntentionsYet;

  /// No description provided for @setIntentions.
  ///
  /// In en, this message translates to:
  /// **'Set intentions'**
  String get setIntentions;

  /// No description provided for @eveningReflection.
  ///
  /// In en, this message translates to:
  /// **'Evening Reflection'**
  String get eveningReflection;

  /// No description provided for @todayCompleteRest.
  ///
  /// In en, this message translates to:
  /// **'Today is complete. Rest well.'**
  String get todayCompleteRest;

  /// No description provided for @waitingEvening.
  ///
  /// In en, this message translates to:
  /// **'Waiting for your evening reflection...'**
  String get waitingEvening;

  /// No description provided for @viewReflection.
  ///
  /// In en, this message translates to:
  /// **'View reflection'**
  String get viewReflection;

  /// No description provided for @startReflection.
  ///
  /// In en, this message translates to:
  /// **'Start Reflection'**
  String get startReflection;

  /// No description provided for @todaysWisdom.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Wisdom'**
  String get todaysWisdom;

  /// No description provided for @reflection.
  ///
  /// In en, this message translates to:
  /// **'Reflection'**
  String get reflection;

  /// No description provided for @eveningRitual.
  ///
  /// In en, this message translates to:
  /// **'Evening Ritual'**
  String get eveningRitual;

  /// No description provided for @restYourMind.
  ///
  /// In en, this message translates to:
  /// **'Rest your mind.'**
  String get restYourMind;

  /// No description provided for @restSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Take a gentle look back at your journey today and find peace in your progress.'**
  String get restSubtitle;

  /// No description provided for @optionalDayTitle.
  ///
  /// In en, this message translates to:
  /// **'Optional title for this day'**
  String get optionalDayTitle;

  /// No description provided for @whatDidILearn.
  ///
  /// In en, this message translates to:
  /// **'What did I learn?'**
  String get whatDidILearn;

  /// No description provided for @learnHint.
  ///
  /// In en, this message translates to:
  /// **'A new insight or a small lesson...'**
  String get learnHint;

  /// No description provided for @celebrationsWins.
  ///
  /// In en, this message translates to:
  /// **'Celebrations & Wins'**
  String get celebrationsWins;

  /// No description provided for @winsHint.
  ///
  /// In en, this message translates to:
  /// **'What moment made you feel proud today?'**
  String get winsHint;

  /// No description provided for @gratitudeScore.
  ///
  /// In en, this message translates to:
  /// **'Daily Gratitude Score'**
  String get gratitudeScore;

  /// No description provided for @gratitudeSemantics.
  ///
  /// In en, this message translates to:
  /// **'Daily gratitude score'**
  String get gratitudeSemantics;

  /// No description provided for @gratitudeOptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Gratitude {label}, {score} of 4'**
  String gratitudeOptionLabel(String label, int score);

  /// No description provided for @gratitudeTender.
  ///
  /// In en, this message translates to:
  /// **'Tender'**
  String get gratitudeTender;

  /// No description provided for @gratitudeSteady.
  ///
  /// In en, this message translates to:
  /// **'Steady'**
  String get gratitudeSteady;

  /// No description provided for @gratitudeGrateful.
  ///
  /// In en, this message translates to:
  /// **'Grateful'**
  String get gratitudeGrateful;

  /// No description provided for @gratitudeGlowing.
  ///
  /// In en, this message translates to:
  /// **'Glowing'**
  String get gratitudeGlowing;

  /// No description provided for @completeDay.
  ///
  /// In en, this message translates to:
  /// **'Complete Day'**
  String get completeDay;

  /// No description provided for @reflectionThemes.
  ///
  /// In en, this message translates to:
  /// **'Themes'**
  String get reflectionThemes;

  /// No description provided for @reflectionThemesHint.
  ///
  /// In en, this message translates to:
  /// **'Start with the presets. Tap to keep suggestions, reuse earlier evenings, or add a theme of your own.'**
  String get reflectionThemesHint;

  /// No description provided for @reflectionAddTheme.
  ///
  /// In en, this message translates to:
  /// **'Add theme'**
  String get reflectionAddTheme;

  /// No description provided for @reflectionAddThemeHint.
  ///
  /// In en, this message translates to:
  /// **'A short name, like Family or Craft'**
  String get reflectionAddThemeHint;

  /// No description provided for @reflectionAddThemeConfirm.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get reflectionAddThemeConfirm;

  /// No description provided for @reflectionAddThemeCancel.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get reflectionAddThemeCancel;

  /// No description provided for @dayComplete.
  ///
  /// In en, this message translates to:
  /// **'Day complete'**
  String get dayComplete;

  /// No description provided for @consistentForDays.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Consistent for 1 day · Well done} other{Consistent for {count} days · Well done}}'**
  String consistentForDays(int count);

  /// No description provided for @consistentForDaysFooter.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Consistent for 1 day · Well done} other{Consistent for {count} days · Well done}}'**
  String consistentForDaysFooter(int count);

  /// No description provided for @navFeed.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get navFeed;

  /// No description provided for @navPlanner.
  ///
  /// In en, this message translates to:
  /// **'Planner'**
  String get navPlanner;

  /// No description provided for @navGrowth.
  ///
  /// In en, this message translates to:
  /// **'Growth'**
  String get navGrowth;

  /// No description provided for @navSetup.
  ///
  /// In en, this message translates to:
  /// **'Setup'**
  String get navSetup;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBack;

  /// No description provided for @welcomeBackName.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, {name}'**
  String welcomeBackName(String name);

  /// No description provided for @enterLocalPin.
  ///
  /// In en, this message translates to:
  /// **'Enter your four-digit PIN to continue.'**
  String get enterLocalPin;

  /// No description provided for @pinUnlockDeviceNote.
  ///
  /// In en, this message translates to:
  /// **'Your PIN stays on this device.'**
  String get pinUnlockDeviceNote;

  /// No description provided for @pinHint.
  ///
  /// In en, this message translates to:
  /// **'PIN'**
  String get pinHint;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @pinDoesNotMatch.
  ///
  /// In en, this message translates to:
  /// **'That PIN does not match. Try again.'**
  String get pinDoesNotMatch;

  /// No description provided for @firstReflectionTonight.
  ///
  /// In en, this message translates to:
  /// **'Your first reflection starts tonight.'**
  String get firstReflectionTonight;

  /// No description provided for @emptyFeedHint.
  ///
  /// In en, this message translates to:
  /// **'Tonight, take a few minutes to notice one lesson and one win.'**
  String get emptyFeedHint;

  /// No description provided for @nDayStreak.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1-day streak} other{{count}-day streak}}'**
  String nDayStreak(int count);

  /// No description provided for @streakShort.
  ///
  /// In en, this message translates to:
  /// **'streak'**
  String get streakShort;

  /// No description provided for @streakBegin.
  ///
  /// In en, this message translates to:
  /// **'start'**
  String get streakBegin;

  /// No description provided for @eveningReflectionFallbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Evening reflection'**
  String get eveningReflectionFallbackTitle;

  /// No description provided for @growthData.
  ///
  /// In en, this message translates to:
  /// **'Growth'**
  String get growthData;

  /// No description provided for @statReflections.
  ///
  /// In en, this message translates to:
  /// **'Reflections'**
  String get statReflections;

  /// No description provided for @statDayStreak.
  ///
  /// In en, this message translates to:
  /// **'Day streak'**
  String get statDayStreak;

  /// No description provided for @statLongest.
  ///
  /// In en, this message translates to:
  /// **'Longest'**
  String get statLongest;

  /// No description provided for @growthOverview.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get growthOverview;

  /// No description provided for @keyLearnings.
  ///
  /// In en, this message translates to:
  /// **'Key Learnings'**
  String get keyLearnings;

  /// No description provided for @monthlyInsight.
  ///
  /// In en, this message translates to:
  /// **'Monthly Insight'**
  String get monthlyInsight;

  /// No description provided for @insightLongStreak.
  ///
  /// In en, this message translates to:
  /// **'You\'re most consistent with {habit}. This quiet streak suggests you find more calm when you return to yourself each evening.'**
  String insightLongStreak(String habit);

  /// No description provided for @insightDefault.
  ///
  /// In en, this message translates to:
  /// **'You\'re most consistent with {habit}. This suggests you find more calm in the second half of the month.'**
  String insightDefault(String habit);

  /// No description provided for @growthTagCount.
  ///
  /// In en, this message translates to:
  /// **'{tag} · {count}'**
  String growthTagCount(String tag, int count);

  /// No description provided for @setup.
  ///
  /// In en, this message translates to:
  /// **'Setup'**
  String get setup;

  /// No description provided for @localProfile.
  ///
  /// In en, this message translates to:
  /// **'Local profile'**
  String get localProfile;

  /// No description provided for @onThisDeviceOnly.
  ///
  /// In en, this message translates to:
  /// **'On this device only'**
  String get onThisDeviceOnly;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Morning start and evening reflection invitations'**
  String get notificationsSubtitle;

  /// No description provided for @mutedDark.
  ///
  /// In en, this message translates to:
  /// **'Muted Dark'**
  String get mutedDark;

  /// No description provided for @mutedDarkSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A calmer night palette'**
  String get mutedDarkSubtitle;

  /// No description provided for @manageProfile.
  ///
  /// In en, this message translates to:
  /// **'Manage Profile'**
  String get manageProfile;

  /// No description provided for @memberSince.
  ///
  /// In en, this message translates to:
  /// **'Member since'**
  String get memberSince;

  /// No description provided for @profileSection.
  ///
  /// In en, this message translates to:
  /// **'Your profile'**
  String get profileSection;

  /// No description provided for @securitySection.
  ///
  /// In en, this message translates to:
  /// **'PIN and auto-lock'**
  String get securitySection;

  /// No description provided for @fieldName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get fieldName;

  /// No description provided for @fieldEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get fieldEmail;

  /// No description provided for @fieldBirthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get fieldBirthday;

  /// No description provided for @hintName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get hintName;

  /// No description provided for @hintEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get hintEmail;

  /// No description provided for @saveProfile.
  ///
  /// In en, this message translates to:
  /// **'Save profile'**
  String get saveProfile;

  /// No description provided for @savedOnThisDevice.
  ///
  /// In en, this message translates to:
  /// **'Saved on this device'**
  String get savedOnThisDevice;

  /// No description provided for @localPin.
  ///
  /// In en, this message translates to:
  /// **'Local PIN'**
  String get localPin;

  /// No description provided for @hintOptionalPin.
  ///
  /// In en, this message translates to:
  /// **'Enter four digits to save a PIN.'**
  String get hintOptionalPin;

  /// No description provided for @hintChangePin.
  ///
  /// In en, this message translates to:
  /// **'Enter four digits to change your PIN.'**
  String get hintChangePin;

  /// No description provided for @setPin.
  ///
  /// In en, this message translates to:
  /// **'Set PIN'**
  String get setPin;

  /// No description provided for @clearPin.
  ///
  /// In en, this message translates to:
  /// **'Clear PIN'**
  String get clearPin;

  /// No description provided for @removePinTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove PIN?'**
  String get removePinTitle;

  /// No description provided for @removePinBody.
  ///
  /// In en, this message translates to:
  /// **'Slow Journey will stay unlocked on this device. Auto-lock turns off.'**
  String get removePinBody;

  /// No description provided for @removeAction.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get removeAction;

  /// No description provided for @pinMustBeFourDigits.
  ///
  /// In en, this message translates to:
  /// **'Use four digits for your PIN.'**
  String get pinMustBeFourDigits;

  /// No description provided for @pinEntrySemantics.
  ///
  /// In en, this message translates to:
  /// **'Four-digit PIN'**
  String get pinEntrySemantics;

  /// No description provided for @pinKeypadBackspace.
  ///
  /// In en, this message translates to:
  /// **'Delete last digit'**
  String get pinKeypadBackspace;

  /// No description provided for @pinSaved.
  ///
  /// In en, this message translates to:
  /// **'PIN saved. Slow Journey will ask for it when you open the app again.'**
  String get pinSaved;

  /// No description provided for @pinCleared.
  ///
  /// In en, this message translates to:
  /// **'PIN removed. The app will stay open on this device.'**
  String get pinCleared;

  /// No description provided for @pinIsSet.
  ///
  /// In en, this message translates to:
  /// **'A PIN is saved on this device.'**
  String get pinIsSet;

  /// No description provided for @pinNotSet.
  ///
  /// In en, this message translates to:
  /// **'No PIN yet. Set one to lock Slow Journey when you open the app again.'**
  String get pinNotSet;

  /// No description provided for @autoLock.
  ///
  /// In en, this message translates to:
  /// **'Auto-lock'**
  String get autoLock;

  /// No description provided for @autoLockSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Lock after {minutes} minutes away from the app'**
  String autoLockSubtitle(int minutes);

  /// No description provided for @autoLockNeedsPin.
  ///
  /// In en, this message translates to:
  /// **'Set a PIN first to use auto-lock.'**
  String get autoLockNeedsPin;

  /// No description provided for @autoLockIdleLabel.
  ///
  /// In en, this message translates to:
  /// **'Away for'**
  String get autoLockIdleLabel;

  /// No description provided for @autoLockAfterMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String autoLockAfterMinutes(int minutes);

  /// No description provided for @wipeLocalData.
  ///
  /// In en, this message translates to:
  /// **'Wipe local data'**
  String get wipeLocalData;

  /// No description provided for @wipeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Removes reflections, intentions, and your profile from this device.'**
  String get wipeSubtitle;

  /// No description provided for @wipeThisDevice.
  ///
  /// In en, this message translates to:
  /// **'Wipe this device?'**
  String get wipeThisDevice;

  /// No description provided for @wipeWarning.
  ///
  /// In en, this message translates to:
  /// **'Reflections, intentions, and counters will be removed. This cannot be undone.'**
  String get wipeWarning;

  /// No description provided for @keep.
  ///
  /// In en, this message translates to:
  /// **'Keep'**
  String get keep;

  /// No description provided for @wipe.
  ///
  /// In en, this message translates to:
  /// **'Wipe'**
  String get wipe;

  /// No description provided for @planMyDay.
  ///
  /// In en, this message translates to:
  /// **'Plan My Day'**
  String get planMyDay;

  /// No description provided for @reflectCelebrate.
  ///
  /// In en, this message translates to:
  /// **'Reflect & Celebrate'**
  String get reflectCelebrate;

  /// No description provided for @changeTime.
  ///
  /// In en, this message translates to:
  /// **'Change time'**
  String get changeTime;

  /// No description provided for @remindersInvitation.
  ///
  /// In en, this message translates to:
  /// **'Reminders stay on this device. They are invitations, never nags.'**
  String get remindersInvitation;

  /// No description provided for @notificationsOsBlocked.
  ///
  /// In en, this message translates to:
  /// **'Notifications are turned off for Slow Journey. Enable them in system Settings to receive reminders.'**
  String get notificationsOsBlocked;

  /// No description provided for @notificationMorningTitle.
  ///
  /// In en, this message translates to:
  /// **'Plan your day'**
  String get notificationMorningTitle;

  /// No description provided for @notificationMorningBody.
  ///
  /// In en, this message translates to:
  /// **'A quiet moment to set three intentions.'**
  String get notificationMorningBody;

  /// No description provided for @notificationMorning02Title.
  ///
  /// In en, this message translates to:
  /// **'Begin softly'**
  String get notificationMorning02Title;

  /// No description provided for @notificationMorning02Body.
  ///
  /// In en, this message translates to:
  /// **'You do not need a perfect plan. Three kind aims will do.'**
  String get notificationMorning02Body;

  /// No description provided for @notificationMorning03Title.
  ///
  /// In en, this message translates to:
  /// **'Three quiet aims'**
  String get notificationMorning03Title;

  /// No description provided for @notificationMorning03Body.
  ///
  /// In en, this message translates to:
  /// **'Name what matters this morning. Let the rest wait.'**
  String get notificationMorning03Body;

  /// No description provided for @notificationMorning04Title.
  ///
  /// In en, this message translates to:
  /// **'Start with still'**
  String get notificationMorning04Title;

  /// No description provided for @notificationMorning04Body.
  ///
  /// In en, this message translates to:
  /// **'One breath, then choose how you want to show up today.'**
  String get notificationMorning04Body;

  /// No description provided for @notificationMorning05Title.
  ///
  /// In en, this message translates to:
  /// **'A new page'**
  String get notificationMorning05Title;

  /// No description provided for @notificationMorning05Body.
  ///
  /// In en, this message translates to:
  /// **'Yesterday is closed. Set your intentions for this day.'**
  String get notificationMorning05Body;

  /// No description provided for @notificationMorning06Title.
  ///
  /// In en, this message translates to:
  /// **'Show up kindly'**
  String get notificationMorning06Title;

  /// No description provided for @notificationMorning06Body.
  ///
  /// In en, this message translates to:
  /// **'Motivation can be gentle. Open Planner and plant three aims.'**
  String get notificationMorning06Body;

  /// No description provided for @notificationMorning07Title.
  ///
  /// In en, this message translates to:
  /// **'Plant one tree'**
  String get notificationMorning07Title;

  /// No description provided for @notificationMorning07Body.
  ///
  /// In en, this message translates to:
  /// **'You do not have to finish the forest. Begin with three small intentions.'**
  String get notificationMorning07Body;

  /// No description provided for @notificationMorning08Title.
  ///
  /// In en, this message translates to:
  /// **'Morning light'**
  String get notificationMorning08Title;

  /// No description provided for @notificationMorning08Body.
  ///
  /// In en, this message translates to:
  /// **'A calm start still counts as courage. Set your day.'**
  String get notificationMorning08Body;

  /// No description provided for @notificationMorning09Title.
  ///
  /// In en, this message translates to:
  /// **'Name what matters'**
  String get notificationMorning09Title;

  /// No description provided for @notificationMorning09Body.
  ///
  /// In en, this message translates to:
  /// **'Write three intentions before the noise of the day arrives.'**
  String get notificationMorning09Body;

  /// No description provided for @notificationMorning10Title.
  ///
  /// In en, this message translates to:
  /// **'Breathe, then begin'**
  String get notificationMorning10Title;

  /// No description provided for @notificationMorning10Body.
  ///
  /// In en, this message translates to:
  /// **'Stillness first. Then the next true thing on your list.'**
  String get notificationMorning10Body;

  /// No description provided for @notificationMorning11Title.
  ///
  /// In en, this message translates to:
  /// **'Slow is still motion'**
  String get notificationMorning11Title;

  /// No description provided for @notificationMorning11Body.
  ///
  /// In en, this message translates to:
  /// **'An unhurried morning can hold a whole worthy day.'**
  String get notificationMorning11Body;

  /// No description provided for @notificationMorning12Title.
  ///
  /// In en, this message translates to:
  /// **'Welcome this morning'**
  String get notificationMorning12Title;

  /// No description provided for @notificationMorning12Body.
  ///
  /// In en, this message translates to:
  /// **'Arrive before you rush. Choose three aims with care.'**
  String get notificationMorning12Body;

  /// No description provided for @notificationMorning13Title.
  ///
  /// In en, this message translates to:
  /// **'Intention over hurry'**
  String get notificationMorning13Title;

  /// No description provided for @notificationMorning13Body.
  ///
  /// In en, this message translates to:
  /// **'Hustle can wait. Set a kind pace for the hours ahead.'**
  String get notificationMorning13Body;

  /// No description provided for @notificationMorning14Title.
  ///
  /// In en, this message translates to:
  /// **'Make room for three'**
  String get notificationMorning14Title;

  /// No description provided for @notificationMorning14Body.
  ///
  /// In en, this message translates to:
  /// **'Three intentions are enough. Leave space to live them.'**
  String get notificationMorning14Body;

  /// No description provided for @notificationMorning15Title.
  ///
  /// In en, this message translates to:
  /// **'A gentle start'**
  String get notificationMorning15Title;

  /// No description provided for @notificationMorning15Body.
  ///
  /// In en, this message translates to:
  /// **'Motivation does not have to shout. Open the day softly.'**
  String get notificationMorning15Body;

  /// No description provided for @notificationMorning16Title.
  ///
  /// In en, this message translates to:
  /// **'Today can be small'**
  String get notificationMorning16Title;

  /// No description provided for @notificationMorning16Body.
  ///
  /// In en, this message translates to:
  /// **'Small, clear aims still move a life. Write yours now.'**
  String get notificationMorning16Body;

  /// No description provided for @notificationMorning17Title.
  ///
  /// In en, this message translates to:
  /// **'Open the day'**
  String get notificationMorning17Title;

  /// No description provided for @notificationMorning17Body.
  ///
  /// In en, this message translates to:
  /// **'The morning is an invitation. Set My Day when you are ready.'**
  String get notificationMorning17Body;

  /// No description provided for @notificationMorning18Title.
  ///
  /// In en, this message translates to:
  /// **'Courage, quietly'**
  String get notificationMorning18Title;

  /// No description provided for @notificationMorning18Body.
  ///
  /// In en, this message translates to:
  /// **'Showing up is already a beginning. Name three intentions.'**
  String get notificationMorning18Body;

  /// No description provided for @notificationMorning19Title.
  ///
  /// In en, this message translates to:
  /// **'Set your compass'**
  String get notificationMorning19Title;

  /// No description provided for @notificationMorning19Body.
  ///
  /// In en, this message translates to:
  /// **'Point the day toward what you value. Three notes will steer you.'**
  String get notificationMorning19Body;

  /// No description provided for @notificationMorning20Title.
  ///
  /// In en, this message translates to:
  /// **'First light'**
  String get notificationMorning20Title;

  /// No description provided for @notificationMorning20Body.
  ///
  /// In en, this message translates to:
  /// **'Before the lists pile up, choose how you want this day to feel.'**
  String get notificationMorning20Body;

  /// No description provided for @notificationMorning21Title.
  ///
  /// In en, this message translates to:
  /// **'Arrive before you rush'**
  String get notificationMorning21Title;

  /// No description provided for @notificationMorning21Body.
  ///
  /// In en, this message translates to:
  /// **'Give yourself a minute. Then plant today’s three aims.'**
  String get notificationMorning21Body;

  /// No description provided for @notificationMorning22Title.
  ///
  /// In en, this message translates to:
  /// **'Soft focus'**
  String get notificationMorning22Title;

  /// No description provided for @notificationMorning22Body.
  ///
  /// In en, this message translates to:
  /// **'Clarity loves a quiet start. Write what you will honor today.'**
  String get notificationMorning22Body;

  /// No description provided for @notificationMorning23Title.
  ///
  /// In en, this message translates to:
  /// **'Begin again'**
  String get notificationMorning23Title;

  /// No description provided for @notificationMorning23Body.
  ///
  /// In en, this message translates to:
  /// **'You can start this morning without erasing yesterday.'**
  String get notificationMorning23Body;

  /// No description provided for @notificationMorning24Title.
  ///
  /// In en, this message translates to:
  /// **'The day is waiting'**
  String get notificationMorning24Title;

  /// No description provided for @notificationMorning24Body.
  ///
  /// In en, this message translates to:
  /// **'It does not need a grand speech. It needs three honest intentions.'**
  String get notificationMorning24Body;

  /// No description provided for @notificationMorning25Title.
  ///
  /// In en, this message translates to:
  /// **'Choose a kind pace'**
  String get notificationMorning25Title;

  /// No description provided for @notificationMorning25Body.
  ///
  /// In en, this message translates to:
  /// **'Motivation can be a walk, not a sprint. Set your day gently.'**
  String get notificationMorning25Body;

  /// No description provided for @notificationMorning26Title.
  ///
  /// In en, this message translates to:
  /// **'Wake the garden'**
  String get notificationMorning26Title;

  /// No description provided for @notificationMorning26Body.
  ///
  /// In en, this message translates to:
  /// **'Your attention is a garden. Water what you want to grow today.'**
  String get notificationMorning26Body;

  /// No description provided for @notificationMorning27Title.
  ///
  /// In en, this message translates to:
  /// **'Three is enough'**
  String get notificationMorning27Title;

  /// No description provided for @notificationMorning27Body.
  ///
  /// In en, this message translates to:
  /// **'Do not wait for a longer list. Three aims will carry the morning.'**
  String get notificationMorning27Body;

  /// No description provided for @notificationMorning28Title.
  ///
  /// In en, this message translates to:
  /// **'Meet the morning'**
  String get notificationMorning28Title;

  /// No description provided for @notificationMorning28Body.
  ///
  /// In en, this message translates to:
  /// **'Say hello to the day. Then name how you will walk through it.'**
  String get notificationMorning28Body;

  /// No description provided for @notificationMorning29Title.
  ///
  /// In en, this message translates to:
  /// **'A calm first step'**
  String get notificationMorning29Title;

  /// No description provided for @notificationMorning29Body.
  ///
  /// In en, this message translates to:
  /// **'Start where you are. Open Planner and set three intentions.'**
  String get notificationMorning29Body;

  /// No description provided for @notificationMorning30Title.
  ///
  /// In en, this message translates to:
  /// **'Let today be true'**
  String get notificationMorning30Title;

  /// No description provided for @notificationMorning30Body.
  ///
  /// In en, this message translates to:
  /// **'Not impressive. True. Write the three things that matter.'**
  String get notificationMorning30Body;

  /// No description provided for @notificationMorning31Title.
  ///
  /// In en, this message translates to:
  /// **'Rise without hurry'**
  String get notificationMorning31Title;

  /// No description provided for @notificationMorning31Body.
  ///
  /// In en, this message translates to:
  /// **'There is time to begin well. Set a gentle plan for today.'**
  String get notificationMorning31Body;

  /// No description provided for @notificationMorning32Title.
  ///
  /// In en, this message translates to:
  /// **'Offer the day a name'**
  String get notificationMorning32Title;

  /// No description provided for @notificationMorning32Body.
  ///
  /// In en, this message translates to:
  /// **'Give this morning a direction. Three intentions are a good name.'**
  String get notificationMorning32Body;

  /// No description provided for @notificationMorning33Title.
  ///
  /// In en, this message translates to:
  /// **'Stillness, then aim'**
  String get notificationMorning33Title;

  /// No description provided for @notificationMorning33Body.
  ///
  /// In en, this message translates to:
  /// **'Pause long enough to hear what you already know. Then begin.'**
  String get notificationMorning33Body;

  /// No description provided for @notificationMorning34Title.
  ///
  /// In en, this message translates to:
  /// **'Your attention, please'**
  String get notificationMorning34Title;

  /// No description provided for @notificationMorning34Body.
  ///
  /// In en, this message translates to:
  /// **'Where you look, the day follows. Choose three worthy places.'**
  String get notificationMorning34Body;

  /// No description provided for @notificationMorning35Title.
  ///
  /// In en, this message translates to:
  /// **'Start where you are'**
  String get notificationMorning35Title;

  /// No description provided for @notificationMorning35Body.
  ///
  /// In en, this message translates to:
  /// **'No perfect mood required. Set My Day from this exact morning.'**
  String get notificationMorning35Body;

  /// No description provided for @notificationMorning36Title.
  ///
  /// In en, this message translates to:
  /// **'Morning invitation'**
  String get notificationMorning36Title;

  /// No description provided for @notificationMorning36Body.
  ///
  /// In en, this message translates to:
  /// **'Come as you are. Plant three aims and let the day unfold.'**
  String get notificationMorning36Body;

  /// No description provided for @notificationMorning37Title.
  ///
  /// In en, this message translates to:
  /// **'Unfold slowly'**
  String get notificationMorning37Title;

  /// No description provided for @notificationMorning37Body.
  ///
  /// In en, this message translates to:
  /// **'A slow start is still a start. Write your intentions when ready.'**
  String get notificationMorning37Body;

  /// No description provided for @notificationMorning38Title.
  ///
  /// In en, this message translates to:
  /// **'A worthy beginning'**
  String get notificationMorning38Title;

  /// No description provided for @notificationMorning38Body.
  ///
  /// In en, this message translates to:
  /// **'Make today worth remembering, one quiet intention at a time.'**
  String get notificationMorning38Body;

  /// No description provided for @notificationMorning39Title.
  ///
  /// In en, this message translates to:
  /// **'Clear a little space'**
  String get notificationMorning39Title;

  /// No description provided for @notificationMorning39Body.
  ///
  /// In en, this message translates to:
  /// **'Leave room for breath. Then choose three things to honor.'**
  String get notificationMorning39Body;

  /// No description provided for @notificationMorning40Title.
  ///
  /// In en, this message translates to:
  /// **'Walk into today'**
  String get notificationMorning40Title;

  /// No description provided for @notificationMorning40Body.
  ///
  /// In en, this message translates to:
  /// **'You do not have to run. Step in with three kind aims.'**
  String get notificationMorning40Body;

  /// No description provided for @notificationEveningTitle.
  ///
  /// In en, this message translates to:
  /// **'Reflect & celebrate'**
  String get notificationEveningTitle;

  /// No description provided for @notificationEveningBody.
  ///
  /// In en, this message translates to:
  /// **'Rest your mind. Look back on the day with kindness.'**
  String get notificationEveningBody;

  /// No description provided for @notificationEvening02Title.
  ///
  /// In en, this message translates to:
  /// **'Close the day'**
  String get notificationEvening02Title;

  /// No description provided for @notificationEvening02Body.
  ///
  /// In en, this message translates to:
  /// **'A short reflection is how this day becomes part of your journey.'**
  String get notificationEvening02Body;

  /// No description provided for @notificationEvening03Title.
  ///
  /// In en, this message translates to:
  /// **'Look back kindly'**
  String get notificationEvening03Title;

  /// No description provided for @notificationEvening03Body.
  ///
  /// In en, this message translates to:
  /// **'Notice what you learned. Let that be enough for tonight.'**
  String get notificationEvening03Body;

  /// No description provided for @notificationEvening04Title.
  ///
  /// In en, this message translates to:
  /// **'Rest your mind'**
  String get notificationEvening04Title;

  /// No description provided for @notificationEvening04Body.
  ///
  /// In en, this message translates to:
  /// **'The day is allowed to be unfinished and still worthy.'**
  String get notificationEvening04Body;

  /// No description provided for @notificationEvening05Title.
  ///
  /// In en, this message translates to:
  /// **'Celebrate the ordinary'**
  String get notificationEvening05Title;

  /// No description provided for @notificationEvening05Body.
  ///
  /// In en, this message translates to:
  /// **'Name a win, even a small one. Ordinary wins build the path.'**
  String get notificationEvening05Body;

  /// No description provided for @notificationEvening06Title.
  ///
  /// In en, this message translates to:
  /// **'Evening stillness'**
  String get notificationEvening06Title;

  /// No description provided for @notificationEvening06Body.
  ///
  /// In en, this message translates to:
  /// **'Pause. Write what you learned and what you are grateful for.'**
  String get notificationEvening06Body;

  /// No description provided for @notificationEvening07Title.
  ///
  /// In en, this message translates to:
  /// **'A gentle review'**
  String get notificationEvening07Title;

  /// No description provided for @notificationEvening07Body.
  ///
  /// In en, this message translates to:
  /// **'No scoreboard. Just a honest look at how you showed up.'**
  String get notificationEvening07Body;

  /// No description provided for @notificationEvening08Title.
  ///
  /// In en, this message translates to:
  /// **'Harvest the day'**
  String get notificationEvening08Title;

  /// No description provided for @notificationEvening08Body.
  ///
  /// In en, this message translates to:
  /// **'Gather one lesson and one celebration before you rest.'**
  String get notificationEvening08Body;

  /// No description provided for @notificationEvening09Title.
  ///
  /// In en, this message translates to:
  /// **'Kindness at dusk'**
  String get notificationEvening09Title;

  /// No description provided for @notificationEvening09Body.
  ///
  /// In en, this message translates to:
  /// **'Speak to yourself the way you would to a friend tonight.'**
  String get notificationEvening09Body;

  /// No description provided for @notificationEvening10Title.
  ///
  /// In en, this message translates to:
  /// **'Let the day land'**
  String get notificationEvening10Title;

  /// No description provided for @notificationEvening10Body.
  ///
  /// In en, this message translates to:
  /// **'Complete the evening ritual so tomorrow can begin lighter.'**
  String get notificationEvening10Body;

  /// No description provided for @notificationEvening11Title.
  ///
  /// In en, this message translates to:
  /// **'Gratitude, then rest'**
  String get notificationEvening11Title;

  /// No description provided for @notificationEvening11Body.
  ///
  /// In en, this message translates to:
  /// **'Choose a gratitude face. Then put the day down.'**
  String get notificationEvening11Body;

  /// No description provided for @notificationEvening12Title.
  ///
  /// In en, this message translates to:
  /// **'What did you learn?'**
  String get notificationEvening12Title;

  /// No description provided for @notificationEvening12Body.
  ///
  /// In en, this message translates to:
  /// **'One sentence is enough. Insight prefers quiet more than urgency.'**
  String get notificationEvening12Body;

  /// No description provided for @notificationEvening13Title.
  ///
  /// In en, this message translates to:
  /// **'Honor what went well'**
  String get notificationEvening13Title;

  /// No description provided for @notificationEvening13Body.
  ///
  /// In en, this message translates to:
  /// **'Celebrations can be small. Write the one that warmed you.'**
  String get notificationEvening13Body;

  /// No description provided for @notificationEvening14Title.
  ///
  /// In en, this message translates to:
  /// **'Fold the day'**
  String get notificationEvening14Title;

  /// No description provided for @notificationEvening14Body.
  ///
  /// In en, this message translates to:
  /// **'Like a letter. Close it with learning, wins, and rest.'**
  String get notificationEvening14Body;

  /// No description provided for @notificationEvening15Title.
  ///
  /// In en, this message translates to:
  /// **'Evening invitation'**
  String get notificationEvening15Title;

  /// No description provided for @notificationEvening15Body.
  ///
  /// In en, this message translates to:
  /// **'Come back to yourself. Reflect & celebrate when you are ready.'**
  String get notificationEvening15Body;

  /// No description provided for @notificationEvening16Title.
  ///
  /// In en, this message translates to:
  /// **'The light is lowering'**
  String get notificationEvening16Title;

  /// No description provided for @notificationEvening16Body.
  ///
  /// In en, this message translates to:
  /// **'A good time to look back without rushing the next thing.'**
  String get notificationEvening16Body;

  /// No description provided for @notificationEvening17Title.
  ///
  /// In en, this message translates to:
  /// **'Be proud of showing up'**
  String get notificationEvening17Title;

  /// No description provided for @notificationEvening17Body.
  ///
  /// In en, this message translates to:
  /// **'If you began, that counts. Write the rest of the story tonight.'**
  String get notificationEvening17Body;

  /// No description provided for @notificationEvening18Title.
  ///
  /// In en, this message translates to:
  /// **'Release the unfinished'**
  String get notificationEvening18Title;

  /// No description provided for @notificationEvening18Body.
  ///
  /// In en, this message translates to:
  /// **'Leave open loops on the page. Rest is part of the work.'**
  String get notificationEvening18Body;

  /// No description provided for @notificationEvening19Title.
  ///
  /// In en, this message translates to:
  /// **'A quiet harvest'**
  String get notificationEvening19Title;

  /// No description provided for @notificationEvening19Body.
  ///
  /// In en, this message translates to:
  /// **'Collect one lesson. Thank one moment. Then stop.'**
  String get notificationEvening19Body;

  /// No description provided for @notificationEvening20Title.
  ///
  /// In en, this message translates to:
  /// **'Tonight is for kindness'**
  String get notificationEvening20Title;

  /// No description provided for @notificationEvening20Body.
  ///
  /// In en, this message translates to:
  /// **'Review the day as a gardener, not a judge.'**
  String get notificationEvening20Body;

  /// No description provided for @notificationEvening21Title.
  ///
  /// In en, this message translates to:
  /// **'Write it down'**
  String get notificationEvening21Title;

  /// No description provided for @notificationEvening21Body.
  ///
  /// In en, this message translates to:
  /// **'Memory is tender. A few lines will keep today’s growth.'**
  String get notificationEvening21Body;

  /// No description provided for @notificationEvening22Title.
  ///
  /// In en, this message translates to:
  /// **'Come home to the day'**
  String get notificationEvening22Title;

  /// No description provided for @notificationEvening22Body.
  ///
  /// In en, this message translates to:
  /// **'You lived it. Now give it a closing: learn, celebrate, rest.'**
  String get notificationEvening22Body;

  /// No description provided for @notificationEvening23Title.
  ///
  /// In en, this message translates to:
  /// **'Softer than a summary'**
  String get notificationEvening23Title;

  /// No description provided for @notificationEvening23Body.
  ///
  /// In en, this message translates to:
  /// **'You do not need a report. You need a honest evening look.'**
  String get notificationEvening23Body;

  /// No description provided for @notificationEvening24Title.
  ///
  /// In en, this message translates to:
  /// **'Save a seed'**
  String get notificationEvening24Title;

  /// No description provided for @notificationEvening24Body.
  ///
  /// In en, this message translates to:
  /// **'Tonight’s lesson is tomorrow’s soil. Write a little of it.'**
  String get notificationEvening24Body;

  /// No description provided for @notificationEvening25Title.
  ///
  /// In en, this message translates to:
  /// **'Dim the noise'**
  String get notificationEvening25Title;

  /// No description provided for @notificationEvening25Body.
  ///
  /// In en, this message translates to:
  /// **'One reflection is enough light. Close the day with it.'**
  String get notificationEvening25Body;

  /// No description provided for @notificationEvening26Title.
  ///
  /// In en, this message translates to:
  /// **'You can rest now'**
  String get notificationEvening26Title;

  /// No description provided for @notificationEvening26Body.
  ///
  /// In en, this message translates to:
  /// **'First, a kind look back. Then let the night hold you.'**
  String get notificationEvening26Body;

  /// No description provided for @notificationEvening27Title.
  ///
  /// In en, this message translates to:
  /// **'Mark the path'**
  String get notificationEvening27Title;

  /// No description provided for @notificationEvening27Body.
  ///
  /// In en, this message translates to:
  /// **'A completed evening keeps the streak of returning, not perfection.'**
  String get notificationEvening27Body;

  /// No description provided for @notificationEvening28Title.
  ///
  /// In en, this message translates to:
  /// **'Thank the hours'**
  String get notificationEvening28Title;

  /// No description provided for @notificationEvening28Body.
  ///
  /// In en, this message translates to:
  /// **'Even mixed days carried something. Name a win and a lesson.'**
  String get notificationEvening28Body;

  /// No description provided for @notificationEvening29Title.
  ///
  /// In en, this message translates to:
  /// **'Evening compass'**
  String get notificationEvening29Title;

  /// No description provided for @notificationEvening29Body.
  ///
  /// In en, this message translates to:
  /// **'Where did you grow? Point to it, then put the compass down.'**
  String get notificationEvening29Body;

  /// No description provided for @notificationEvening30Title.
  ///
  /// In en, this message translates to:
  /// **'A late close still counts'**
  String get notificationEvening30Title;

  /// No description provided for @notificationEvening30Body.
  ///
  /// In en, this message translates to:
  /// **'If the day ran long, you can still reflect with kindness.'**
  String get notificationEvening30Body;

  /// No description provided for @notificationEvening31Title.
  ///
  /// In en, this message translates to:
  /// **'Sit with what was'**
  String get notificationEvening31Title;

  /// No description provided for @notificationEvening31Body.
  ///
  /// In en, this message translates to:
  /// **'Not what should have been. What was. Then celebrate a piece of it.'**
  String get notificationEvening31Body;

  /// No description provided for @notificationEvening32Title.
  ///
  /// In en, this message translates to:
  /// **'Turn the page'**
  String get notificationEvening32Title;

  /// No description provided for @notificationEvening32Body.
  ///
  /// In en, this message translates to:
  /// **'Reflection is how you turn it. Learning, wins, gratitude, rest.'**
  String get notificationEvening32Body;

  /// No description provided for @notificationEvening33Title.
  ///
  /// In en, this message translates to:
  /// **'Keep the good'**
  String get notificationEvening33Title;

  /// No description provided for @notificationEvening33Body.
  ///
  /// In en, this message translates to:
  /// **'Let the hard things be true. Keep the good in writing tonight.'**
  String get notificationEvening33Body;

  /// No description provided for @notificationEvening34Title.
  ///
  /// In en, this message translates to:
  /// **'Night garden'**
  String get notificationEvening34Title;

  /// No description provided for @notificationEvening34Body.
  ///
  /// In en, this message translates to:
  /// **'Water gratitude. Weed nothing in a hurry. Then sleep.'**
  String get notificationEvening34Body;

  /// No description provided for @notificationEvening35Title.
  ///
  /// In en, this message translates to:
  /// **'Close with peace'**
  String get notificationEvening35Title;

  /// No description provided for @notificationEvening35Body.
  ///
  /// In en, this message translates to:
  /// **'Peace is a practice. A short evening ritual is that practice.'**
  String get notificationEvening35Body;

  /// No description provided for @notificationEvening36Title.
  ///
  /// In en, this message translates to:
  /// **'Your journey, tonight'**
  String get notificationEvening36Title;

  /// No description provided for @notificationEvening36Body.
  ///
  /// In en, this message translates to:
  /// **'Add this day to the path. Open Reflect & Celebrate.'**
  String get notificationEvening36Body;

  /// No description provided for @notificationEvening37Title.
  ///
  /// In en, this message translates to:
  /// **'Enough for today'**
  String get notificationEvening37Title;

  /// No description provided for @notificationEvening37Body.
  ///
  /// In en, this message translates to:
  /// **'You can stop striving. Look back once, then rest well.'**
  String get notificationEvening37Body;

  /// No description provided for @notificationEvening38Title.
  ///
  /// In en, this message translates to:
  /// **'A candle, not a spotlight'**
  String get notificationEvening38Title;

  /// No description provided for @notificationEvening38Body.
  ///
  /// In en, this message translates to:
  /// **'Soft light on the day is enough. Write what you notice.'**
  String get notificationEvening38Body;

  /// No description provided for @notificationEvening39Title.
  ///
  /// In en, this message translates to:
  /// **'Return to yourself'**
  String get notificationEvening39Title;

  /// No description provided for @notificationEvening39Body.
  ///
  /// In en, this message translates to:
  /// **'The world can wait until morning. Close this day with care.'**
  String get notificationEvening39Body;

  /// No description provided for @notificationEvening40Title.
  ///
  /// In en, this message translates to:
  /// **'Good night, almost'**
  String get notificationEvening40Title;

  /// No description provided for @notificationEvening40Body.
  ///
  /// In en, this message translates to:
  /// **'One last kind look at today. Then you are allowed to rest.'**
  String get notificationEvening40Body;

  /// No description provided for @notificationChannelName.
  ///
  /// In en, this message translates to:
  /// **'Daily rhythm'**
  String get notificationChannelName;

  /// No description provided for @notificationChannelDescription.
  ///
  /// In en, this message translates to:
  /// **'Changing morning start and evening reflection invitations'**
  String get notificationChannelDescription;

  /// No description provided for @tagMindfulness.
  ///
  /// In en, this message translates to:
  /// **'Mindfulness'**
  String get tagMindfulness;

  /// No description provided for @tagFocus.
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get tagFocus;

  /// No description provided for @tagRest.
  ///
  /// In en, this message translates to:
  /// **'Rest'**
  String get tagRest;

  /// No description provided for @tagDiscipline.
  ///
  /// In en, this message translates to:
  /// **'Discipline'**
  String get tagDiscipline;

  /// No description provided for @tagGratitude.
  ///
  /// In en, this message translates to:
  /// **'Gratitude'**
  String get tagGratitude;

  /// No description provided for @tagMovement.
  ///
  /// In en, this message translates to:
  /// **'Movement'**
  String get tagMovement;

  /// No description provided for @tagPresence.
  ///
  /// In en, this message translates to:
  /// **'Presence'**
  String get tagPresence;

  /// No description provided for @wisdomQuote01.
  ///
  /// In en, this message translates to:
  /// **'Growth is a slow process, but quitting won’t speed it up.'**
  String get wisdomQuote01;

  /// No description provided for @wisdomQuote02.
  ///
  /// In en, this message translates to:
  /// **'Make today worth remembering.'**
  String get wisdomQuote02;

  /// No description provided for @wisdomQuote03.
  ///
  /// In en, this message translates to:
  /// **'Rest is not a reward. It is part of the work.'**
  String get wisdomQuote03;

  /// No description provided for @wisdomQuote04.
  ///
  /// In en, this message translates to:
  /// **'Small, kind steps still count as progress.'**
  String get wisdomQuote04;

  /// No description provided for @wisdomQuote05.
  ///
  /// In en, this message translates to:
  /// **'You do not have to finish the forest to plant a tree.'**
  String get wisdomQuote05;

  /// No description provided for @wisdomQuote06.
  ///
  /// In en, this message translates to:
  /// **'Quiet mornings make braver afternoons.'**
  String get wisdomQuote06;

  /// No description provided for @wisdomQuote07.
  ///
  /// In en, this message translates to:
  /// **'Notice what went well. Let that be enough for tonight.'**
  String get wisdomQuote07;

  /// No description provided for @wisdomQuote08.
  ///
  /// In en, this message translates to:
  /// **'Consistency is a form of self-respect.'**
  String get wisdomQuote08;

  /// No description provided for @wisdomQuote09.
  ///
  /// In en, this message translates to:
  /// **'A gentle pace still arrives.'**
  String get wisdomQuote09;

  /// No description provided for @wisdomQuote10.
  ///
  /// In en, this message translates to:
  /// **'Your attention is a garden. Water what you want to grow.'**
  String get wisdomQuote10;

  /// No description provided for @wisdomQuote11.
  ///
  /// In en, this message translates to:
  /// **'Pause long enough to hear what you already know.'**
  String get wisdomQuote11;

  /// No description provided for @wisdomQuote12.
  ///
  /// In en, this message translates to:
  /// **'Celebrate the ordinary wins. They build the extraordinary days.'**
  String get wisdomQuote12;

  /// No description provided for @wisdomQuote13.
  ///
  /// In en, this message translates to:
  /// **'You can begin again without erasing yesterday.'**
  String get wisdomQuote13;

  /// No description provided for @wisdomQuote14.
  ///
  /// In en, this message translates to:
  /// **'Peace is a practice, not a prize.'**
  String get wisdomQuote14;

  /// No description provided for @wisdomQuote15.
  ///
  /// In en, this message translates to:
  /// **'Let the day be unfinished and still worthy.'**
  String get wisdomQuote15;

  /// No description provided for @wisdomQuote16.
  ///
  /// In en, this message translates to:
  /// **'Breath first. Then the next true thing.'**
  String get wisdomQuote16;

  /// No description provided for @wisdomQuote17.
  ///
  /// In en, this message translates to:
  /// **'The slow path is still a path.'**
  String get wisdomQuote17;

  /// No description provided for @wisdomQuote18.
  ///
  /// In en, this message translates to:
  /// **'Kindness toward yourself is a daily intention.'**
  String get wisdomQuote18;

  /// No description provided for @wisdomQuote19.
  ///
  /// In en, this message translates to:
  /// **'Insight prefers quiet more than urgency.'**
  String get wisdomQuote19;

  /// No description provided for @wisdomQuote20.
  ///
  /// In en, this message translates to:
  /// **'Show up softly. Stay a little longer.'**
  String get wisdomQuote20;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
