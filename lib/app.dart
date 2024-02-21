import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:z_mart/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ZAppTheme.lightTheme,
      darkTheme: ZAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}