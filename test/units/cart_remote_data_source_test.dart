import 'package:dubisign/features/cart/data/datasource/cart_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dubisign/core/services/api_service.dart';
import 'package:dubisign/features/cart/data/model/cart_model.dart';
import 'package:dubisign/core/utils/linkapi.dart';

import 'cart_remote_data_source_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late CartRemoteDataSourceImp dataSource;

  setUp(() {
    mockApiService = MockApiService();
    dataSource = CartRemoteDataSourceImp(mockApiService);
  });

  group('fetchCart', () {
    test('should return CartModel when API call is successful', () async {
      final mockCartData = {
        "id": 1,
        "userId": 123,
        "products": [
          {"productId": 101, "quantity": 2},
          {"productId": 102, "quantity": 1}
        ]
      };

      when(mockApiService.get(endPoint: "${AppLinks.cart}/123"))
          .thenAnswer((_) async => mockCartData);

      final result = await dataSource.fetchCart(userId: 123);

      expect(result, isA<CartModel>());
      expect(result.id, 1);
      expect(result.userId, 123);
      expect(result.products?.length, 2);
    });

    test('should throw an error when API response is null', () async {
      when(mockApiService.get(endPoint: "${AppLinks.cart}/123"))
          .thenAnswer((_) async => null);

      expect(
        () async => await dataSource.fetchCart(userId: 123),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an error when API response is invalid', () async {
      final invalidData = ["Invalid", "Data"];
      when(mockApiService.get(endPoint: "${AppLinks.cart}/123"))
          .thenAnswer((_) async => invalidData);

      expect(
        () async => await dataSource.fetchCart(userId: 123),
        throwsA(isA<TypeError>()),
      );
    });
  });
}
