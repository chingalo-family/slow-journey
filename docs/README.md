# Slow Journey - Documentation

Technical documentation for the **Slow Journey** Flutter app (`1.0.0+1`). Product intro and core features: [root README](../README.md).

**Pause · Reflect · Grow** - a calm, offline-first intention and reflection loop. Phase 1 has no HTTP, DHIS2, or Community. Display name: **Slow Journey**. Package id: `chingalo.family.slowjourney`.

## Architecture

| Document | Description |
|----------|-------------|
| [Architecture overview](./architecture/overview.md) | Layered design, state management, project layout |
| [Flow diagrams](./diagrams/README.md) | Mermaid diagrams for app flows and how `lib/` maps onto those flows |
| [Offline storage](./architecture/offline-storage.md) | Drift ORM, SQLite schema, migrations, repository |
| [Data sync](./architecture/data-sync.md) | Reserved `syncStatus` for Phase 2; no network in Phase 1 |

## Plans

Working documents for work that is **not shipped yet**. After implementation, update architecture, feature, and user-guide docs instead of treating these as the source of truth.

| Document | Description |
|----------|-------------|
| [Plans index](./plans/README.md) | Index of implementation plans |
| [Phase 2 - sync and Community](./plans/phase-2-community-and-sync.md) | Cloud account, two-way sync, Community Circle |

## Features

| Document | Description |
|----------|-------------|
| [Modules](./features/modules.md) | Feature screens, navigation, implementation status |
| [Notifications](./features/notifications.md) | Local morning and evening reminders |
| [Brand](./features/brand.md) | Name, tagline, palette, type, store identity |

## Development

| Document | Description |
|----------|-------------|
| [Getting started (contributors)](./GETTING_STARTED.md) | Clone, env, run, test, project tree |
| [Setup](./development/setup.md) | Prerequisites, install, run, build |
| [Environment variables](./development/environment.md) | `.env` configuration reference |
| [Testing](./development/testing.md) | Unit tests and running the suite |
| [Naming](./development/naming.md) | Meaningful names for classes, functions, variables, files |
| [Localization](./development/localization.md) | English gen-l10n ARB workflow |
| [Responsive UI](./development/responsive-ui.md) | Phone portrait pill vs landscape/large-screen rail |

## User guides

Friendly, shareable guides (not technical docs):

| Document | Description |
|----------|-------------|
| [User guides index](./user-guides/README.md) | All end-user guides |
| [Getting started](./user-guides/getting-started.md) | First open, local profile, daily cycle |
| [Planner](./user-guides/planner.md) | Intentions, week and month calendar, completing items |
| [Reflections](./user-guides/reflections.md) | Evening ritual and journey feed |
| [Growth](./user-guides/growth.md) | Streaks, tags, monthly insight |
| [Notifications](./user-guides/notifications.md) | Plan My Day and Reflect & Celebrate |
| [Settings](./user-guides/settings-and-account.md) | Profile, theme, PIN, wipe |

When product behavior visible to end users changes, update the matching guide under `docs/user-guides/` in the same change set.

Keep `docs/diagrams/` in sync when startup, navigation, or module wiring changes.

## Quick links

- [Root README](../README.md) - product overview and getting started
- [`.env.example`](../.env.example) - environment template
- [`pubspec.yaml`](../pubspec.yaml) - dependencies and app version
