import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:skeeper/src/data.dart';

class PasswordBlock extends StatelessWidget {
  final WindowSize windowSize;
  const PasswordBlock({super.key, required this.windowSize});

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

    return SliverToBoxAdapter(
      child: Container(
          padding: BodyPadding.medium(),
          decoration: BoxDecoration(
              color: scheme.primary, borderRadius: ObjectRadius.medium()),
          child: Column(
            children: [
              Observer(
                  builder: (_) => Padding(
                        padding: BodyPadding.large(),
                        child: FilledButton(
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: store.password));
                              DelightToastBar(
                                      autoDismiss: true,
                                      builder: (context) => CustomToastWidget(
                                          icon: Icons.info, title: 'Copied'))
                                  .show(navKey.currentContext!);
                            },
                            child: Text(store.password,
                                style: passwordStyle!
                                    .copyWith(color: scheme.onPrimary))),
                      )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox.shrink(),
                  ElevatedButton(
                      onPressed: () {
                        store.generatePassword();
                      },
                      child: Text('Generate')),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                ],
              ),
            ],
          )),
    );
  }
}
