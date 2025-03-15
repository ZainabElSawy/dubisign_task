import 'package:dio/dio.dart';
import 'package:dubisign/features/cart/data/datasource/cart_remote_datasource.dart';
import 'package:dubisign/features/cart/data/repository/cart_repo_imp.dart';
import 'package:dubisign/features/cart/domain/repository/cart_repo.dart';
import 'package:dubisign/features/product/data/datasource/product_remote_datasource.dart';
import 'package:dubisign/features/product/domain/repository/product_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/datasource/home_local_datasource.dart';
import '../../features/home/data/datasource/home_remore_datasource.dart';
import '../../features/home/data/repository/home_repo_imp.dart';
import '../../features/home/domain/repository/home_repo.dart';
import '../../features/product/data/repository/product_repo_imp.dart';
import '../services/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRemoteDataSource>(
      HomeRemoteDataSourceImp(getIt.get<ApiService>()));
  getIt.registerSingleton<HomeLocalDataSource>(HomeLocalDataSourceImp());
  getIt.registerSingleton<HomeRepo>(HomeRepoImp(
      homeRemoteDataSource: getIt.get<HomeRemoteDataSource>(),
      homeLocalDataSource: getIt.get<HomeLocalDataSource>()));

  getIt.registerSingleton<ProductRemoteDataSource>(
      ProductRemoteDataSourceImp(getIt.get<ApiService>()));
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImp(
      productRemoteDataSource: getIt.get<ProductRemoteDataSource>(),
    ),
  );

  getIt.registerSingleton<CartRemoteDataSource>(
      CartRemoteDataSourceImp(getIt.get<ApiService>()));
  getIt.registerSingleton<CartRepo>(
    CartRepoImp(
      productRemoteDataSource: getIt.get<ProductRemoteDataSource>(),
      cartRemoteDataSource: getIt.get<CartRemoteDataSource>(),
    ),
  );
}
