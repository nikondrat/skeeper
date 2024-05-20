import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:skeeper/src/data.dart';

class PreferencesWidget extends StatelessWidget {
  const PreferencesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final PasswordStore store = Provider.of(context);
    final ThemeData themeData = Theme.of(context);
    final ColorScheme scheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;

    return SliverToBoxAdapter(
        child: Container(
            padding: BodyPadding.medium(),
            decoration: BoxDecoration(
                color: scheme.primary, borderRadius: ObjectRadius.medium()),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(builder: (_) {
                  return Slider(
                    max: 128,
                    value: store.length.toDouble(),
                    onChanged: (v) => store.setLength(v.toInt()),
                    thumbColor: scheme.onPrimary,
                    activeColor: scheme.onPrimary,
                    inactiveColor: scheme.onPrimaryContainer,
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('includeNumbers',
                        style: textTheme.bodyLarge!
                            .copyWith(color: scheme.onPrimary)),
                    Observer(builder: (context) {
                      return Switch(
                        value: store.includeNumbers,
                        onChanged: (_) => store.toggleIncludeNumbers(),
                        activeTrackColor: scheme.onPrimary,
                        activeColor: scheme.primary,
                      );
                    }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('includeSpecialChars',
                        style: textTheme.bodyLarge!
                            .copyWith(color: scheme.onPrimary)),
                    Observer(builder: (context) {
                      return Switch(
                        value: store.includeSpecialChars,
                        onChanged: (_) => store.toggleIncludeSpecialChars(),
                        activeTrackColor: scheme.onPrimary,
                        activeColor: scheme.primary,
                      );
                    }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('includeUppercase',
                        style: textTheme.bodyLarge!
                            .copyWith(color: scheme.onPrimary)),
                    Observer(builder: (context) {
                      return Switch(
                        value: store.includeUppercase,
                        onChanged: (_) => store.toggleIncludeUppercase(),
                        activeTrackColor: scheme.onPrimary,
                        activeColor: scheme.primary,
                      );
                    }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('includeLowercase',
                        style: textTheme.bodyLarge!
                            .copyWith(color: scheme.onPrimary)),
                    Observer(builder: (context) {
                      return Switch(
                        value: store.includeLowercase,
                        onChanged: (_) => store.toggleIncludeLowercase(),
                        activeTrackColor: scheme.onPrimary,
                        activeColor: scheme.primary,
                      );
                    }),
                  ],
                ),
              ],
            )));
  }
}
