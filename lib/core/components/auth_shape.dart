import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class AuthShape extends StatelessWidget {
  const AuthShape({super.key,});
  @override
  Widget build(BuildContext context) {
    return  ClipPath(
      clipper: ShapeClipper(),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
              height: 140.h,
              width: double.infinity,
            //height: 153.h,
            color: AppColors.blueColor,
          ),
          Positioned(
            top: -50,
            bottom: -90,
            left: 47,
            right: 46,
            child: Container(
              height: 282.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor.withOpacity(.2),
              ),
            ),
          ),
          Positioned(
            top: -19,
            bottom: -59,
            left: 78,
            right: 77,
            child: Container(
              height: 220.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor.withOpacity(.2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
   Path path =Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    

   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>false;
}