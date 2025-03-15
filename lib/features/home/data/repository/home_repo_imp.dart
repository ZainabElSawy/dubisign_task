import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dubisign/features/home/data/model/product_model.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repository/home_repo.dart';
import '../datasource/home_local_datasource.dart';
import '../datasource/home_remore_datasource.dart';

class HomeRepoImp implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImp({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<ProductModel>>> fetchProducts(
      {String? cat}) async {
    List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      List<ProductModel> products = homeLocalDataSource.fetchProducts(cat: cat);
      if (products.isNotEmpty) {
        return right(products);
      } else {
        return left(NetworkFailure('No internet connection'));
      }
    } else {
      try {
        List<ProductModel> products =
            await homeRemoteDataSource.fetchProducts(cat: cat);
        return right(products);
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<String>>> fetchCategories() async {
    List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      List<String> cats = homeLocalDataSource.fetchCategories();
      if (cats.isNotEmpty) {
        return right(cats);
      } else {
        return left(NetworkFailure('No internet connection'));
      }
    } else {
      try {
        List<String> cats = await homeRemoteDataSource.fetchCategories();
        return right(cats);
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
