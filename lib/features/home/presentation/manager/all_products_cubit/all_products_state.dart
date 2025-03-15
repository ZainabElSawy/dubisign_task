part of 'all_products_cubit.dart';

@immutable
sealed class AllProductsState {}

final class AllProductsInitial extends AllProductsState {}

class AllProductsLoading extends AllProductsState {}

class AllProductsSuccess extends AllProductsState {
  final dynamic products;
  AllProductsSuccess(this.products);
}

class AllProductsServerFailure extends AllProductsState {
  final String errMessage;
  AllProductsServerFailure(this.errMessage);
}

class AllProductsNetworkFailure extends AllProductsState {
  final String errMessage;
  AllProductsNetworkFailure(this.errMessage);
}
