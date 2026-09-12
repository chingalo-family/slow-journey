import 'package:flutter_test/flutter_test.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:slowjourney/core/services/photo_crop_settings.dart';

void main() {
  test('photo crop defaults to landscape 16:9 among supported presets', () {
    expect(PhotoCropSettings.landscapeRatio, 16 / 9);
    expect(
      PhotoCropSettings.aspectRatioPresets.first,
      CropAspectRatioPreset.ratio16x9,
    );
    expect(
      PhotoCropSettings.aspectRatioPresets,
      containsAll(<CropAspectRatioPresetData>[
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.original,
      ]),
    );
  });

  test('photo display height stays 16:9 until the viewport would overflow', () {
    expect(
      PhotoCropSettings.displayHeight(width: 360, viewportHeight: 800),
      360 / (16 / 9),
    );
    expect(
      PhotoCropSettings.displayHeight(width: 900, viewportHeight: 390),
      lessThan(900 / (16 / 9)),
    );
  });
}
