import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task/core/utils/service_locator.dart';

import 'config/bloc_observer.dart';
import 'my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await getItInit();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

