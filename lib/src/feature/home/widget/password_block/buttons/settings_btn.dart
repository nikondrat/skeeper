import 'package:flutter/material.dart';
import 'package:skeeper/src/data.dart';

class SettingsButton extends StatelessWidget {
  final ColorScheme scheme;
  const SettingsButton({super.key, required this.scheme});

  @override
  Widget build(BuildContext context) {
    return BlockWidget(
      color: scheme.onPrimary,
      child: GestureDetector(
        onTap: () {},
        child: const Icon(Icons.settings),
      ),
    );
  }
}
