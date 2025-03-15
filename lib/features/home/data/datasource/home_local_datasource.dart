import 'package:dubisign/core/utils/constants.dart';
import 'package:dubisign/features/home/data/model/product_model.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<ProductModel> fetchProducts({String? cat});
  List<String> fetchCategories();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  HomeLocalDataSourceImp();

  @override
  List<ProductModel> fetchProducts({String? cat}) {
    Box<ProductModel> box = Hive.box<ProductModel>(HiveKeys.kProducts);
    return box.values.toList();
  }

  @override
  List<String> fetchCategories() {
    Box<String> box = Hive.box<String>(HiveKeys.kCategories);
    return box.values.toList();
  }
}
