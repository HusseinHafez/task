import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/utils/app_colors.dart';
import 'package:task/core/utils/service_locator.dart';
import 'package:task/modules/bottom_nav_screen/controller/bottom_nav_cubit.dart';

import '../../../core/utils/app_images.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<BottomNavCubit>(),
      child: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          final controller=BottomNavCubit.get(context);
          return Scaffold(
                body: controller.bottomNavScreensList[controller.currentPageIndex],
                bottomNavigationBar: BottomNavigationBar(
                  type:BottomNavigationBarType.fixed,
                  currentIndex: controller.currentPageIndex,
                  onTap: (value) => controller.changeCurrentPageIndex(value),
                  selectedItemColor: AppColors.blueColor,
                  unselectedItemColor: AppColors.greyColor,

                  items: [
                  BottomNavigationBarItem(icon: Image.asset(AppImages.homeImage),label: 'Home',),
                  BottomNavigationBarItem(icon: Image.asset(AppImages.recordImage),label: 'Record',),
                  BottomNavigationBarItem(icon: Image.asset(AppImages.exploreImage),label: 'Explore',),
                  BottomNavigationBarItem(icon: Image.asset(AppImages.insuranceImage),label: 'Insurance',),
                  BottomNavigationBarItem(icon: Image.asset(AppImages.profileiconImage),label: 'Profile',),
                ]),
              );
        },
      ),
    );
  }
}