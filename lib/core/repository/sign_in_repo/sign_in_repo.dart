import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInRepo{
Future<Either<FirebaseAuthException,UserCredential>>postData({required String email,required String password});
}