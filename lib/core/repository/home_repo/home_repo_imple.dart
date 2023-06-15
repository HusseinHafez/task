import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../modules/home_screen/model/product_model.dart';
import '../../api/dio_consumer.dart';
import '../../api/end_poits.dart';
import '../../api/exceptions.dart';
import 'home_repo.dart';

class HomeRepoImple implements HomeRepo {
  final DioConsumer dio;
  HomeRepoImple({required this.dio});

  @override
  Future<Either<ServerException, List<ProductModel>>> getData() async{
    try{
      final response = await dio.getData(url: EndPoints.allProduct);
      List<ProductModel> products=[];
      for(var product in response){
        products.add(ProductModel.fromJson(product));
      }
      return right(products);
    }catch(error){
      debugPrint(error.toString());
     if(error is DioException){
      return left(dio.handleDioException(error));
     }else{
      return left(ServerException(error.toString()));
     }
    }
  }

  
}