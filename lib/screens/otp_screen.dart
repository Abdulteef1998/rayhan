import 'package:flutter/material.dart';

import '../widgets/confirm_button.dart';
import '../widgets/otp_input_field.dart';
import '../widgets/resend_code_timer.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController otpController = TextEditingController();
  bool isButtonEnabled = false;

  void _onOtpEntered(String value) {
    setState(() {
      isButtonEnabled = value.length == 4;
    });
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.check_circle, color: Color(0xFF1B7754), size: 50),
                SizedBox(height: 10),
                Text(
                  "تم التحقق بنجاح!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                " أدخل رمز ال OTP 🔐",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "تحقق من صندوق رسائلك بحثًا عن رسالة من ريحان، "
                "أدخل رمز التحقق لمرة واحدة أدناه للمتابعة في تأكيد حسابك.",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(height: 30),
              OTPInputField(
                controller: otpController,
                onOtpEntered: _onOtpEntered,
              ),
              const SizedBox(height: 20),
              const ResendCodeTimer(),
              const SizedBox(height: 40),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: ConfirmButton(
            text: 'تحقق',
            isEnabled: isButtonEnabled,
            onPressed: () => _showSuccessDialog(context),
          ),
        ),
      ),
    );
  }
}
