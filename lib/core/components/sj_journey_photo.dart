import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../services/photo_crop_settings.dart';
import '../utils/l10n_util.dart';
import 'brand_marks.dart';

enum SjJourneyPhotoKind { slot, feed }

class SjJourneyPhoto extends StatelessWidget {
  const SjJourneyPhoto({
    super.key,
    required this.photoPath,
    required this.kind,
    this.onTap,
    this.heroTag,
  });

  final String? photoPath;
  final SjJourneyPhotoKind kind;
  final VoidCallback? onTap;
  final String? heroTag;

  bool get _hasPhoto => photoPath != null && File(photoPath!).existsSync();

  @override
  Widget build(BuildContext context) {
    final borderRadius = kind == SjJourneyPhotoKind.slot
        ? BorderRadius.circular(18)
        : const BorderRadius.vertical(top: Radius.circular(22));
    return Material(
      color: AppColors.mistPhoto,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: _hasPhoto ? _filled(context) : _empty(context),
      ),
    );
  }

  Widget _filled(BuildContext context) {
    final viewportHeight = MediaQuery.sizeOf(context).height;
    final image = Image.file(
      File(photoPath!),
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      gaplessPlayback: true,
      errorBuilder: (_, error, stackTrace) {
        return ColoredBox(
          color: AppColors.mistPhoto,
          child: Icon(
            Icons.photo_outlined,
            color: AppColors.sagePrimaryDark,
          ),
        );
      },
    );
    final framed = LayoutBuilder(
      builder: (context, constraints) {
        final height = PhotoCropSettings.displayHeight(
          width: constraints.maxWidth,
          viewportHeight: viewportHeight,
        );
        final framedImage = SizedBox(
          width: constraints.maxWidth,
          height: height,
          child: image,
        );
        if (heroTag == null) return framedImage;
        return Hero(
          tag: heroTag!,
          child: framedImage,
        );
      },
    );
    if (kind != SjJourneyPhotoKind.slot) return framed;
    return Stack(
      children: [
        framed,
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.creamSurface,
            child: Icon(
              Icons.crop,
              size: 18,
              color: AppColors.sagePrimaryDark,
            ),
          ),
        ),
      ],
    );
  }

  Widget _empty(BuildContext context) {
    if (kind == SjJourneyPhotoKind.feed) {
      return const SizedBox(
        height: 120,
        width: double.infinity,
        child: Center(child: LeafMark(size: 44)),
      );
    }
    return SizedBox(
      height: 132,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_a_photo_outlined,
            size: 28,
            color: AppColors.sagePrimaryDark,
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.addAPhoto,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.sagePrimaryDark,
                ),
          ),
        ],
      ),
    );
  }
}
