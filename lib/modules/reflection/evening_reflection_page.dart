import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../app_state/app_state.dart';
import '../../core/components/journey_widgets.dart';
import '../../core/components/learning_tag_picker.dart';
import '../../core/components/sj_buttons.dart';
import '../../core/components/sj_journey_photo.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_theme.dart';
import '../../core/services/photo_capture_service.dart';
import '../../core/utils/l10n_util.dart';
import '../../core/utils/learning_tags.dart';
import 'day_complete_page.dart';
import 'journey_photo_viewer_page.dart';

class EveningReflectionPage extends StatefulWidget {
  const EveningReflectionPage({super.key});

  @override
  State<EveningReflectionPage> createState() => _EveningReflectionPageState();
}

class _EveningReflectionPageState extends State<EveningReflectionPage> {
  final _learning = TextEditingController();
  final _wins = TextEditingController();
  final _title = TextEditingController();
  int _gratitude = 4;
  String? _photoPath;
  bool _busy = false;
  var _tagsTouched = false;
  final _selectedTags = <String>{};
  var _optionTags = LearningTags.catalog;
  var _knownTags = const <String>[];

  @override
  void initState() {
    super.initState();
    final existing = context.read<DailyState>().reflection;
    final previous = context.read<GrowthState>().tags.keys;
    if (existing != null) {
      _learning.text = existing.learning;
      _wins.text = existing.wins;
      _title.text = existing.title ?? '';
      _gratitude = existing.gratitudeScore;
      _photoPath = existing.photoPath;
      final stored = LearningTags.sanitize(existing.tags);
      if (stored.isNotEmpty) {
        _selectedTags.addAll(stored);
        _tagsTouched = true;
      } else {
        _selectedTags.addAll(
          LearningTags.infer(existing.learning, existing.wins),
        );
      }
    }
    _knownTags = [...previous];
    _optionTags = LearningTags.pickerOrder(
      previouslyUsed: [..._knownTags, ..._selectedTags],
    );
  }

