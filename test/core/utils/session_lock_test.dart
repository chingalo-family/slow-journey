import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/utils/session_lock.dart';

void main() {
  test('idle is not exceeded when activity has never been recorded', () {
    expect(
      SessionLock.idleExceeded(
        lastActivityMs: 0,
        idleMinutes: 5,
        now: DateTime(2026, 9, 11, 12),
      ),
      isFalse,
    );
  });

  test('idle minute choices are 2, 5, and 10', () {
    expect(SessionLock.idleMinuteChoices, [2, 5, 10]);
    expect(SessionLock.sanitizeIdleMinutes(5), 5);
    expect(SessionLock.sanitizeIdleMinutes(2), 2);
    expect(SessionLock.sanitizeIdleMinutes(10), 10);
    expect(SessionLock.sanitizeIdleMinutes(7), 5);
  });

  test('idle uses inclusive minutes so a timer fire can lock', () {
    final now = DateTime(2026, 9, 11, 12, 5);
    final fiveMinutesAgo = now.subtract(const Duration(minutes: 5));
    expect(
      SessionLock.idleExceeded(
        lastActivityMs: fiveMinutesAgo.millisecondsSinceEpoch,
        idleMinutes: 5,
        now: now,
      ),
      isTrue,
    );
  });

  test('idle is not exceeded before the idle window', () {
    final now = DateTime(2026, 9, 11, 12, 4);
    final started = DateTime(2026, 9, 11, 12);
    expect(
      SessionLock.idleExceeded(
        lastActivityMs: started.millisecondsSinceEpoch,
        idleMinutes: 5,
        now: now,
      ),
      isFalse,
    );
  });

  test('cold start requires unlock only when a pin exists', () {
    expect(SessionLock.requiresUnlockWhenHasPin(hasPin: true), isTrue);
    expect(SessionLock.requiresUnlockWhenHasPin(hasPin: false), isFalse);
  });

  test('idle auto-lock needs a pin, the toggle, and elapsed idle', () {
    expect(
      SessionLock.shouldLockAfterIdle(
        hasPin: true,
        autoLockOn: true,
        idleExceeded: true,
      ),
      isTrue,
    );
    expect(
      SessionLock.shouldLockAfterIdle(
        hasPin: false,
        autoLockOn: true,
        idleExceeded: true,
      ),
      isFalse,
    );
    expect(
      SessionLock.shouldLockAfterIdle(
        hasPin: true,
        autoLockOn: false,
        idleExceeded: true,
      ),
      isFalse,
    );
  });

  test('returning while the app was inactive only locks after idle with auto-lock on', () {
    final now = DateTime(2026, 9, 12, 12, 5);
    final fiveMinutesAgo = now.subtract(const Duration(minutes: 5));
    expect(
      SessionLock.shouldLockAfterAppInactive(
        hasPin: true,
        autoLockOn: true,
        inactiveSinceMs: fiveMinutesAgo.millisecondsSinceEpoch,
        idleMinutes: 5,
        now: now,
      ),
      isTrue,
    );
    expect(
      SessionLock.shouldLockAfterAppInactive(
        hasPin: true,
        autoLockOn: true,
        inactiveSinceMs: now.subtract(const Duration(minutes: 1)).millisecondsSinceEpoch,
        idleMinutes: 5,
        now: now,
      ),
      isFalse,
    );
    expect(
      SessionLock.shouldLockAfterAppInactive(
        hasPin: true,
        autoLockOn: false,
        inactiveSinceMs: fiveMinutesAgo.millisecondsSinceEpoch,
        idleMinutes: 5,
        now: now,
      ),
      isFalse,
    );
  });
}
