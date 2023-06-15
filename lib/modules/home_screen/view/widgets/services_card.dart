import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/app_colors.dart';
import 'package:task/core/utils/app_fonts.dart';

class ServicesCard extends StatelessWidget {
  final String image;
  final String text;
  const ServicesCard({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 73.w,
          height: 60.h,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
            elevation: 1,
            child: Center(
              child: Image.asset(image),
            ),
          ),
        ),
        Text(text,style: TextStyle(
          fontFamily: AppFonts.helveticaNeueFont,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
        ),)
      ],
    );
  }
}
