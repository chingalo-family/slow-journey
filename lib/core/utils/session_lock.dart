class SessionLock {
  static const idleMinuteChoices = [2, 5, 10];
  static const defaultIdleMinutes = 5;

  static int sanitizeIdleMinutes(int minutes) {
    if (idleMinuteChoices.contains(minutes)) {
      return minutes;
    }
    return defaultIdleMinutes;
  }
  static bool idleExceeded({
    required int lastActivityMs,
    required int idleMinutes,
    required DateTime now,
  }) {
    if (lastActivityMs <= 0) return false;
    final idleLimitMs = idleMinutes * 60 * 1000;
    if (idleLimitMs <= 0) return true;
    final elapsedMs = now.millisecondsSinceEpoch - lastActivityMs;
    return elapsedMs >= idleLimitMs;
  }

  static bool requiresUnlockWhenHasPin({required bool hasPin}) => hasPin;

  static bool shouldLockAfterIdle({
    required bool hasPin,
    required bool autoLockOn,
    required bool idleExceeded,
  }) =>
      hasPin && autoLockOn && idleExceeded;

  static bool shouldLockAfterAppInactive({
    required bool hasPin,
    required bool autoLockOn,
    required int inactiveSinceMs,
    required int idleMinutes,
    required DateTime now,
  }) =>
      shouldLockAfterIdle(
        hasPin: hasPin,
        autoLockOn: autoLockOn,
        idleExceeded: idleExceeded(
          lastActivityMs: inactiveSinceMs,
          idleMinutes: idleMinutes,
          now: now,
        ),
      );
}
