import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpRepo{
Future<Either<FirebaseAuthException,UserCredential>> postData({required String name,required String email,required String password,required String phone});
}