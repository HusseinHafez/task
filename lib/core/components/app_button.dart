import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/app_colors.dart';
import 'package:task/core/utils/app_fonts.dart';

class AppButton extends StatelessWidget {
  final String text;
  final String textFontFamily;
  final Color textColor;
  final Color backgroundColor;
  final Color? shadowColor;
  final double elevation;
  final double horizontal;
  final double vertical;
  final double borderRadius;
  final double textSize;
  final FontWeight textFontWeight;
  final Function() onPressed;
  const AppButton(
      {super.key,
      required this.text,
       this.textFontFamily=AppFonts.robotoFont,
       this.textColor=AppColors.whiteColor,
       this.backgroundColor=AppColors.buttonColor,
       this.shadowColor,
       this.elevation=6,
       this.horizontal=139,
       this.vertical=20,
       this.borderRadius=12,
       this.textSize=15,
       this.textFontWeight=FontWeight.bold,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        shadowColor: shadowColor,
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: textSize.sp,
          fontWeight: textFontWeight,
          color: textColor,
          fontFamily: textFontFamily,
        ),
      ),
    );
  }
}
