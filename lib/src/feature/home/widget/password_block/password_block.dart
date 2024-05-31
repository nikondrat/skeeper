import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeeper/src/data.dart';
import 'package:skeeper/src/feature/home/widget/password_block/password_widget.dart';
import 'buttons/buttons.dart';

class PasswordBlock extends StatelessWidget {
  final WindowSize windowSize;
  const PasswordBlock({super.key, required this.windowSize});

  @override
  Widget build(BuildContext context) {
    final PasswordStore store = Provider.of(context);
    final ThemeData themeData = Theme.of(context);
    final ColorScheme scheme = themeData.colorScheme;

    return SliverToBoxAdapter(
        child: IntrinsicHeight(
            child: BlockWidget(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Expanded(child: SettingsButton(scheme: scheme)),
              const SizedBox(
                height: Values.kDefaultMediumPadding,
              ),
              Expanded(child: BookmarkButton(scheme: scheme)),
            ],
          ),
          const SizedBox(
            width: Values.kDefaultMediumPadding,
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Expanded(child: GenerateButton(scheme: scheme, store: store)),
              ],
            ),
          ),
          Flexible(flex: 6, child: PasswordWidget(windowSize: windowSize)),
        ],
      ),
    )));
  }
}
