part of 'signin_cubit.dart';

abstract class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

class SigninInitial extends SigninState {}


class SigninIsLoadingeState extends SigninState{}
class SigninSucessState extends SigninState{}
class SigninErrorState extends SigninState{}