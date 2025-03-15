import 'package:dubisign/core/utils/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/home/data/model/product_model.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(RatingAdapter());

  await Hive.openBox<ProductModel>(HiveKeys.kProducts);
  await Hive.openBox<String>(HiveKeys.kCategories);
}
