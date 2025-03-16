import 'package:dubisign/core/utils/constants.dart';
import 'package:dubisign/features/home/data/datasource/home_remore_datasource.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dubisign/core/services/api_service.dart';
import 'package:dubisign/features/home/data/model/product_model.dart';
import 'package:dubisign/core/utils/linkapi.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'dart:io';

import 'home_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockApiService mockApiService;
  late HomeRemoteDataSourceImp dataSource;

  setUpAll(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      MethodChannel('plugins.flutter.io/path_provider'),
      (MethodCall methodCall) async {
        if (methodCall.method == 'getApplicationDocumentsDirectory') {
          return Directory.systemTemp.path;
        }
        return null;
      },
    );

    final directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(ProductModelAdapter());

    await Hive.openBox<ProductModel>(HiveKeys.kProducts);
    await Hive.openBox<String>(HiveKeys.kCategories);
  });

  setUp(() {
    mockApiService = MockApiService();
    dataSource = HomeRemoteDataSourceImp(mockApiService);
  });

  tearDownAll(() async {
    await Hive.close();
  });

  group('fetchProducts', () {
    test('should return a list of products when the API call is successful',
        () async {
      final mockResponse = [
        {"id": 1, "title": "Product 1", "price": 100.0},
        {"id": 2, "title": "Product 2", "price": 200.0},
      ];
      when(mockApiService.get(endPoint: AppLinks.product))
          .thenAnswer((_) async => mockResponse);

      final result = await dataSource.fetchProducts();
      expect(result, isA<List<ProductModel>>());
      expect(result.length, 2);
      expect(result.first.title, "Product 1");
    });

    test('should return empty list when API response is null', () async {
      when(mockApiService.get(endPoint: AppLinks.product))
          .thenAnswer((_) async => null);

      final result = await dataSource.fetchProducts();
      expect(result, isEmpty);
    });
  });

  group('fetchCategories', () {
    test('should return a list of categories when API call is successful',
        () async {
      final mockResponse = ["Electronics", "Fashion", "Home"];
      when(mockApiService.get(endPoint: AppLinks.categories))
          .thenAnswer((_) async => mockResponse);

      final result = await dataSource.fetchCategories();
      expect(result, isA<List<String>>());
      expect(result.length, 3);
      expect(result.first, "Electronics");
    });

    test('should return empty list when API response is null', () async {
      when(mockApiService.get(endPoint: AppLinks.categories))
          .thenAnswer((_) async => null);

      final result = await dataSource.fetchCategories();
      expect(result, isEmpty);
    });
  });
}
