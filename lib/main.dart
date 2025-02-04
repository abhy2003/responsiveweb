import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampleweb/view/sample_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil within the build method using the BuildContext
    ScreenUtil.init(
      context,
      designSize: Size(375, 812), // Replace with your design size
      minTextAdapt: true, // This ensures that text scaling is adapted to the screen size
      splitScreenMode: false, // Optional, can be used for large screens
    );

    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
