import 'package:flutter/material.dart';
import 'package:z_mart/utils/theme/custom_themes/appbar_theme.dart';
import 'package:z_mart/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:z_mart/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:z_mart/utils/theme/custom_themes/chip_theme.dart';
import 'package:z_mart/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:z_mart/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:z_mart/utils/theme/custom_themes/text_field_theme.dart';
import 'package:z_mart/utils/theme/custom_themes/text_theme.dart';

class ZAppTheme {
  ZAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: ZTextTheme.lightTextTheme,
    chipTheme: ZChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: ZAppBarTheme.lightAppbarTheme,
    checkboxTheme: ZCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: ZBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: ZElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: ZOutlinedButton.lightOutlinedButtonTheme,
    inputDecorationTheme: ZTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: ZTextTheme.darkTextTheme,
    chipTheme: ZChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: ZAppBarTheme.darkAppbarTheme,
    checkboxTheme: ZCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: ZBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: ZElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: ZOutlinedButton.darkOutlinedButtonTheme,
    inputDecorationTheme: ZTextFormFieldTheme.darkInputDecorationTheme,
  );
}
