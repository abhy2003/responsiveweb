import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static const int mobileBreakpoint = 600;
  static const int tabletBreakpoint = 1024;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Base size for scaling
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        double maxWidth = MediaQuery.of(context).size.width;

        if (maxWidth >= tabletBreakpoint) {
          return desktop;
        } else if (maxWidth >= mobileBreakpoint) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }

  // Static methods to check the device type
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= mobileBreakpoint &&
        MediaQuery.of(context).size.width < tabletBreakpoint;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }
}
