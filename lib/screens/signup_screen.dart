import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rayhan/screens/otp_screen.dart';
import 'package:rayhan/widgets/confirm_button.dart';
import 'package:rayhan/widgets/logo_and_title.dart';
import 'package:rayhan/widgets/phone_input_field.dart';
import 'package:rayhan/widgets/terms_and_conditions.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController phoneController = TextEditingController();
  bool isChecked = false;
  String? errorMessage;

  void _onConfirmPressed() async {
    String phoneNumber = phoneController.text.trim();

    if (phoneNumber.isEmpty) {
      setState(() {
        errorMessage = "يرجى إدخال رقم الهاتف";
      });
    } else {
      setState(() {
        errorMessage = null;
      });

      if (isChecked) {
        _showSuccessDialog(context);
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) Navigator.pop(context);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OTPScreen()),
        );
        phoneController.clear();
      }
    }
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
              children: [
                const Icon(
                  FontAwesomeIcons.circleNotch,
                  color: Colors.green,
                  size: 50,
                ),
                const SizedBox(height: 10),
                const Text(
                  "تسجيل الدخول",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
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
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Image.asset(
                              'assets/images/signup.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const LogoAndTitle(),
                      const SizedBox(height: 32),
                      const Text(
                        'رقم الهاتف',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      PhoneInputField(controller: phoneController),
                      if (errorMessage != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          errorMessage!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ],
                      const SizedBox(height: 20),
                      TermsAndConditions(
                        isChecked: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ConfirmButton(
            isEnabled: isChecked,
            onPressed: _onConfirmPressed,
          ),
        ),
      ),
    );
  }
}
