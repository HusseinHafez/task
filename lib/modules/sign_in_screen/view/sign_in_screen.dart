import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/app_constant.dart';
import 'package:task/core/utils/app_images.dart';
import 'package:task/modules/sign_in_screen/controller/signin_cubit.dart';
import 'package:task/modules/sign_up_screen/view/sign_up_screen.dart';

import '../../../core/components/app_button.dart';
import '../../../core/components/app_text_field.dart';
import '../../../core/components/auth_shape.dart';
import '../../../core/functions/validate.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/service_locator.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SigninCubit>(),
      child: BlocBuilder<SigninCubit, SigninState>(
        builder: (context, state) {
          final controller = SigninCubit.get(context);
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: AppConstants.resizeToAvoidBottomInset,
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const AuthShape(),
                      SizedBox(
                        height: 10.h,
                      ),
                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            AppTextField(
                              labelText: 'EMAIL ADDRESS',
                              controller: controller.emailController,
                              validator: (email) =>
                                  Validate.emailValidator(email),
                            ),
                            AppTextField(
                              labelText: 'PASSWORD',
                              controller: controller.passwordController,
                              validator: (password) =>
                                  Validate.passwordValidator(password),
                              obscureText: controller.obscureText,
                              suffixIcon: SizedBox(
                                height: 13.h,
                                width: 100.w,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(4),
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'Forget password',
                                      style: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: AppFonts.robotoFont,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Don\'t have an account ? ',
                              style: TextStyle(
                                fontFamily: AppFonts.robotoFont,
                                fontSize: 14.sp,
                                color: AppColors.checkBoxtitleColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen(),
                                      ),
                                      (route) => false,
                                    ),
                              children: [
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(
                                    fontFamily: AppFonts.robotoFont,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    color: AppColors.lightBlueColor,
                                  ),
                                )
                              ])),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: 48.w,
                            height: 48.h,
                            child: Image.asset(
                              AppImages.facebookImage,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: 64.w,
                            height: 48.h,
                            child: Image.asset(
                              AppImages.gmailImage,
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AppButton(
                          text: 'Sign In',
                          onPressed: () =>controller.signIn(context),
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
