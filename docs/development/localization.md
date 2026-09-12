# Localization (English first)

Slow Journey ships English UI via Flutter **gen-l10n**. A second locale is not decided yet — do not add `app_xx.arb` until asked.

## Supported locales

| Code | Language |
|------|----------|
| `en` | English (MaterialApp locale is `en`) |

## Files

| Path | Purpose |
|------|---------|
| `l10n.yaml` | gen-l10n configuration |
| `lib/l10n/app_en.arb` | English template / source of truth |
| `lib/l10n/app_localizations*.dart` | Generated API (do not edit) |
| `lib/core/utils/l10n_util.dart` | `english()`, `context.l10n`, tag display labels |

`pubspec.yaml` has `flutter: generate: true` and depends on `flutter_localizations` + `intl`.

## Add or change a string

1. Add the key to `lib/l10n/app_en.arb` (and `@key` metadata if it has placeholders).
2. Run:

```bash
flutter gen-l10n
```

3. In a widget:

```dart
final l10n = context.l10n;
Text(l10n.setMyDay);
```

4. Without `BuildContext` (OS notifications, insights):

```dart
final l10n = L10nUtil.english();
```

## Key naming

Prefix by area: `nav*`, `onboarding*`, `intention*`, `planner*`, `reflection*`, `growth*`, `settings*`, `notification*`, `tag*`, `wisdomQuote*`. Broader identifier rules: [naming](./naming.md).

## Stable codes vs labels

Learning-tag **IDs** stay English in SQLite (`Mindfulness`, `Rest`, …). Show them with `L10nUtil.learningTagLabel`. Do not translate profile names, user-written intentions, or reflection body text.

## Agent skill

When changing labels, follow `.cursor/skills/slow-journey-localization/SKILL.md`.