  @override
  void dispose() {
    _learning.dispose();
    _wins.dispose();
    _title.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto() async {
    final l10n = context.l10n;
    final saved = await context.read<PhotoCaptureService>().pickFromGallery(
          cropTitle: l10n.cropPhoto,
          cropDoneLabel: l10n.cropPhotoDone,
        );
    if (saved == null || !mounted) return;
    setState(() => _photoPath = saved);
  }

  Future<void> _openPhoto() async {
    if (_photoPath == null) {
      await _pickPhoto();
      return;
    }
    final l10n = context.l10n;
    final photos = context.read<PhotoCaptureService>();
    await Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (viewerContext) => JourneyPhotoViewerPage(
          photoPath: _photoPath!,
          heroTag: _photoPath,
          onChange: () async {
            final saved = await photos.pickFromGallery(
              cropTitle: l10n.cropPhoto,
              cropDoneLabel: l10n.cropPhotoDone,
            );
            if (saved == null || !mounted) return;
            setState(() => _photoPath = saved);
            if (viewerContext.mounted) Navigator.of(viewerContext).pop();
          },
          onRecrop: () async {
            final saved = await photos.cropAndSave(
              sourcePath: _photoPath!,
              cropTitle: l10n.cropPhoto,
              cropDoneLabel: l10n.cropPhotoDone,
            );
            if (saved == null || !mounted) return;
            setState(() => _photoPath = saved);
            if (viewerContext.mounted) Navigator.of(viewerContext).pop();
          },
        ),
      ),
    );
  }

  Future<void> _complete() async {
    if (_learning.text.trim().isEmpty && _wins.text.trim().isEmpty) return;
    final profile = context.read<ProfileState>().profile;
    if (profile == null) return;
    setState(() => _busy = true);
    await context.read<DailyState>().completeDay(
          profileId: profile.id,
          learning: _learning.text.trim(),
          wins: _wins.text.trim(),
          gratitude: _gratitude,
          title: _title.text.trim().isEmpty ? null : _title.text.trim(),
          photoPath: _photoPath,
          tags: _selectedTags.toList(),
        );
    if (!mounted) return;
    await context.read<JourneyFeedState>().load(profile.id);
    if (!mounted) return;
    await context.read<GrowthState>().load(profile.id);
    if (!mounted) return;
    final streak = context.read<JourneyFeedState>().counters?.currentStreak ?? 1;
    HapticFeedback.mediumImpact();
    if (!mounted) return;
    await Navigator.of(context).pushReplacement(
      PageRouteBuilder<void>(
        pageBuilder: (_, _, _) => DayCompletePage(streak: streak),
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 420),
      ),
    );
  }

  void _syncSuggestedTags() {
    setState(() {
      if (_tagsTouched) {
        return;
      }
      _selectedTags
        ..clear()
        ..addAll(LearningTags.infer(_learning.text, _wins.text));
    });
  }

  void _toggleTag(String tagId) {
    setState(() {
      _tagsTouched = true;
      if (!_selectedTags.add(tagId)) {
        _selectedTags.remove(tagId);
      }
    });
  }

  void _refreshThemeOptions() {
    _optionTags = LearningTags.pickerOrder(
      previouslyUsed: [..._knownTags, ..._selectedTags],
    );
  }

  Future<void> _addTheme() async {
    final entered = await showDialog<String>(
      context: context,
      builder: (_) => const _AddThemeDialog(),
    );
    final label = LearningTags.normalize(entered ?? '');
    if (label == null || !mounted) {
      return;
    }
    setState(() {
      _tagsTouched = true;
      _knownTags = [..._knownTags, label];
      _selectedTags.add(label);
      _refreshThemeOptions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final streak = context.watch<JourneyFeedState>().counters?.currentStreak ?? 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(l10n.reflection),
        actions: [
          IconButton(
            tooltip: l10n.addAPhoto,
            onPressed: _pickPhoto,
            icon: Icon(
              Icons.add_a_photo_outlined,
              color: context.sjAccent,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 32),
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: context.sjAccentSoft,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.spa, size: 14, color: Colors.white),
                  const SizedBox(width: 6),
                  Text(
                    l10n.eveningRitual.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: AppTheme.nunito,
                      fontSize: 11,
                      letterSpacing: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 22),
          Text(
            l10n.restYourMind,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.restSubtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 22),
          SjJourneyPhoto(
            photoPath: _photoPath,
            kind: SjJourneyPhotoKind.slot,
            heroTag: _photoPath,
            onTap: _openPhoto,
          ),
          const SizedBox(height: 14),
          TextField(
            controller: _title,
            decoration: InputDecoration(hintText: l10n.optionalDayTitle),
          ),
          const SizedBox(height: 14),
          SjCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PromptHeader(
                  icon: Icons.menu_book_outlined,
                  title: l10n.whatDidILearn,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _learning,
                  maxLines: 4,
                  onChanged: (_) => _syncSuggestedTags(),
                  decoration: InputDecoration(
                    hintText: l10n.learnHint,
                    filled: true,
                    fillColor: context.sjInputFill,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SjCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PromptHeader(
                  icon: Icons.auto_awesome_outlined,
                  title: l10n.celebrationsWins,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _wins,
                  maxLines: 4,
                  onChanged: (_) => _syncSuggestedTags(),
                  decoration: InputDecoration(
                    hintText: l10n.winsHint,
                    filled: true,
                    fillColor: context.sjInputFill,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SjCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PromptHeader(
                  icon: Icons.label_outline,
                  title: l10n.reflectionThemes,
                ),
                const SizedBox(height: 6),
                Text(
                  l10n.reflectionThemesHint,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
                LearningTagPicker(
                  optionIds: _optionTags,
                  selectedIds: _selectedTags,
                  onToggle: _toggleTag,
                  addLabel: l10n.reflectionAddTheme,
                  onAdd: _addTheme,
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Text(
            l10n.gratitudeScore.toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 12),
          GratitudeSelector(
            value: _gratitude,
            onChanged: (v) => setState(() => _gratitude = v),
          ),
          const SizedBox(height: 28),
          SjPrimaryButton(
            label: l10n.completeDay,
            icon: Icons.check,
            onPressed: _busy ||
                    (_learning.text.trim().isEmpty && _wins.text.trim().isEmpty)
                ? null
                : _complete,
          ),
          const SizedBox(height: 8),
          if (_learning.text.trim().isEmpty && _wins.text.trim().isEmpty)
            Text(
              l10n.completeDayNeedsWords,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          const SizedBox(height: 12),
          Text(
            l10n.consistentForDaysFooter(streak),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: context.sjHint,
                ),
          ),
        ],
      ),
    );
  }
}

class _PromptHeader extends StatelessWidget {
  const _PromptHeader({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.mistAvatar,
          child: Icon(icon, size: 16, color: AppColors.sagePrimaryDark),
        ),
        const SizedBox(width: 10),
        Text(title, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}

class _AddThemeDialog extends StatefulWidget {
  const _AddThemeDialog();

  @override
  State<_AddThemeDialog> createState() => _AddThemeDialogState();
}

class _AddThemeDialogState extends State<_AddThemeDialog> {
  final _draft = TextEditingController();

  @override
  void dispose() {
    _draft.dispose();
    super.dispose();
  }

  void _submit() {
    Navigator.pop(context, _draft.text);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.reflectionAddTheme),
      content: TextField(
        controller: _draft,
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        maxLength: LearningTags.maxLabelLength,
        decoration: InputDecoration(
          hintText: l10n.reflectionAddThemeHint,
        ),
        onSubmitted: (_) => _submit(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.reflectionAddThemeCancel),
        ),
        TextButton(
          onPressed: _submit,
          child: Text(l10n.reflectionAddThemeConfirm),
        ),
      ],
    );
  }
}
