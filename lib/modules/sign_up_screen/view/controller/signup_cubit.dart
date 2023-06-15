import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/repository/sign_up_repo/sign_up_repo_imple.dart';

import '../../../sign_in_screen/view/sign_in_screen.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.signUpRepoImple}) : super(SignupInitial());
  final SignUpRepoImple signUpRepoImple;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool checkBoxValue = false;
  static SignupCubit get(BuildContext context) => BlocProvider.of(context);

  void changePasswordVisabiliy() {
    emit(SignupInitial());
    obscureText = !obscureText;
    emit(ChangePasswordVisabiliyState());
  }

  void changeCheckBoxValue(bool value) {
    emit(SignupInitial());
    checkBoxValue = value;
    emit(ChangeCheckBoxValueState());
  }

  bool signUpIsLoading = false;
  Future<void> signUp(BuildContext context) async {
    final isValid = formKey.currentState!.validate();
    if (isValid && checkBoxValue) {
      signUpIsLoading = true;
      emit(SignupIsLoadingeState());
      final response = await signUpRepoImple.postData(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
      );
      response.fold((l) {
        signUpIsLoading = false;
        emit(SignupErrorState());
      }, (r) {
        signUpIsLoading = false;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
          (route) => false,
        );
        nameController.clear();
        phoneController.clear();
        emailController.clear();
        passwordController.clear();
        addressController.clear();
        checkBoxValue=false;
        emit(SignupSucessState());
      });
    } else {
      return;
    }
  }
}
