import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/core/repository/sign_up_repo/sign_up_repo.dart';

class SignUpRepoImple implements SignUpRepo {
  @override
  Future<Either<FirebaseAuthException, UserCredential>> postData({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return right(response);
    } on FirebaseAuthException catch (error) {
      debugPrint(error.toString());
      return left(error);
    }
  }
}
