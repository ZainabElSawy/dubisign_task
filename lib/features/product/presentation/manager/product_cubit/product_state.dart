part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final ProductModel product;
  ProductSuccess(this.product);
}

class ProductServerFailure extends ProductState {
  final String errMessage;
  ProductServerFailure(this.errMessage);
}

class ProductNetworkFailure extends ProductState {
  final String errMessage;
  ProductNetworkFailure(this.errMessage);
}
