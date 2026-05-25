import 'package:flutter/material.dart';

class CustomSectionTitle extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onTap;

  const CustomSectionTitle({
    super.key,
    required this.title,
    this.actionText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        if (actionText != null)
          GestureDetector(
            onTap: onTap,
            child: Text(
              actionText!,
              style: const TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}