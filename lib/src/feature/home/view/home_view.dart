import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/src/data.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsStore = Provider.of<Dependencies>(context).settingsStore;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        leading: IconButton(
            onPressed: () {
              settingsStore.setTheme(
                  AppThemeStore(mode: ThemeMode.light, seed: Colors.red));
            },
            icon: Icon(Icons.edit)),
      ),
      body: AppBody(
        builder: (windowWidth, windowSize) {
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: HorizontalSpacing.centered(windowWidth),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: switch (windowSize) {
                      WindowSize.compact => 2,
                      <= WindowSize.expanded => 3,
                      _ => 4,
                    },
                  ),
                  itemBuilder: (context, index) => ColoredBox(
                    color: Theme.of(context).colorScheme.primary,
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
