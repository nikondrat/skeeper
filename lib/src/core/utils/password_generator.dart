import 'dart:math';

import 'package:skeeper/src/data.dart';

class PasswordGenerator {
  static const _numbers = '0123456789';
  static const _specialChars = '!@#\$%^&*()_+[]{}|;:,.<>?';
  static const _uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const _lowercase = 'abcdefghijklmnopqrstuvwxyz';

  String generate(GeneratorSettings settings) {
    String chars = '';
    if (settings.includeNumbers) chars += _numbers;
    if (settings.includeSpecialChars) chars += _specialChars;
    if (settings.includeUppercase) chars += _uppercase;
    if (settings.includeLowercase) chars += _lowercase;

    if (chars.isEmpty) {
      throw Exception('No character sets selected for password generation.');
    }

    final Random rnd = Random.secure();
    final String password = List.generate(
        settings.length, (index) => chars[rnd.nextInt(chars.length)]).join();

    return password;
  }
}
