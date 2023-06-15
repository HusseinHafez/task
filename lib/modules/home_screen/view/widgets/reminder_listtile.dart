import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/app_colors.dart';
import 'package:task/core/utils/app_fonts.dart';

class RemindersListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  const RemindersListTile({super.key, required this.title, required this.subTitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: ListTile(
        leading: Image.asset(image),
        title: Text(title,style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
          fontFamily: AppFonts.helveticaNeueFont
        ),),
        subtitle:  Text(subTitle,style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.helveticaNeueFont,
          color: AppColors.greyColor
        ),),
      ),
    );
  }
}