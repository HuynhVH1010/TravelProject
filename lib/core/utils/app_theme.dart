import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../values/colors.dart';
import '../values/strings.dart';

class AppTheme {
  //light mode
  get lightTheme => ThemeData(
    //useMaterial3: false,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,//for ios
        statusBarIconBrightness: Brightness.dark,// for android
      ),
      color: Colors.white,
      centerTitle: true,
      elevation: 3.0,
      scrolledUnderElevation: 5.0,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleSpacing: 0,
      titleTextStyle: kTextStyleMedium.copyWith(
        color: Colors.black,
        fontSize: 18,
      ),
      toolbarTextStyle: kTextStyleNormal,
    ),
    primarySwatch: Colors.grey,
    canvasColor: kPrimaryBackgroundColor,
    dividerColor: Colors.black12,
    indicatorColor: Colors.black12,
    shadowColor: Colors.black26,
    splashColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      titleLarge: kTextStyleSemiBold,
      titleMedium: kTextStyleMedium,
      titleSmall: kTextStyleNormal,
      bodyLarge: kTextStyleSemiBold,
      bodyMedium: kTextStyleMedium,
      bodySmall: kTextStyleNormal,
      labelLarge: kTextStyleSemiBold,
      labelMedium: kTextStyleMedium,
      labelSmall: kTextStyleNormal,
    ),
    iconTheme: IconThemeData(color: Colors.black,),
    inputDecorationTheme: inputDecorationTheme(),
  );

  //dark mode
  get darkTheme => ThemeData(
    //useMaterial3: false,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,//for ios
        statusBarIconBrightness: Brightness.light,// for android
      ),
      color: kSecondColor,
      centerTitle: true,
      elevation: 3.0,
      scrolledUnderElevation: 5.0,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleSpacing: 0,
      titleTextStyle: kTextStyleMedium.copyWith(
        color: Colors.white,
        fontSize: 18,
      ),
      toolbarTextStyle: kTextStyleNormal,
    ),
    primarySwatch: Colors.grey,
    canvasColor: kSecondBackgroundColor,
    dividerColor: Colors.white54,
    indicatorColor: Colors.white54,
    shadowColor: Colors.white54,
    scaffoldBackgroundColor: Color(0x00151515),
    splashColor: Colors.black,
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      titleLarge: kTextStyleSemiBold,
      titleMedium: kTextStyleMedium,
      titleSmall: kTextStyleNormal,
      bodyLarge: kTextStyleSemiBold,
      bodyMedium: kTextStyleMedium,
      bodySmall: kTextStyleNormal,
      labelLarge: kTextStyleSemiBold,
      labelMedium: kTextStyleMedium,
      labelSmall: kTextStyleNormal,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    inputDecorationTheme: inputDecorationTheme(),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: Colors.grey.shade600),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

InputDecorationTheme commentDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  );
  return InputDecorationTheme(
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}