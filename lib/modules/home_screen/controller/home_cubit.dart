import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/repository/home_repo/home_repo_imple.dart';

import '../model/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepoImple}) : super(HomeInitial());
  final HomeRepoImple homeRepoImple;
  static HomeCubit get(BuildContext context)=>BlocProvider.of(context);
 bool isLoading = false;
  List<ProductModel> allProducts = [];

  getAllProducts() async {
    isLoading=true;
    emit(GetAllProductLoadingState());
    final response = await homeRepoImple.getData();
    response.fold((l) {
      isLoading=false;
      emit(GetAllProductErrorState());
    }, (r) {
      isLoading=false;
      allProducts=r;
      emit(GetAllProductSucessState());
    });
}
}