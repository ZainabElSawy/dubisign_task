import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../product/data/datasource/product_remote_datasource.dart';
import '../../domain/entities/cart_with_products.dart';
import '../../domain/repository/cart_repo.dart';
import '../datasource/cart_remote_datasource.dart';

class CartRepoImp extends CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;
  final ProductRemoteDataSource productRemoteDataSource;

  CartRepoImp({
    required this.cartRemoteDataSource,
    required this.productRemoteDataSource,
  });

  @override
  Future<Either<Failure, CartWithProducts>> getCartWithProducts() async {
    List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      return left(NetworkFailure('No internet connection'));
    } else {
      try {
        final cart = await cartRemoteDataSource.fetchCart(userId: 1);
        final productFutures = cart.products!.map((product) async {
          return await productRemoteDataSource.fetchSpecificProduct(
              id: product.productId!);
        }).toList();
        final products = await Future.wait(productFutures);
        double totalPrice = 0;
        final List<ProductWithQuantity> productsWithQuantity =
            <ProductWithQuantity>[];
        for (var i = 0; i < products.length; i++) {
          final product = products[i];
          final quantity = cart.products![i].quantity ?? 0;
          totalPrice += (product.price ?? 0) * quantity;
          productsWithQuantity.add(
            ProductWithQuantity(product: product, quantity: quantity),
          );
        }
        return Right(
          CartWithProducts(
            products: productsWithQuantity,
            totalPrice: totalPrice,
          ),
        );
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
