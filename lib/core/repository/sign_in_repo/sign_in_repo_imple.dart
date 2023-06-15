import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/core/repository/sign_in_repo/sign_in_repo.dart';

class SignInRepoImple implements SignInRepo {
  @override
  Future<Either<FirebaseAuthException, UserCredential>> postData(
      {required String email, required String password}) async {
    try {
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return right(response);
    } on FirebaseAuthException catch (error) {
      debugPrint(error.toString());
      return left(error);
    }
  }
}
