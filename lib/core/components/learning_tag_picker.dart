import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_theme.dart';
import '../utils/l10n_util.dart';
import 'sj_buttons.dart';

class LearningTagPicker extends StatelessWidget {
  const LearningTagPicker({
    super.key,
    required this.optionIds,
    required this.selectedIds,
    required this.onToggle,
    this.addLabel,
    this.onAdd,
  });

  final List<String> optionIds;
  final Set<String> selectedIds;
  final ValueChanged<String> onToggle;
  final String? addLabel;
  final VoidCallback? onAdd;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: [
        for (final tagId in optionIds)
          SjChip(
            label: L10nUtil.learningTagLabel(context.l10n, tagId),
            selected: selectedIds.contains(tagId),
            onSelected: (_) => onToggle(tagId),
          ),
        if (onAdd != null && addLabel != null)
          ActionChip(
            label: Text(addLabel!),
            avatar: Icon(
              Icons.add,
              size: 16,
              color: context.sjAccent,
            ),
            onPressed: onAdd,
            visualDensity: VisualDensity.compact,
            labelStyle: TextStyle(
              fontFamily: AppTheme.nunito,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: context.sjAccent,
            ),
            side: BorderSide(color: context.sjHairline),
            backgroundColor: Colors.transparent,
          ),
      ],
    );
  }
}
