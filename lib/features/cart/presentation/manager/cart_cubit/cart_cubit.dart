import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/cart_with_products.dart';
import '../../../domain/repository/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  CartRepo cartRepo;

  fetchCartWithProducts() async {
    emit(CartLoading());
    var result = await cartRepo.getCartWithProducts();
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(CartServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(CartNetworkFailure(failure.errorMessage));
      }
    }, (cartWithProducts) {
      emit(CartSuccess(cartWithProducts));
    });
  }
}
