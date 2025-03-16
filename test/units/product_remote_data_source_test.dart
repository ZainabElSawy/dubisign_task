import 'package:dubisign/core/services/api_service.dart';
import 'package:dubisign/core/utils/linkapi.dart';
import 'package:dubisign/features/home/data/model/product_model.dart';
import 'package:dubisign/features/product/data/datasource/product_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late ProductRemoteDataSourceImp dataSource;

  setUp(() {
    mockApiService = MockApiService();
    dataSource = ProductRemoteDataSourceImp(mockApiService);
  });

  group('fetchSpecificProduct', () {
    test('should return ProductModel when API call is successful', () async {
      final mockProductData = {
        "id": 1,
        "title": "Test Product",
        "price": 99.99
      };

      when(mockApiService.get(endPoint: "${AppLinks.product}/1"))
          .thenAnswer((_) async => mockProductData);

      final result = await dataSource.fetchSpecificProduct(id: 1);
      expect(result, isA<ProductModel>());
      expect(result.id, 1);
      expect(result.title, "Test Product");
      expect(result.price, 99.99);
    });

    test('should throw an error when API response is null', () async {
      when(mockApiService.get(endPoint: "${AppLinks.product}/1"))
          .thenAnswer((_) async => null);

      expect(
        () async => await dataSource.fetchSpecificProduct(id: 1),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an error when API response is invalid', () async {
      final invalidData = ["Invalid", "Data"];
      when(mockApiService.get(endPoint: "${AppLinks.product}/1"))
          .thenAnswer((_) async => invalidData);
      expect(
        () async => await dataSource.fetchSpecificProduct(id: 1),
        throwsA(isA<TypeError>()),
      );
    });
  });
}
