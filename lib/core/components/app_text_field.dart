import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/app_colors.dart';
import 'package:task/core/utils/app_fonts.dart';

class AppTextField extends StatelessWidget {
  final String labelText;
  final String labelTextFontFamily;
  final String textFontFamily;
  final Color labelColor;
  final Color borderColor;
  final Color textColor;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final double labelSize;
  final double textFontSize;
  final double borderWidth;
  final FontWeight labelFontWeight;
  final FontWeight textFontWeight;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  const AppTextField({
    super.key,
    required this.labelText,
    this.labelColor = AppColors.greyColor,
    this.labelSize = 12,
    this.labelFontWeight = FontWeight.w500,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.textColor = AppColors.textFieldTextColor,
    this.textFontSize = 18,
    this.textFontWeight = FontWeight.w500,
    this.labelTextFontFamily = AppFonts.robotoFont,
    this.textFontFamily = AppFonts.robotoFont,
    this.borderColor = AppColors.textFieldBorderColor,
    this.borderWidth = 1,
    this.textInputAction=TextInputAction.next, this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
       horizontal: 16,vertical: 6
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            labelText,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: labelColor,
              fontSize: labelSize.sp,
              fontWeight: labelFontWeight,
              fontFamily: labelTextFontFamily,
            ),
          ),
          // SizedBox(
          //   height: 5.h,
          // ),
          TextFormField(
            style: TextStyle(
              color: textColor,
              fontWeight: textFontWeight,
              fontSize: textFontSize.sp,
              fontFamily: textFontFamily,
            ),
            controller: controller,
            validator: validator,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: borderWidth),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: borderWidth),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: borderWidth),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: borderWidth),
              ),
              suffixIcon: suffixIcon,
            ),
            obscureText: obscureText,
          )
        ],
      ),
    );
  }
}
