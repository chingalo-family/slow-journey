# Data sync

Phase 1 does **not** upload or download. The daily loop is airplane-mode safe.

`syncStatus` still exists on business rows so Phase 2 can add a sync engine without a breaking schema change.

## Phase 1 behavior

| Action | Network | Persistence |
|--------|---------|-------------|
| Create profile | None | SQLite `notSynced` |
| Set intentions | None | Replace rows for that date |
| Toggle intention done | None | Local update, `notSynced` |
| Complete Day | None | Transaction: reflection + chosen or inferred tags + counters |
| Reminders | None | OS scheduler + SharedPreferences |
| Export | None | JSON file on device |
| Wipe | None | Clear SQLite + prefs |

There is no Data Sync screen, auto-sync, or DHIS2 client.

## Reserved contract

Typical values: `notSynced` (default writes) and `synced` (unused until Phase 2).

Do not drop `syncStatus` or UUID primary keys. Do not add HTTP in Phase 1.

## Phase 2 (not shipped)

See [Phase 2 plan](../plans/phase-2-community-and-sync.md): upload `notSynced` rows, download remote changes with pending-protected last-write-wins, optional auto-sync and Community.
