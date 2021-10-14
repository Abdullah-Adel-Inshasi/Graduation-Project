
import 'package:flutter/material.dart';

class PressableChip extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const PressableChip({Key? key, required this.label, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
