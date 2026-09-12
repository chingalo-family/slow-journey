---
name: slow-journey-localization
description: >-
  Maintains English UI translations for Slow Journey using Flutter gen-l10n ARB
  catalogs. Use when adding or changing user-facing labels, buttons, dialogs,
  snackbars, hints, notifications, empty states, or wisdom quotes; or when the
  user mentions i18n, l10n, localization, translation, or ARB. Additional
  languages are not decided yet — keep English as the template and do not add
  a second locale until asked.
---

# Slow Journey Localization (English first)

All user-facing copy lives in `lib/l10n/app_en.arb`. Never add new hardcoded UI strings in widgets. Workflow detail: `docs/development/localization.md`.

Additional languages will be decided later. Until then:

- Keep **only** `app_en.arb` as the template
- Do **not** add `app_xx.arb` files unless the user asks
- New keys go in English first so a future locale can copy the same keys

## Catalogs
| File | Role |
|------|------|
| `lib/l10n/app_en.arb` | Template / English source of truth |
| `l10n.yaml` | gen-l10n config |
| Generated | `lib/l10n/app_localizations*.dart` (do not hand-edit) |

## When UI copy changes

1. Add or update the key in `lib/l10n/app_en.arb` in the **same change** as the UI.
2. Use readable camelCase keys with prefixes: `nav*`, `onboarding*`, `intention*`, `planner*`, `reflection*`, `growth*`, `settings*`, `notification*`, `tag*`, `wisdomQuote*`.
3. Placeholders: ICU `{name}` plus `@key` metadata (`String`, `int`).
4. Run `flutter gen-l10n`.
5. In widgets: `final l10n = context.l10n;` (from `L10nUtil`) then `l10n.myKey`.
6. Without context (notifications, insights): `L10nUtil.english()`.
7. Supported locale is `en` only (`MaterialApp.locale` + `AppLocalizations.supportedLocales`).

## Display vs storage
- **Localize display only.** Stored learning-tag IDs stay English (`Mindfulness`, `Rest`, …). Show them with `L10nUtil.learningTagLabel`.
- Do not translate profile names, user-written intentions, or reflection body text.

## Anti-patterns
- Hardcoded `'Save'`, titles, snackbars, hints in widgets
- Editing generated `app_localizations*.dart`
- Adding a second ARB locale before the user chooses a language
- Leaving `AppStrings` or duplicate English constants

## Verify
```bash
flutter gen-l10n
flutter analyze
flutter test
```

`flutter analyze` must print **No issues found!**

## Done checklist
- [ ] `app_en.arb` updated for every new/changed label
- [ ] Widgets use `context.l10n` / `L10nUtil.english()`
- [ ] Stored codes unchanged
- [ ] Tests still pass (widget tests wrap with English delegates)
- [ ] User guide note if language or reminder copy behavior changed (`docs/user-guides/`)
