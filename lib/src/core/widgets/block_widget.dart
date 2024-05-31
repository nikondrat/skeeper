import 'package:flutter/material.dart';
import 'package:skeeper/src/data.dart';

class BlockWidget extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;
  final EdgeInsets? margin;
  final Widget child;
  const BlockWidget(
      {super.key, this.onTap, this.color, this.margin, required this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme scheme = themeData.colorScheme;

    return GestureDetector(
      onTap: () {
        onTap != null ? onTap!() : null;
      },
      child: Container(
          padding: const BodyPadding.medium(),
          margin: margin,
          decoration: BoxDecoration(
              color: color ?? scheme.primary,
              borderRadius: ObjectRadius.medium()),
          child: child),
    );
  }
}
