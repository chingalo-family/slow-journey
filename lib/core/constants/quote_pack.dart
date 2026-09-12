import 'package:slowjourney/l10n/app_localizations.dart';

class WisdomQuote {
  const WisdomQuote({required this.body});

  final String body;
}

class QuotePack {
  static List<WisdomQuote> quotes(AppLocalizations l10n) => [
        WisdomQuote(body: l10n.wisdomQuote01),
        WisdomQuote(body: l10n.wisdomQuote02),
        WisdomQuote(body: l10n.wisdomQuote03),
        WisdomQuote(body: l10n.wisdomQuote04),
        WisdomQuote(body: l10n.wisdomQuote05),
        WisdomQuote(body: l10n.wisdomQuote06),
        WisdomQuote(body: l10n.wisdomQuote07),
        WisdomQuote(body: l10n.wisdomQuote08),
        WisdomQuote(body: l10n.wisdomQuote09),
        WisdomQuote(body: l10n.wisdomQuote10),
        WisdomQuote(body: l10n.wisdomQuote11),
        WisdomQuote(body: l10n.wisdomQuote12),
        WisdomQuote(body: l10n.wisdomQuote13),
        WisdomQuote(body: l10n.wisdomQuote14),
        WisdomQuote(body: l10n.wisdomQuote15),
        WisdomQuote(body: l10n.wisdomQuote16),
        WisdomQuote(body: l10n.wisdomQuote17),
        WisdomQuote(body: l10n.wisdomQuote18),
        WisdomQuote(body: l10n.wisdomQuote19),
        WisdomQuote(body: l10n.wisdomQuote20),
      ];

  static WisdomQuote forDate(DateTime date, AppLocalizations l10n) {
    final all = quotes(l10n);
    final quoteIndex = date.difference(DateTime(date.year)).inDays % all.length;
    return all[quoteIndex];
  }
}
