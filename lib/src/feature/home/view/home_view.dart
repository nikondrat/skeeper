import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeeper/src/data.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsStore = Provider.of<Dependencies>(context).settingsStore;

    return Provider(
      create: (_) => PasswordStore(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          leading: IconButton(
              onPressed: () {
                settingsStore.setTheme(
                    AppThemeStore(mode: ThemeMode.light, seed: Colors.red));
              },
              icon: const Icon(Icons.edit)),
        ),
        body: AppBody(
          builder: (windowWidth, windowSize) {
            return CustomScrollView(
              slivers: [
                SliverPadding(
                    padding: HorizontalSpacing.centered(windowWidth),
                    sliver: PasswordBlock(windowSize: windowSize)),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverPadding(
                    padding: HorizontalSpacing.centered(windowWidth),
                    sliver: const PreferencesWidget()),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                SliverPadding(
                    padding: HorizontalSpacing.centered(windowWidth),
                    sliver: SliverList.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Text('$index');
                      },
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
