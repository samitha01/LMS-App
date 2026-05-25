import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final String status;

  const StatusChip({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {

    Color chipColor =
    status == "Submitted"
        ? Colors.green
        : Colors.orange;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: chipColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(
        status,
        style: TextStyle(
          color: chipColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}