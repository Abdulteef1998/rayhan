import 'package:flutter/material.dart';
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

  void _onConfirmPressed() {
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OTPScreen()),
        );
      }
    }
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
