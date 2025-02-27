import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ResendCodeTimer extends StatefulWidget {
  const ResendCodeTimer({super.key});

  @override
  State<ResendCodeTimer> createState() => _ResendCodeTimerState();
}

class _ResendCodeTimerState extends State<ResendCodeTimer> {
  int secondsRemaining = 60;
  bool enableResend = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
        } else {
          enableResend = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void resendCode() {
    setState(() {
      secondsRemaining = 60;
      enableResend = false;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            enableResend
                ? "يمكنك إعادة إرسال الكود"
                : "يمكنك إعادة إرسال الكود خلال $secondsRemaining ثانية",
            style: TextStyle(
              color: enableResend ? Colors.black : Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        if (enableResend)
          TextButton(
            onPressed: resendCode,
            child: const Text(
              "أعد إرسال الرمز",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
      ],
    );
  }
}
