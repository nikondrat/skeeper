import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:skeeper/src/data.dart';

part 'password_store.g.dart';

class PasswordStore extends _PasswordStore with _$PasswordStore {
  PasswordStore();
}

abstract class _PasswordStore with Store {
  GeneratorSettings settings =
      Provider.of<Dependencies>(navKey.currentContext!).generatorSettings;

  @observable
  String password = '';

  static final PasswordGenerator generator = PasswordGenerator();

  @action
  void generatePassword() {
    password = generator.generate(settings);
  }
}
