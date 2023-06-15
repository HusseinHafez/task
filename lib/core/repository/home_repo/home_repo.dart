import 'package:dartz/dartz.dart';

import '../../../modules/home_screen/model/product_model.dart';
import '../../api/exceptions.dart';

abstract class HomeRepo{

  Future<Either<ServerException,List<ProductModel>>> getData();
}