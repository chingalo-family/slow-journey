# Cursor Setup for Slow Journey

Shared Cursor configuration, adapted from Duka Mkononi’s project skills.

## Included
- Rule: `.cursor/rules/slow-journey-consistency.mdc` (**always applied**)
- Rule: `.cursor/rules/slow-journey-dart.mdc` (when `**/*.dart` is in scope)
- Rule: `.cursor/rules/slow-journey-offline.mdc` (Drift / SQLite / syncStatus)
- Skill: `.cursor/skills/slow-journey-project/SKILL.md` (**always follow**)
- Skill: `.cursor/skills/slow-journey-offline/SKILL.md` (offline DB, counters, reserved syncStatus)
- Skill: `.cursor/skills/slow-journey-localization/SKILL.md` (English ARB; update on every label change)
- Skill: `.cursor/skills/slow-journey-community-docs/SKILL.md` (README, CONTRIBUTING, SECURITY, CoC, GETTING_STARTED, GitHub templates)

## Reused from Duka Mkononi
- Layered Flutter + Provider + Drift layout
- Meaningful names, no inline Dart comments
- `flutter analyze` must print **No issues found!**
- `flutter test` before finishing
- Append-only Drift migrations; schema version from the migration list
- `syncStatus` on business rows (Phase 1 writes `notSynced`; no network upload)
- Flutter gen-l10n ARB catalogs (English template first; more languages later)

## Not reused (Phase 1)
- DHIS2 / HTTP sync
- A second locale (Swahili or other) until a language is chosen
- Subscription / role gates

## Product docs
Living documentation lives under `docs/` (same shape as Duka Mkononi: architecture, features, development, user-guides, diagrams, plans). Start at [`docs/README.md`](../docs/README.md).

## Keeping skills current
When layout, schema, quality gates, or Phase 2 sync seams change, update this `.cursor/` folder **and** `docs/` in the same change. Treat stale skills, rules, or docs as defects.
