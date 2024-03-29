import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_mart/bindings/general_bindings.dart';
import 'package:z_mart/routes/app_routes.dart';
import 'package:z_mart/utils/constants/colors.dart';
import 'package:z_mart/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ZAppTheme.lightTheme,
      darkTheme: ZAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,

      /// Show loader or circular progress indicator on loading anything
      home: const Scaffold(
        backgroundColor: ZColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
