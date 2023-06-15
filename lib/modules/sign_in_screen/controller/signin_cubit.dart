import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/repository/sign_in_repo/sign_in_repo_imple.dart';
import 'package:task/modules/bottom_nav_screen/view/bottom_nav_sccreen.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit({
    required this.signInRepoImple,
  }) : super(SigninInitial());
  final SignInRepoImple signInRepoImple;
  static SigninCubit get(BuildContext context) => BlocProvider.of(context);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscureText = true;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool signInIsLoading = false;
  signIn(BuildContext context) async {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      signInIsLoading = true;
      emit(SigninIsLoadingeState());
      final response = await signInRepoImple.postData(
        email: emailController.text,
        password: passwordController.text,
      );
      response.fold((l) {
        signInIsLoading = false;
        emit(SigninErrorState());
      }, (r) {
        signInIsLoading = false;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavScreen(),
          ),
          (route) => false,
        );
        emailController.clear();
        passwordController.clear();
        emit(SigninSucessState());
      });
    } else {
      return;
    }
  }
}
