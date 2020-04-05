import 'dart:convert';

import 'package:crypto/crypto.dart';

class CryptographyUtils {
  static String encryptPassword(String password) {
    final passwordInBytes = utf8.encode(password);

    return sha256.convert(passwordInBytes).toString();
  }
}
