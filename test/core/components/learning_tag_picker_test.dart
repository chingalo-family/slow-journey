import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slowjourney/core/components/learning_tag_picker.dart';
import 'package:slowjourney/core/utils/learning_tags.dart';

import '../../helpers/l10n_harness.dart';

void main() {
  testWidgets('learning tag picker toggles a previously used theme', (
    tester,
  ) async {
    final selected = <String>{'Focus'};
    await tester.pumpWidget(
      wrapWithEnglishL10n(
        Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) {
              return LearningTagPicker(
                optionIds: LearningTags.pickerOrder(
                  previouslyUsed: ['Focus'],
                ),
                selectedIds: selected,
                onToggle: (tagId) {
                  setState(() {
                    if (!selected.add(tagId)) {
                      selected.remove(tagId);
                    }
                  });
                },
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Rest'));
    await tester.pump();
    expect(selected, containsAll(['Focus', 'Rest']));

    await tester.tap(find.text('Focus'));
    await tester.pump();
    expect(selected, {'Rest'});
  });

  testWidgets('learning tag picker offers add theme', (tester) async {
    var added = false;
    await tester.pumpWidget(
      wrapWithEnglishL10n(
        Scaffold(
          body: LearningTagPicker(
            optionIds: LearningTags.catalog,
            selectedIds: const {},
            onToggle: (_) {},
            addLabel: 'Add theme',
            onAdd: () => added = true,
          ),
        ),
      ),
    );

    await tester.tap(find.text('Add theme'));
    expect(added, isTrue);
  });
}
