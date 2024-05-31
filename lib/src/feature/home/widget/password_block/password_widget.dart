import 'package:delightful_toast/delight_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:skeeper/src/data.dart';

class PasswordWidget extends StatelessWidget {
  final WindowSize windowSize;
  const PasswordWidget({super.key, required this.windowSize});

  @override
  Widget build(BuildContext context) {
    final PasswordStore store = Provider.of(context);
    final ThemeData themeData = Theme.of(context);
    final ColorScheme scheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;

    final TextStyle? passwordStyle = switch (windowSize) {
      WindowSize.compact => textTheme.headlineSmall,
      WindowSize.medium => textTheme.headlineMedium,
      WindowSize.expanded => textTheme.headlineLarge,
      WindowSize.large => textTheme.displaySmall,
      WindowSize.extraLarge => textTheme.displayMedium,
    };

    return BlockWidget(
      margin: const EdgeInsets.only(left: Values.kDefaultMediumPadding),
      color: scheme.onPrimary,
      onTap: () {
        Clipboard.setData(ClipboardData(text: store.password));
        DelightToastBar(
                autoDismiss: true,
                builder: (context) =>
                    CustomToastWidget(icon: Icons.copy, title: t.funcs.copy))
            .show(context);
      },
      child: Observer(
        builder: (_) {
          return Center(
            child: Text(
              store.password,
              style: passwordStyle ?? const TextStyle(),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
