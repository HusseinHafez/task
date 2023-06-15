import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:task/core/components/app_button.dart';
import 'package:task/core/components/app_text_field.dart';
import 'package:task/core/components/auth_shape.dart';
import 'package:task/core/functions/validate.dart';
import 'package:task/core/utils/app_colors.dart';
import 'package:task/core/utils/app_fonts.dart';
import 'package:task/core/utils/service_locator.dart';
import 'package:task/modules/sign_up_screen/view/controller/signup_cubit.dart';

import '../../../core/utils/app_constant.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SignupCubit>(),
      child: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          final controller = SignupCubit.get(context);
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: AppConstants.resizeToAvoidBottomInset,
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    bottom: 14,
                  ),
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
                              labelText: 'NAME',
                              controller: controller.nameController,
                              validator: (name) => Validate.nameValidator(name),
                              keyboardType: TextInputType.name,
                            ),
                            AppTextField(
                              labelText: 'PHONE NUMBER',
                              controller: controller.phoneController,
                              validator: (phone) =>
                                  Validate.phoneValidator(phone),
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(IconlyBroken.edit_square)),
                                  keyboardType: TextInputType.phone,
                            ),
                            AppTextField(
                              labelText: 'EMAIL ADDRESS',
                              controller: controller.emailController,
                              validator: (email) =>
                                  Validate.emailValidator(email),
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(IconlyBroken.edit_square)),
                                  keyboardType: TextInputType.emailAddress,
                            ),
                            AppTextField(
                              labelText: 'PASSWORD',
                              controller: controller.passwordController,
                              validator: (password) =>
                                  Validate.passwordValidator(password),
                              obscureText: controller.obscureText,
                              suffixIcon: IconButton(
                                  onPressed: controller.changePasswordVisabiliy,
                                  icon: const Icon(IconlyBroken.edit_square)),
                                  keyboardType: TextInputType.visiblePassword,
                            ),
                            AppTextField(
                              labelText: 'ADDRESS',
                              controller: controller.addressController,
                              validator: (address) =>
                                  Validate.addressValidator(address),
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.streetAddress,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Row(
                          children: [
                            Checkbox(
                              value: controller.checkBoxValue,
                              onChanged: (value) =>
                                  controller.changeCheckBoxValue(value!),
                            ),
                            RichText(
                                text: TextSpan(
                                    text: 'I have read and agree to the',
                                    style: TextStyle(
                                      fontFamily: AppFonts.robotoFont,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.checkBoxtitleColor,
                                    ),
                                    children: [
                                  TextSpan(
                                    text: 'Terms and conditions',
                                    style: TextStyle(
                                      fontFamily: AppFonts.robotoFont,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      color: AppColors.lightBlueColor,
                                    ),
                                  )
                                ])),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AppButton(
                          text: 'Sign Up',
                          onPressed: () {
                            controller.signUp(context);
                          },
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
