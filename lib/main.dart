import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sampleweb/view/Login.dart';
import 'package:sampleweb/view/Register.dart';
import 'package:sampleweb/view/sample_ui.dart';// Add your actual login screen // Add your actual register screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690), // Set the design size based on your design
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
          ),
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => Homescreen()),
            GetPage(name: '/login', page: () => LoginScreen()),
            GetPage(name: '/register', page: () => RegisterScreen()),
          ],
        );
      },
    );
  }
}