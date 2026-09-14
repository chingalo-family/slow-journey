# Contributing to Slow Journey

Thanks for helping improve **Slow Journey**, a Flutter daily-rhythm app (Pause · Reflect · Grow). This document is for people who want to change the code. End-user how-tos live under [`docs/user-guides/`](docs/user-guides/README.md).

Please read the [Code of Conduct](CODE_OF_CONDUCT.md) first.

## Ways to contribute

- Report bugs with the [bug report](https://github.com/chingalo-family/slow-journey/issues/new?template=bug_report.yml) template
- Propose features with the [feature request](https://github.com/chingalo-family/slow-journey/issues/new?template=feature_request.yml) template
- Open a pull request against `develop`

Security issues: do not file a public issue. Follow [SECURITY.md](SECURITY.md).

## Development setup

Follow [docs/GETTING_STARTED.md](docs/GETTING_STARTED.md). In short:

```bash
flutter pub get
cp .env.example .env
dart run build_runner build --delete-conflicting-outputs
flutter run
```

Quality gates before you open a PR:

```bash
flutter analyze   # must print: No issues found!
flutter test
```

There is no CI workflow in this repository yet; run those commands locally.

## Project conventions

- **Phase 1 is offline.** Do not add HTTP, DHIS2, or Community Circle features.
- Keep domain logic in `lib/core/services/`, not in widgets.
- Use package imports (`package:slowjourney/...`).
- Persist business writes locally with `syncStatus` (default `notSynced`).
- User-facing copy goes in `lib/l10n/app_en.arb` (English only). Then run `flutter gen-l10n`.
- After Drift table or migration changes, run `dart run build_runner build --delete-conflicting-outputs` and commit generated files.
- Meaningful names; no `i` / `j` / `k` loop indexes; no inline `//` comments in Dart.
- Tests describe behavior. Layout: [`docs/development/testing.md`](docs/development/testing.md), naming: [`docs/development/naming.md`](docs/development/naming.md).

If architecture, modules, reminders, schema, or setup behavior changes, update the matching files under `docs/` in the same change. If end-user-visible behavior changes, update `docs/user-guides/`.

## Git workflow

1. Open or reference an issue.
2. Branch from `develop` (`feat/…`, `fix/…`, `docs/…`).
3. Keep the pull request focused.
4. Fill in [`.github/PULL_REQUEST_TEMPLATE.md`](.github/PULL_REQUEST_TEMPLATE.md).

### Conventional Commits

Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>[optional scope]: <description>
```

Allowed types (match existing history): `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`.

Examples:

```
feat: Activate default reminders after Get Started
fix: Keep incomplete intentions from resetting the streak
docs: Document Phase 1 environment variables
```

## Pull requests

- Target **`develop`**.
- Include tests when logic changes (repository, streaks, counters, dates, reminders).
- `flutter analyze` must print **No issues found!**
- `flutter test` must pass.
- Do not commit `.env`, keystores, or `android/key.properties`.
- Maintainers may ask for changes before merge.

## Questions

Use GitHub issues for product and code questions. Security and conduct reports: [chingalo.family@gmail.com](mailto:chingalo.family@gmail.com) (**CFIS (Chingalo Family Information System)**). See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) and [SECURITY.md](SECURITY.md).
