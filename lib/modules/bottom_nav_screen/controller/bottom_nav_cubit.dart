import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/modules/home_screen/view/home_screen.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());

static BottomNavCubit get(BuildContext context)=>BlocProvider.of(context);
  int currentPageIndex=0;
  changeCurrentPageIndex(int value){
    emit(BottomNavInitial());
    currentPageIndex=value;
    emit(ChangeCurrentPageIndexState());
  }

  List<Widget> bottomNavScreensList=[
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
}
