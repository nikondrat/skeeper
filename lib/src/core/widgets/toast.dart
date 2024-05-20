import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';

class CustomToastWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomToastWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ToastCard(
      title: Text(
        title,
      ),
      leading: Icon(icon),
    );
  }
}
