import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/presentation/Resourses/color_manager.dart';

ThemeData GetApplicatinTheme() {
  return ThemeData(
      appBarTheme: AppBarTheme(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
        iconTheme: IconThemeData(color: Colors.black, size: 25),
        color: Colors.white,
        elevation: 0.0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: ColorManager.Text, fontSize: 14),
        contentPadding: EdgeInsets.all(0.8),
        labelStyle: TextStyle(color: ColorManager.Text, fontSize: 14),
        errorStyle: TextStyle(color: ColorManager.Error, fontSize: 14),
        enabledBorder: OutlineInputBorder(),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.black12,
        dividerColor: Colors.black,
        labelStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.green));
}
