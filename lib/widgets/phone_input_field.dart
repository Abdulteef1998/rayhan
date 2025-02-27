import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class PhoneInputField extends StatefulWidget {
  final TextEditingController controller;
  const PhoneInputField({super.key, required this.controller});

  @override
  _PhoneInputFieldState createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  String countryCode = "+964";
  String countryFlag = "🇮🇶";

  void _selectCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          countryCode = "${country.phoneCode}";
          countryFlag = country.flagEmoji;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: _selectCountry,
            child: Row(
              children: [
                Text(countryFlag, style: const TextStyle(fontSize: 22)),
                const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: TextField(
              controller: widget.controller,
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              decoration: const InputDecoration(
                hintText: "اكتب رقمك هنا",
                hintStyle: TextStyle(
                  color: Colors.black26,

                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
              ),
            ),
          ),

          const SizedBox(width: 10),
          Text(
            countryCode,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
