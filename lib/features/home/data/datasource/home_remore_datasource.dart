import 'package:dubisign/core/utils/constants.dart';
import 'package:dubisign/features/home/data/model/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/services/api_service.dart';
import '../../../../core/utils/linkapi.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> fetchProducts({String? cat});
  Future<List<String>> fetchCategories();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImp(this.apiService);

  @override
  Future<List<ProductModel>> fetchProducts({String? cat}) async {
    var data = await apiService.get(
        endPoint: cat == null
            ? AppLinks.product
            : "${AppLinks.product}/category/$cat");
    List<ProductModel> products = getProductsList(data ?? []) ?? [];
    if (cat == null) saveProductsData(products, HiveKeys.kProducts);
    return products;
  }

  @override
  Future<List<String>> fetchCategories() async {
    var response = await apiService.get(endPoint: AppLinks.categories);
    if (response == null || response is! List<dynamic>) {
      return [];
    } else {
      List<String> cats = (response).map((e) => e.toString()).toList();

      saveCategoriesData(cats, HiveKeys.kCategories);
      return cats;
    }
  }
}

List<ProductModel>? getProductsList(List data) {
  List<ProductModel> products = [];
  for (var item in data) {
    products.add(ProductModel.fromJson(item));
  }
  return products;
}

void saveProductsData(List<ProductModel> products, String boxName) {
  var box = Hive.box<ProductModel>(boxName);
  box.addAll(products);
}

void saveCategoriesData(List<String> cats, String boxName) {
  var box = Hive.box<String>(boxName);
  box.addAll(cats);
}
