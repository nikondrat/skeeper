import 'package:mobx/mobx.dart';

part 'generator_settings.g.dart';

class GeneratorSettings extends _GeneratorSettings with _$GeneratorSettings {
  GeneratorSettings();
}

abstract class _GeneratorSettings with Store {
  @observable
  int length = 12;

  @action
  void setLength(int length) => this.length = length;

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
}
