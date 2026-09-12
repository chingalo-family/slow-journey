import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../utils/app_date.dart';
import '../utils/l10n_util.dart';

class BirthdayPickerTile extends StatelessWidget {
  const BirthdayPickerTile({
    super.key,
    required this.value,
    required this.onPicked,
    this.label,
  });

  final DateTime? value;
  final ValueChanged<DateTime> onPicked;
  final String? label;

  static DateTime? parseStored(String? raw) {
    if (raw == null || raw.isEmpty) {
      return null;
    }
    return DateTime.tryParse(raw);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final tile = ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      minVerticalPadding: 14,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      tileColor: Theme.of(context).inputDecorationTheme.fillColor,
      title: Text(
        value == null ? l10n.hintBirthdayOptional : AppDate.monthDay(value),
        style: TextStyle(
          color: value == null
              ? context.sjHint
              : Theme.of(context).colorScheme.onSurface,
        ),
      ),
      trailing: Icon(Icons.cake_outlined, color: context.sjAccentSoft),
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          firstDate: DateTime(1940),
          lastDate: DateTime.now(),
          initialDate: value ?? DateTime(1994, 10, 12),
        );
        if (picked != null) {
          onPicked(picked);
        }
      },
    );
    final heading = label;
    if (heading == null || heading.isEmpty) {
      return tile;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(heading, style: Theme.of(context).textTheme.bodySmall),
        ),
        tile,
      ],
    );
  }
}
