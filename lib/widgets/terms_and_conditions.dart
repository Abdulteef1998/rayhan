import 'package:flutter/material.dart';
import 'package:rayhan/utils/app_colors.dart';

class TermsAndConditions extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const TermsAndConditions({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) => onChanged(value ?? false),
          activeColor: AppColors.primary,
          checkColor: Colors.white,
        ),
        const Expanded(
          child: Text.rich(
            TextSpan(
              text: "من خلال إنشاء حساب، فإنك توافق على ",
              style: TextStyle(fontSize: 14),
              children: [
                TextSpan(
                  text: "الشروط",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: " و "),
                TextSpan(
                  text: "الأحكام الخاصة بنا",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
