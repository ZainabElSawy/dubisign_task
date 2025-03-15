import 'package:dartz/dartz.dart';
import 'package:dubisign/features/home/data/model/product_model.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> fetchProducts({String? cat});
  Future<Either<Failure, List<String>>> fetchCategories();
}
