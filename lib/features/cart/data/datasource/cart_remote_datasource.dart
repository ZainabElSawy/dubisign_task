import 'package:dubisign/features/cart/data/model/cart_model.dart';

import '../../../../core/services/api_service.dart';
import '../../../../core/utils/linkapi.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> fetchCart({required int userId});
}

class CartRemoteDataSourceImp extends CartRemoteDataSource {
  final ApiService apiService;
  CartRemoteDataSourceImp(this.apiService);

  @override
  Future<CartModel> fetchCart({required int userId}) async {
    Map<String, dynamic> data = await apiService.get(
        endPoint: "${AppLinks.cart}/$userId") as Map<String, dynamic>;
    CartModel cart = CartModel.fromJson(data);

    return cart;
  }
}
/*
import 'dart:developer';

import 'package:dubisign/features/cart/data/model/cart_model.dart';
import 'package:dubisign/features/home/data/model/product_model.dart';

import '../../../../core/services/api_service.dart';
import '../../../../core/utils/linkapi.dart';

abstract class CartRemoteDataSource {
  Future<List<ProductModel>> fetchCart({required int userId});
}

class CartRemoteDataSourceImp extends CartRemoteDataSource {
  final ApiService apiService;
  CartRemoteDataSourceImp(this.apiService);

  @override
  Future<List<ProductModel>> fetchCart({required int userId}) async {
    Map<String, dynamic> data = await apiService.get(
        endPoint: "${AppLinks.cart}/$userId") as Map<String, dynamic>;
    log(data.toString());
    List<ProductModel>? cartProducts = getProductsList(apiService,data["products"]??[]);
    return cartProducts ?? [];
  }
}

// List<ProductModel>? getProductsList(ApiService apiService,List products)async {
//   List<ProductModel> cartProducts = [];
//   for (var product in products) {
//      Map<String, dynamic> data = (await apiService.get(
//         endPoint: "${AppLinks.product}/${product["productId"]}")) as Map<String, dynamic>;
//     cartProducts.add(ProductModel.fromJson(data));
//   }
//   return cartProducts;
// }

*/
