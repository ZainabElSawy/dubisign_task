part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final CartWithProducts cart;
  CartSuccess(this.cart);
}

class CartServerFailure extends CartState {
  final String errMessage;
  CartServerFailure(this.errMessage);
}

class CartNetworkFailure extends CartState {
  final String errMessage;
  CartNetworkFailure(this.errMessage);
}
