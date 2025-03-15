import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/data/model/product_model.dart';
import '../../domain/repository/product_repo.dart';
import '../datasource/product_remote_datasource.dart';

class ProductRepoImp implements ProductRepo {
  final ProductRemoteDataSource productRemoteDataSource;
  ProductRepoImp({
    required this.productRemoteDataSource,
  });

  @override
  Future<Either<Failure, ProductModel>> fetchSpecificProduct(
      {required int id}) async {
    List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      return left(NetworkFailure('No internet connection'));
    } else {
      try {
        ProductModel product =
            await productRemoteDataSource.fetchSpecificProduct(id: id);

        return right(product);
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
