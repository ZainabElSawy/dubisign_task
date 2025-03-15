import 'package:dartz/dartz.dart';
import 'package:dubisign/core/errors/failure.dart';

import '../entities/cart_with_products.dart';

abstract class CartRepo {
  Future<Either<Failure, CartWithProducts>> getCartWithProducts();
}
