import 'package:delightful_toast/delight_toast.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:skeeper/src/data.dart';

part 'password_list_store.g.dart';

class PasswordListStore extends _PasswordListStore with _$PasswordListStore {
  PasswordListStore();
}

abstract class _PasswordListStore with Store {
  @observable
  ObservableList<PasswordModel> passwords = ObservableList<PasswordModel>();

  @action
  void addPassword(PasswordModel password) {
    passwords.add(password);

    DelightToastBar(
            autoDismiss: true,
            builder: (context) =>
                CustomToastWidget(icon: Icons.done, title: t.funcs.created))
        .show(navKey.currentContext!);
  }

  @action
  void updatePassword(String id, PasswordModel newPassword) {
    final int index = passwords.indexWhere((e) => e.id == id);

    if (index != -1) {
      passwords[index] = newPassword;
    } else {
      DelightToastBar(
          autoDismiss: true,
          builder: (context) => CustomToastWidget(
              icon: Icons.error,
              title: t.errors.not_found)).show(navKey.currentContext!);
    }
  }

  @action
  void removePassword(String id) {
    passwords.removeWhere((e) => e.id == id);
    DelightToastBar(
        autoDismiss: true,
        builder: (context) => CustomToastWidget(
            icon: Icons.delete_outline,
            title: t.funcs.removed)).show(navKey.currentContext!);
  }
}
