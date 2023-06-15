import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/app_colors.dart';
import 'package:task/core/utils/app_fonts.dart';
import 'package:task/core/utils/app_images.dart';
import 'package:task/core/utils/service_locator.dart';
import 'package:task/modules/home_screen/controller/home_cubit.dart';
import 'package:task/modules/home_screen/view/widgets/product_item.dart';
import 'package:task/modules/home_screen/view/widgets/reminder_listtile.dart';
import 'package:task/modules/home_screen/view/widgets/services_card.dart';
import 'package:task/modules/home_screen/view/widgets/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<HomeCubit>()..getAllProducts(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final controller = HomeCubit.get(context);
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 0,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(120.h),
                  child: Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 11, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 30.w,
                                height: 30.h,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            AppImages.profileImage))),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Expanded(
                                child: Text(
                                  'Good evening Ali',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.blackColor,
                                    fontFamily: AppFonts.helveticaNeueFont,
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.menu,
                                    color: AppColors.lightBlueColor,
                                  ))
                            ],
                          ),
                          TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: AppColors.whiteColor,
                              prefixIconConstraints:
                                  const BoxConstraints().flipped,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Icon(
                                  Icons.search,
                                  size: 25.w,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              hintText: 'What are you looking for ?',
                              hintStyle: TextStyle(
                                color: AppColors.greyColor,
                                fontFamily: AppFonts.helveticaNeueFont,
                                fontSize: 12.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                backgroundColor: AppColors.backgroundColor,
                elevation: 0,
              ),
              backgroundColor: AppColors.backgroundColor,
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const TitleText(text: 'Trending'),
                      SizedBox(
                        height: 10.h,
                      ),
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.blueColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 150.h,
                            child: Image.asset(
                              AppImages.trndingImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            right: 15,
                            bottom: 15,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.whiteColor,
                                
                              ),
                              onPressed: (){}, child: Text('learn more',style: TextStyle(
                              color: AppColors.blueColor,
                              fontSize: 10.sp,
                              fontFamily: AppFonts.helveticaNeueFont,
                            ),)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const TitleText(text: 'Our Services'),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ServicesCard(image: AppImages.productsImage,text: 'Products',),
                          ServicesCard(image: AppImages.labsImage,text: 'Labs',),
                          ServicesCard(image: AppImages.doctorsImage,text: 'Doctors',),
                          ServicesCard(image: AppImages.hospitalsImage,text: 'Hospitals',),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const TitleText(text: 'Reminders'),
                      SizedBox(
                        height: 10.h,
                      ),
                      const RemindersListTile(
                        image: AppImages.doseReminderImage,
                        title: 'Dose Reminder',
                        subTitle: 'Next Dosage',
                      ),
                      const RemindersListTile(
                        image: AppImages.apointmentImage,
                        title: 'Apointments',
                        subTitle: 'See youe next Apointment',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const TitleText(text: 'Recommeneded For You'),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 170.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => ProductItem(
                              productModel: controller.allProducts[index]),
                          itemCount: controller.allProducts.length,
                        ),
                      ),
                       SizedBox(
                        height: 10.h,
                      ),
                      const TitleText(text: 'Most Selling'),
                      SizedBox(
                        height: 10.h,
                      ),
                       SizedBox(
                        height: 170.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => ProductItem(
                              productModel: controller.allProducts[index]),
                          itemCount: controller.allProducts.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
