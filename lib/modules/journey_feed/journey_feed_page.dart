import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state/app_state.dart';
import '../../core/components/brand_marks.dart';
import '../../core/components/sj_buttons.dart';
import '../../core/components/sj_chrome.dart';
import '../../core/components/sj_journey_photo.dart';
import '../../core/constants/sj_layout.dart';
import '../../core/utils/l10n_util.dart';
import '../../models/models.dart';
import '../intentions/morning_intentions_page.dart';
import '../reflection/evening_reflection_page.dart';
import '../reflection/journey_photo_viewer_page.dart';
import '../settings/manage_profile_page.dart';

class JourneyFeedPage extends StatelessWidget {
  const JourneyFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final feed = context.watch<JourneyFeedState>();
    final streak = feed.counters?.currentStreak ?? 0;
    return Scaffold(
      appBar: AppBar(
        leading: SjProfileButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ManageProfilePage()),
            );
          },
        ),
        title: Text(l10n.yourJourney),
        actions: [
          SjStreakChip(streak: streak),
        ],
      ),
      body: feed.items.isEmpty
          ? const _EmptyFeed()
          : ListView.separated(
              padding: SjLayout.tabBodyPaddingOf(context),
              itemCount: feed.items.length,
              separatorBuilder: (_, _) => const SizedBox(height: 16),
              itemBuilder: (context, itemIndex) => _FeedCard(
                item: feed.items[itemIndex],
                onOpen: () async {
                  final profile = context.read<ProfileState>().profile;
                  if (profile == null) return;
                  final date = DateTime.tryParse(feed.items[itemIndex].forDate);
                  if (date == null) return;
                  await context.read<DailyState>().load(profile.id, day: date);
                  if (!context.mounted) return;
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EveningReflectionPage(),
                    ),
                  );
                  if (!context.mounted) return;
                  await context.read<JourneyFeedState>().load(profile.id);
                },
              ),
            ),
    );
  }
}

class _EmptyFeed extends StatelessWidget {
  const _EmptyFeed();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 24, 28, 120),
        child: SjCard(
          mist: true,
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LeafMark(size: 64),
              const SizedBox(height: 16),
              Text(
                context.l10n.firstReflectionTonight,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                context.l10n.emptyFeedHint,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              SjGhostButton(
                label: context.l10n.emptyFeedAction,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MorningIntentionsPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeedCard extends StatelessWidget {
  const _FeedCard({required this.item, required this.onOpen});

  final ReflectionModel item;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.tryParse(item.forDate);
    final title = item.title?.trim().isNotEmpty == true
        ? item.title!
        : (item.learning.isEmpty
            ? context.l10n.eveningReflectionFallbackTitle
            : item.learning);
    final summary = item.learning.isEmpty ? item.wins : item.learning;
    return SjCard(
      padding: EdgeInsets.zero,
      child: InkWell(
        onTap: onOpen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SjJourneyPhoto(
              photoPath: item.photoPath,
              kind: SjJourneyPhotoKind.feed,
              heroTag: item.photoPath,
              onTap: item.photoPath == null
                  ? null
                  : () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => JourneyPhotoViewerPage(
                            photoPath: item.photoPath!,
                            heroTag: item.photoPath,
                          ),
                        ),
                      );
                    },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (date != null)
                    Text(
                      L10nUtil.feedCardDate(context.l10n, date),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  if (date != null) const SizedBox(height: 6),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (summary != title) ...[
                    const SizedBox(height: 4),
                    Text(
                      summary,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  if (item.tags.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        for (final tag in item.tags)
                          SjChip(
                            label: L10nUtil.learningTagLabel(context.l10n, tag),
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
