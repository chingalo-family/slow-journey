import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_colors.dart';
import '../../core/utils/l10n_util.dart';

class JourneyPhotoViewerPage extends StatelessWidget {
  const JourneyPhotoViewerPage({
    super.key,
    required this.photoPath,
    this.heroTag,
    this.onRecrop,
    this.onChange,
  });

  final String photoPath;
  final String? heroTag;
  final Future<void> Function()? onRecrop;
  final Future<void> Function()? onChange;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final canEdit = onRecrop != null || onChange != null;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.darkBg,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.darkText,
          elevation: 0,
          title: Text(l10n.viewPhoto),
        ),
        body: Column(
          children: [
            Expanded(
              child: InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Center(
                  child: heroTag == null
                      ? _photo()
                      : Hero(
                          tag: heroTag!,
                          child: _photo(),
                        ),
                ),
              ),
            ),
            if (canEdit)
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: Row(
                    children: [
                      if (onChange != null)
                        Expanded(
                          child: TextButton.icon(
                            onPressed: () async => onChange!(),
                            icon: const Icon(Icons.add_a_photo_outlined),
                            label: Text(l10n.changePhoto),
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.darkText,
                            ),
                          ),
                        ),
                      if (onRecrop != null)
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () async => onRecrop!(),
                            icon: const Icon(Icons.crop),
                            label: Text(l10n.cropPhoto),
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.sagePrimary,
                              foregroundColor: AppColors.darkBg,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _photo() {
    if (!File(photoPath).existsSync()) {
      return Icon(
        Icons.photo_outlined,
        size: 72,
        color: AppColors.darkTextSecondary,
      );
    }
    return Image.file(
      File(photoPath),
      fit: BoxFit.contain,
      gaplessPlayback: true,
      errorBuilder: (_, error, stackTrace) {
        return Icon(
          Icons.photo_outlined,
          size: 72,
          color: AppColors.darkTextSecondary,
        );
      },
    );
  }
}
