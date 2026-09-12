import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/offline_db/app_database.dart';
import 'package:slowjourney/core/services/journey_repository.dart';

import '../../helpers/test_database.dart';

void main() {
  late AppDatabase database;
  late JourneyRepository repository;

  setUp(() async {
    database = await createTestDatabase();
    repository = JourneyRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('create profile persists a local row with notSynced status', () async {
    final profile = await repository.createProfile(
      name: 'Alex Rivers',
      email: 'alex@example.com',
    );
    expect(profile.name, 'Alex Rivers');
    expect(profile.syncStatus, 'notSynced');
    expect(await repository.loadProfile(), isNotNull);
  });

  test('set day keeps at most three intentions', () async {
    final profile = await repository.createProfile(name: 'Alex');
    await repository.setDay(profile.id, '2026-09-11', [
      'Breathe',
      'Draft',
      'Walk',
      'Ignored fourth',
    ]);
    final intentions = await repository.intentions(profile.id, '2026-09-11');
    expect(intentions.length, 3);
    expect(intentions.map((row) => row.text).toList(), [
      'Breathe',
      'Draft',
      'Walk',
    ]);
  });

  test('complete day updates streak and reflection count', () async {
    final profile = await repository.createProfile(name: 'Alex');
    await repository.completeDay(
      profileId: profile.id,
      date: '2026-09-10',
      learning: 'Stillness before work',
      wins: 'Finished the draft',
      gratitudeScore: 4,
    );
    await repository.completeDay(
      profileId: profile.id,
      date: '2026-09-11',
      learning: 'A calm walk',
      wins: 'Showed up',
      gratitudeScore: 3,
    );

    final counters = await repository.counters(profile.id);
    expect(counters.totalReflections, 2);
    expect(counters.currentStreak, 2);
    expect(counters.longestStreak, 2);
    expect(counters.daysCompleted, 2);

    final today = await repository.reflection(profile.id, '2026-09-11');
    expect(today?.learning, 'A calm walk');
    expect(today?.syncStatus, 'notSynced');
  });

  test('completed dates in a week are returned as a set', () async {
    final profile = await repository.createProfile(name: 'Alex');
    await repository.completeDay(
      profileId: profile.id,
      date: '2026-09-11',
      learning: 'Stillness',
      wins: 'Showed up',
      gratitudeScore: 4,
    );
    final dates = await repository.completedDates(
      profileId: profile.id,
      startIso: '2026-09-07',
      endIso: '2026-09-13',
    );
    expect(dates, {'2026-09-11'});
  });

  test('set pin stores a hash that survives reload', () async {
    final profile = await repository.createProfile(name: 'Alex');
    await repository.setPin(profile, '2468');
    final stored = await repository.loadProfile();
    expect(stored?.hasPin, isTrue);
    expect(stored?.pinHash, isNot(equals('2468')));
    await repository.updateProfile(stored!.copyWith(clearPin: true));
    expect((await repository.loadProfile())?.hasPin, isFalse);
  });

  test('completing the same date does not duplicate reflections', () async {
    final profile = await repository.createProfile(name: 'Alex');
    await repository.completeDay(
      profileId: profile.id,
      date: '2026-09-11',
      learning: 'First note',
      wins: 'A',
      gratitudeScore: 2,
    );
    await repository.completeDay(
      profileId: profile.id,
      date: '2026-09-11',
      learning: 'Updated note',
      wins: 'B',
      gratitudeScore: 4,
    );
    final feed = await repository.feed(profile.id);
    expect(feed.length, 1);
    expect(feed.single.learning, 'Updated note');
    expect((await repository.counters(profile.id)).totalReflections, 1);
  });

  test('update profile persists a birthday', () async {
    final profile = await repository.createProfile(name: 'Alex');
    await repository.updateProfile(profile.copyWith(birthday: '1994-10-12'));
    final reloaded = await repository.loadProfile();
    expect(reloaded?.birthday, '1994-10-12');
  });
}
