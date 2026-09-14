# Security Policy

## Supported versions

Slow Journey is in **Phase 1** (offline-only, version `1.0.0+1` in `pubspec.yaml`). Please report issues against the current `develop` branch.

| Version | Supported |
|---------|-----------|
| `1.0.x` (Phase 1, current) | Yes |
| Older unpublished builds | No |

## Reporting a vulnerability

Do **not** open a public GitHub issue for a security problem.

Email **CFIS (Chingalo Family Information System)** at [chingalo.family@gmail.com](mailto:chingalo.family@gmail.com).

Please include:

- A description of the issue and impact (for example PIN bypass, local data exposure, notification abuse)
- Steps to reproduce, affected OS/device, and app version (`1.0.0+1` or git SHA)
- Whether the data stays on-device or you believe it could leave the device

Phase 1 has **no backend**. Typical surfaces are on-device SQLite (`slow_journey_app_db.db`), SharedPreferences, optional PIN hashing, local notifications, and gallery photo capture.

## What to expect

We will acknowledge reports when we can and follow up after we have assessed impact. Please give us a reasonable window before any public disclosure.

## Scope notes

- Do not include secrets, keystores, or real user reflections in reports or screenshots when you can avoid it.
- Do not propose adding network, analytics, or third-party telemetry as a “fix” in Phase 1.
