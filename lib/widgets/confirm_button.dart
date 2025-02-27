import 'package:flutter/material.dart';
import 'package:rayhan/utils/app_colors.dart';

class ConfirmButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;
  final String? text;

  const ConfirmButton({
    super.key,
    required this.isEnabled,
    required this.onPressed,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 382,
      height: 58,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? AppColors.primary : Colors.grey.shade300,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.all(16),
        ),
        child: Text(text ?? "تأكيد", style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
