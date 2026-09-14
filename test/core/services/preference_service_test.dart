import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slowjourney/core/services/preference_service.dart';

void main() {
  test('reminder defaults are 7am and 9pm and both on', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = PreferenceService(await SharedPreferences.getInstance());
    expect(prefs.morningReminderOn, isTrue);
    expect(prefs.eveningReminderOn, isTrue);
    expect(prefs.morningTime, PreferenceService.defaultMorningTime);
    expect(prefs.eveningTime, PreferenceService.defaultEveningTime);
    expect(PreferenceService.defaultMorningTime, '07:00');
    expect(PreferenceService.defaultEveningTime, '21:00');

    await prefs.ensureReminderDefaultsPersisted();
    expect(prefs.morningTime, '07:00');
    expect(prefs.eveningTime, '21:00');
  });

  test('persisting defaults does not overwrite a chosen reminder time', () async {
    SharedPreferences.setMockInitialValues({
      'morning_reminder_time': '06:30',
      'evening_reminder_time': '20:15',
      'morning_reminder_on': false,
    });
    final prefs = PreferenceService(await SharedPreferences.getInstance());
    await prefs.ensureReminderDefaultsPersisted();
    expect(prefs.morningTime, '06:30');
    expect(prefs.eveningTime, '20:15');
    expect(prefs.morningReminderOn, isFalse);
    expect(prefs.eveningReminderOn, isTrue);
  });
}
