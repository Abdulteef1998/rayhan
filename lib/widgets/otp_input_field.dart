import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:rayhan/utils/app_colors.dart';

class OTPInputField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onOtpEntered;

  const OTPInputField({
    super.key,
    required this.controller,
    required this.onOtpEntered,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 84,
      height: 65,
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400, width: 1.5),
      ),
    );

    return Pinput(
      controller: controller,
      length: 4,
      keyboardType: TextInputType.number,
      onChanged: onOtpEntered,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: AppColors.primary, width: 2),
        ),
      ),
      submittedPinTheme: defaultPinTheme, // 🔹 جعل اللون ثابتًا بعد الإدخال
    );
  }
}
