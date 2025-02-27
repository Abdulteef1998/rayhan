import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rayhan/screens/signup_screen.dart';

void main() {
  runApp(const RayhanApp());
}

class RayhanApp extends StatelessWidget {
  const RayhanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale("ar")], // دعم اللغة العربية فقط
        locale: const Locale("ar"),
        home: const SignupScreen(),
      ),
    );
  }
}
