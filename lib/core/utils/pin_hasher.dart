import 'dart:convert';

import 'package:crypto/crypto.dart';

class PinHasher {
  static const _pepper = 'slow-journey-local-pin';
  static const length = 4;
  static final _digitsOnly = RegExp(r'^\d+$');

  static bool isValid(String pin) {
    return pin.length == length && _digitsOnly.hasMatch(pin);
  }

  static String hash(String pin, String profileId) {
    final bytes = utf8.encode('$profileId:$_pepper:$pin');
    return sha256.convert(bytes).toString();
  }

  static bool matches(String pin, String profileId, String hashValue) =>
      hash(pin, profileId) == hashValue;
}
