part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class ChangePasswordVisabiliyState extends SignupState{}

class ChangeCheckBoxValueState extends SignupState{}

class SignupIsLoadingeState extends SignupState{}
class SignupSucessState extends SignupState{}
class SignupErrorState extends SignupState{}
