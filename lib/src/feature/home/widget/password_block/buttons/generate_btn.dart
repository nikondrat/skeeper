import 'package:flutter/material.dart';
import 'package:skeeper/src/data.dart';

class GenerateButton extends StatelessWidget {
  final ColorScheme scheme;
  final PasswordStore store;
  const GenerateButton({super.key, required this.scheme, required this.store});

  @override
  Widget build(BuildContext context) {
    return BlockWidget(
      color: scheme.onPrimary,
      onTap: () {
        store.generatePassword();
      },
      child: const Center(
        child: Icon(Icons.gesture_outlined),
      ),
    );
  }
}
