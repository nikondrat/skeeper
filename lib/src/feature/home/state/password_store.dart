import 'dart:math';

import 'package:mobx/mobx.dart';

part 'password_store.g.dart';

class PasswordStore extends _PasswordStore with _$PasswordStore {
  PasswordStore();
}

abstract class _PasswordStore with Store {
  @observable
  String password = '';

  @observable
  int length = 12;

  @action
  void setLength(int length) {
    this.length = length;
  }

  @observable
  bool includeNumbers = true;

  @action
  void toggleIncludeNumbers() => includeNumbers = !includeNumbers;

  @observable
  bool includeSpecialChars = true;

  @action
  void toggleIncludeSpecialChars() =>
      includeSpecialChars = !includeSpecialChars;

  @observable
  bool includeUppercase = true;

  @action
  void toggleIncludeUppercase() => includeUppercase = !includeUppercase;

  @observable
  bool includeLowercase = true;

  @action
  void toggleIncludeLowercase() => includeLowercase = !includeLowercase;

  @action
  void generatePassword() {
    const numbers = '0123456789';
    const specialChars = '!@#\$%^&*()_+[]{}|;:,.<>?';
    const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowercase = 'abcdefghijklmnopqrstuvwxyz';

    String chars = '';
    if (includeNumbers) chars += numbers;
    if (includeSpecialChars) chars += specialChars;
    if (includeUppercase) chars += uppercase;
    if (includeLowercase) chars += lowercase;

    if (chars.isEmpty) {
      throw Exception('No character sets selected for password generation.');
    }

    Random rnd = Random.secure();
    password =
        List.generate(length, (index) => chars[rnd.nextInt(chars.length)])
            .join();
  }
}
