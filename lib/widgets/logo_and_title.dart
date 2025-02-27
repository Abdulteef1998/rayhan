import 'package:flutter/material.dart';
import 'package:rayhan/utils/app_colors.dart';

class LogoAndTitle extends StatelessWidget {
  const LogoAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "مرحبًا بك في ريحان! 👋",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          "العديد من الخدمات والمنتجات بخصومات كبيرة في انتظارك.",
          style: TextStyle(
            fontSize: 18,
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
