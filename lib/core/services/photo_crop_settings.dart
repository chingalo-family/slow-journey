import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import '../constants/app_colors.dart';

class PhotoCropSettings {
  static const landscapeRatio = 16 / 9;
  static const maxOutputEdge = 1920;
  static const compressQuality = 88;
  static const pickMaxWidth = 4096;
  static const pickQuality = 95;

  static double displayHeight({
    required double width,
    required double viewportHeight,
  }) {
    final fromRatio = width / landscapeRatio;
    final viewportCap = math.max(168.0, viewportHeight * 0.42);
    return math.min(fromRatio, viewportCap);
  }

  static const aspectRatioPresets = <CropAspectRatioPresetData>[
    CropAspectRatioPreset.ratio16x9,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.original,
  ];

  static List<PlatformUiSettings> uiSettings({
    required String title,
    required String doneLabel,
  }) {
    return [
      AndroidUiSettings(
        toolbarTitle: title,
        toolbarColor: AppColors.sagePrimaryDark,
        toolbarWidgetColor: Colors.white,
        statusBarLight: false,
        navBarLight: true,
        backgroundColor: AppColors.creamBg,
        activeControlsWidgetColor: AppColors.sagePrimary,
        cropFrameColor: AppColors.sagePrimary,
        cropGridColor: AppColors.sagePrimarySoft,
        dimmedLayerColor: const Color(0x99000000),
        lockAspectRatio: false,
        initAspectRatio: CropAspectRatioPreset.ratio16x9,
        aspectRatioPresets: aspectRatioPresets,
      ),
      IOSUiSettings(
        title: title,
        doneButtonTitle: doneLabel,
        aspectRatioLockEnabled: false,
        resetAspectRatioEnabled: true,
        aspectRatioPresets: aspectRatioPresets,
      ),
    ];
  }
}
