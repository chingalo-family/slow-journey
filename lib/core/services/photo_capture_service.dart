import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'journey_repository.dart';
import 'photo_crop_settings.dart';

class PhotoCaptureService {
  PhotoCaptureService(this._repository);

  final JourneyRepository _repository;
  final ImagePicker _picker = ImagePicker();
  final ImageCropper _cropper = ImageCropper();

  Future<String?> pickFromGallery({
    required String cropTitle,
    required String cropDoneLabel,
  }) async {
    final picked = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: PhotoCropSettings.pickMaxWidth.toDouble(),
      imageQuality: PhotoCropSettings.pickQuality,
    );
    if (picked == null) return null;
    return cropAndSave(
      sourcePath: picked.path,
      cropTitle: cropTitle,
      cropDoneLabel: cropDoneLabel,
    );
  }

  Future<String?> cropAndSave({
    required String sourcePath,
    required String cropTitle,
    required String cropDoneLabel,
  }) async {
    final cropped = await _cropper.cropImage(
      sourcePath: sourcePath,
      maxWidth: PhotoCropSettings.maxOutputEdge,
      maxHeight: PhotoCropSettings.maxOutputEdge,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: PhotoCropSettings.compressQuality,
      uiSettings: PhotoCropSettings.uiSettings(
        title: cropTitle,
        doneLabel: cropDoneLabel,
      ),
    );
    if (cropped == null) return null;
    return _repository.savePhoto(File(cropped.path));
  }
}
