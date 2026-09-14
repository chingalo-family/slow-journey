---
name: slow-journey-community-docs
description: >-
  Keeps Slow Journey open-source community files in sync with the source tree.
  Use when changing pubspec.yaml, .env.example, setup or quality-gate commands,
  lib/ layout or modules, Phase 1 offline boundaries, security-relevant surfaces
  (PIN, SQLite, notifications), GitHub workflow, LICENSE, or contributor onboarding.
  Files: README.md, CONTRIBUTING.md, SECURITY.md, CODE_OF_CONDUCT.md,
  docs/GETTING_STARTED.md, .github/PULL_REQUEST_TEMPLATE.md,
  .github/ISSUE_TEMPLATE/*.yml.
---

# Slow Journey community docs

When source or tooling changes, update the matching **community-health** files in the **same change**. Do not invent commands, env vars, modules, or contacts. If something is unknown, use `<!-- TODO: ... -->`.

Product/architecture docs under `docs/architecture/`, `docs/features/`, and `docs/user-guides/` stay required as in `.cursor/skills/slow-journey-project/SKILL.md`. This skill covers contributor-facing OSS files.

## Identity (do not drift)

- Product: **Slow Journey** (Pause · Reflect · Grow)
- Package: `slowjourney` / `chingalo.family.slowjourney`
- GitHub: `chingalo-family/slow-journey`
- Default contribution branch: `develop`
- Copyright: **CFIS (Chingalo Family Information System)**, year **2026**, BSD 3-Clause (`LICENSE`)
- Security and conduct: [chingalo.family@gmail.com](mailto:chingalo.family@gmail.com)
- Phase 1: offline only (no HTTP, DHIS2, Community Circle)

## Source → file map

Read the code first (`pubspec.yaml`, `.env.example`, `lib/`, `analysis_options.yaml`, `docs/development/setup.md`). Then edit only what the change actually affects.

| If you change… | Update |
|----------------|--------|
| Product one-liner, features, stack, run commands | `README.md` |
| Dart SDK, dependencies, `flutter` scripts, app version | `README.md`, `docs/GETTING_STARTED.md`, bug template version hint |
| `.env.example` or `dotenv.load` | `README.md` env table, `docs/GETTING_STARTED.md`, `docs/development/environment.md` |
| Install / run / analyze / test / codegen / `flutter gen-l10n` | `README.md`, `CONTRIBUTING.md`, `docs/GETTING_STARTED.md`, PR template test plan |
| `lib/` tree, `main.dart` entry, new `lib/modules/*` | `docs/GETTING_STARTED.md` project structure; issue **Area** dropdowns |
| Phase 1 vs Phase 2 scope, network, Community | `README.md`, `CONTRIBUTING.md`, `SECURITY.md` scope, feature-request **Target phase** |
| PIN, SQLite file name, notifications, on-device data | `SECURITY.md` |
| Conventional Commits, PR target branch, quality gates | `CONTRIBUTING.md`, `.github/PULL_REQUEST_TEMPLATE.md` |
| Issue labels, Level (Bug / Feature / Additional), templates | `.github/ISSUE_TEMPLATE/bug_report.yml`, `feature_request.yml`, `config.yml` |
| Contact email or copyright holder | `SECURITY.md`, `CODE_OF_CONDUCT.md`, `CONTRIBUTING.md`, `LICENSE`, `config.yml` mailto |
| CI added or default branch renamed | `CONTRIBUTING.md`, `docs/GETTING_STARTED.md`, all `blob/develop/` URLs in `.github/` |

Skip these files for Dart-only typo/format edits with no contributor-visible behavior.

## Rules

- Keep Conventional Commits (`feat`, `fix`, `docs`, `refactor`, `test`, `chore`) and the **Level** field (**Feature**, **Bug**, **Additional**) on issue/PR templates.
- Keep BSD 3-Clause; do not rewrite `LICENSE` unless the copyright holder or year changes.
- `docs/GETTING_STARTED.md` is **contributor** setup. End-user first-open copy stays in `docs/user-guides/getting-started.md`.
- After layout or setup docs change, index them from `docs/README.md` if a new file was added.

## Checklist before finishing

```
- [ ] Community files match pubspec, .env.example, and lib/ layout
- [ ] Commands in README / CONTRIBUTING / GETTING_STARTED still run
- [ ] Issue Area options include new modules (or stay Other)
- [ ] SECURITY.md still describes real on-device surfaces
- [ ] No invented env vars, emails, or CI badges
```
