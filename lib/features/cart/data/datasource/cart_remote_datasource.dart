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
