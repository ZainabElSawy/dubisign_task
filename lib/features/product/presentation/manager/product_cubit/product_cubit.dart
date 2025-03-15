import 'package:dubisign/features/home/data/model/product_model.dart';
import 'package:dubisign/features/product/domain/repository/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());
  ProductRepo productRepo;

  fetchSpecificProduct({required int id}) async {
    emit(ProductLoading());
    var result = await productRepo.fetchSpecificProduct(id: id);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(ProductServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(ProductNetworkFailure(failure.errorMessage));
      }
    }, (productModel) {
      emit(ProductSuccess(productModel));
    });
  }
}
