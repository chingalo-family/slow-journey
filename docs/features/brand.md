# Brand

**App name:** Slow Journey  
**Tagline:** Pause · Reflect · Grow  
**Package / bundle id:** `chingalo.family.slowjourney`  
**Language:** English UI, store listing, and notification copy.

## Personality

Calm, warm, unhurried. Reminders are invitations, never nags. Voice uses gentle second person.

## Color tokens (`AppColors`)

| Token | Hex | Use |
|-------|-----|-----|
| sage primary | `#7C8B6F` | Light-theme buttons, active states |
| sage primary dark | `#5E6B52` | Light-theme pressed / icons on mist |
| cream background | `#F4F1EA` | Light scaffold |
| cream surface | `#FBF9F4` | Light cards |
| mist chip / photo | `#EEF2E6` / `#D9E2CC` | Tags and photo placeholders in both themes |
| cream hairline | `#D5DCCB` | Light dividers and side-nav separator |
| ink 900 | `#2C2E2A` | Body text on cream and mist |
| error | `#B4685E` | Muted terracotta |

**Muted Dark** matches the Feed sample: forest canvas `#1E201C`, cream titles `#EDEBE3`, **light sage accents** `#8FA07F` (nav, streak), idle chrome `#8A8C84`. Cards (including mist cards) use the forest surface `#2A2D27`. Photo blocks and chips stay mist so they lift off the forest. Text on those mist chips stays ink, not cream. Banners use a lifted forest sage `#4A5444` so they do not melt into the canvas.

## Type

| Role | Face |
|------|------|
| Headings | Fraunces (`assets/fonts/Fraunces.ttf`) |
| Body / UI | Nunito (`assets/fonts/Nunito.ttf`) |

App bars use Nunito 17 pt, not tracked small-caps. Portrait phone tabs sit in a floating pill (`SjBottomNav`) with a sage selected state. Landscape and large screens use `SjSideNav` as a rail with icon, label, a sage selected bar, and a cream-sage separator. Overlines (wisdom, insight) may still use letter-spacing.

## Marks and launcher

| Asset | Use |
|-------|-----|
| `assets/brand/sprout.svg` | In-app sprout (`LeafMark`), Flutter splash, and native launch mark |
| `assets/brand/app_icon.png` | 1024×1024 store / launcher source |

Native launch (Android `launch_background` / iOS `LaunchScreen`) is cream `#F4F1EA` with the sprout centered at 112 dp, matching `SplashPage`. Android 12+ also sets `windowSplashScreenBackground` to cream. Regenerate density PNGs from `sprout.svg` if the mark changes.

Regenerate platform icons after replacing `app_icon.png`:

```bash
dart run flutter_launcher_icons
```

Android adaptive background is cream `#F4F1EA`. iOS marketing icon uses the same PNG with alpha removed.

## Display name

Keep **Slow Journey** in `android/.../strings.xml`, iOS `CFBundleDisplayName` / `CFBundleName`, and `INFOPLIST_KEY_CFBundleDisplayName`.
