import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'password_model.g.dart';

class PasswordModel extends _PasswordModel with _$PasswordModel {
  PasswordModel({
    required super.value,
    required super.note,
  });
}

abstract class _PasswordModel with Store {
  _PasswordModel({
    required this.value,
    required this.note,
  });

  @observable
  String id = const Uuid().v4();

  @observable
  String value;

  @observable
  String note;

  @observable
  DateTime createdAt = DateTime.now();

  @observable
  DateTime updatedAt = DateTime.now();

  @action
  void setValue(String v) {
    value = v;
    updatedAt = DateTime.now();
  }

  @action
  void setNote(String v) {
    note = v;
    updatedAt = DateTime.now();
  }
}
