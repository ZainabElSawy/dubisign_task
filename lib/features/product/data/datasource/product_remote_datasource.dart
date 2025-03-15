import '../../../../core/services/api_service.dart';
import '../../../../core/utils/linkapi.dart';
import '../../../home/data/model/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> fetchSpecificProduct({required int id});
}

class ProductRemoteDataSourceImp extends ProductRemoteDataSource {
  final ApiService apiService;
  ProductRemoteDataSourceImp(this.apiService);

  @override
  Future<ProductModel> fetchSpecificProduct({required int id}) async {
    Map<String, dynamic> data = (await apiService.get(
        endPoint: "${AppLinks.product}/$id")) as Map<String, dynamic>;
    return ProductModel.fromJson(data);
  }
}
