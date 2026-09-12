# Responsive UI

Slow Journey is **phone-first**. Landscape and large screens use a leading **navigation rail** (icon + label), in the same pattern as Duka Mkononi.

## Breakpoints

| Class | Size | Navigation |
|-------|------|------------|
| Compact portrait phone | width &lt; 600 dp and portrait | Floating pill `SjBottomNav`: Feed · Planner · Growth · Setup |
| Landscape, or width ≥ 600 dp | phone landscape, tablet, large window | `SjSideNav` rail: icon and label on one row, sage selected bar, cream-sage hairline |

Rail width is `220` dp. Destinations scroll if the height is short.

Implementation: `lib/modules/shell/app_shell.dart`, `lib/core/constants/sj_layout.dart`, `lib/core/components/sj_side_nav.dart`.

## Content

List screens use `SjLayout.tabBodyPaddingOf` so the extra scroll gap for the floating pill is not reserved when the rail is showing.

Journey photos stay 16:9 when that fits; on short landscape heights they cap so a single card does not fill the screen.

Minimum tap targets stay at Material defaults (~48 dp).
