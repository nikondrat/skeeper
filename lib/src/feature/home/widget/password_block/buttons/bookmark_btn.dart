import 'package:flutter/material.dart';
import 'package:skeeper/src/data.dart';

class BookmarkButton extends StatelessWidget {
  final ColorScheme scheme;
  const BookmarkButton({super.key, required this.scheme});

  @override
  Widget build(BuildContext context) {
    return BlockWidget(
      color: scheme.onPrimary,
      child: GestureDetector(
        onTap: () {},
        child: const Icon(Icons.bookmark_outline),
      ),
    );
  }
}
