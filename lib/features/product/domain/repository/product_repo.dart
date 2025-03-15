import 'package:dartz/dartz.dart';
import 'package:dubisign/features/home/data/model/product_model.dart';

import '../../../../core/errors/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, ProductModel>> fetchSpecificProduct({required int id});
}
