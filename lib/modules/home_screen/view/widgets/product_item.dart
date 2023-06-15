import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/app_colors.dart';
import 'package:task/core/utils/app_fonts.dart';
import 'package:task/modules/home_screen/model/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productModel;
  const ProductItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: 160.w,
        height: 168.h,
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 101.w,
                  height: 65.h,
                  child: Image.network(productModel.image.toString()),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  productModel.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.helveticaNeueFont,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar.builder(
                      itemSize: 15.w,
                      initialRating: productModel.rating!.rate!,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: AppColors.amberColor,
                      ),
                      onRatingUpdate: (double value) {},
                    ),
                    Text(
                      "(${productModel.rating!.count} Reviews)",
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.helveticaNeueFont,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: productModel.price!.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      
                      color: AppColors.lightBlueColor,
                      fontFamily: AppFonts.helveticaNeueFont,
                    ),
                    children: [
                      TextSpan(
                        text: ' EGP',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightBlueColor,
                          fontFamily: AppFonts.helveticaNeueFont,
                        ),
                      )
                    ],
                  ),
                ),
                 SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '1010.00',
                    style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.greyColor,
                      fontFamily: AppFonts.helveticaNeueFont,
                    ),
                    children: [
                      TextSpan(
                        text: ' EGP',
                        style: TextStyle(
                          fontSize: 6.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyColor,
                          fontFamily: AppFonts.helveticaNeueFont,
                        ),
                      )
                    ],
                  ),
                ),
                     RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'You Saved ${(1010.00 - productModel.price!).toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w500,
                      
                      color: AppColors.greyColor,
                      fontFamily: AppFonts.helveticaNeueFont,
                    ),
                    children: [
                      TextSpan(
                        text: ' EGP',
                        style: TextStyle(
                          fontSize: 6.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyColor,
                          fontFamily: AppFonts.helveticaNeueFont,
                        ),
                      )
                    ],
                  ),
                ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
