# Phase 2 - sync and Community

Working plan. **Not shipped.** Phase 1 offline loop stays the default; network is additive.

After this ships, update [architecture](../architecture/overview.md), [data sync](../architecture/data-sync.md), [modules](../features/modules.md), and user guides instead of treating this file as truth.

## In scope (proposed)

- Cloud account (email/password and optional social) and claiming a Phase 1 local profile
- Two-way sync of profile, intentions, reflections, key learnings, insights, and counters (`notSynced` → upload)
- Multi-device restore
- **Community Circle:** invite-based members, opt-in celebrations, a single Celebrate reaction
- Auto-sync (Wi-Fi-only + frequency) and a Data Sync screen
- Account security: password change, reset, optional TOTP
- Community notifications on top of local morning/evening reminders

## Out of scope

- Public social graph, leaderboards, ads
- Forced connectivity for the daily loop
- DHIS2 is not required; a REST/GraphQL API is the likely backend

## Privacy

Reflections stay private by default. Sharing a celebration is explicit. Export and account delete remain required.

## Open questions

- Invite-only circles vs suggestions
- Auto milestones vs user-authored celebrations
- Server-side monthly insight now or later

## Implementation note

Do not add HTTP, Community navigation, or workmanager in Phase 1. Keep UUID keys and `syncStatus` on business rows so this plan can land without a breaking migration.
