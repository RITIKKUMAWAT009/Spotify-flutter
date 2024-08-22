import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton({super.key, this.onPressed, required this.title, this.height});

  final VoidCallback? onPressed;
  final String title;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
style:ElevatedButton.styleFrom(
  minimumSize:Size.fromHeight(height ?? 80),
),
        child: Text(
          title,
        ));
  }
}
