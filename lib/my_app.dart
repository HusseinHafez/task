import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/app_constant.dart';
import 'package:task/modules/bottom_nav_screen/view/bottom_nav_sccreen.dart';
import 'package:task/modules/home_screen/view/home_screen.dart';

class MyApp extends StatelessWidget {
  static final navigatorKey=GlobalKey<NavigatorState>();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: AppConstants.designSize,
        minTextAdapt: AppConstants.minTextAdapt,
        splitScreenMode: AppConstants.splitScreenMode,
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: AppConstants.showDebugBanner,
            home: BottomNavScreen(),
          );
        });
  }
}
