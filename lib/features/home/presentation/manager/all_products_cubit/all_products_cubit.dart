import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/repository/home_repo.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit(this.homeRepo) : super(AllProductsInitial());
  HomeRepo homeRepo;

  fetchProducts({String? cat}) async {
    emit(AllProductsLoading());
    var result = await homeRepo.fetchProducts(cat: cat);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(AllProductsServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(AllProductsNetworkFailure(failure.errorMessage));
      }
    }, (productModel) {
      emit(AllProductsSuccess(productModel));
    });
  }
}
