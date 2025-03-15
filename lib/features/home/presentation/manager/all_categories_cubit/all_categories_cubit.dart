import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/repository/home_repo.dart';

part 'all_categories_state.dart';

class AllCategoriesCubit extends Cubit<AllCategoriesState> {
  AllCategoriesCubit(this.homeRepo) : super(AllCategoriesInitial());
  HomeRepo homeRepo;

  fetchCategories({String? cat}) async {
    emit(AllCategoriesLoading());
    var result = await homeRepo.fetchCategories();
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(AllCategoriesServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(AllCategoriesNetworkFailure(failure.errorMessage));
      }
    }, (productModel) {
      emit(AllCategoriesSuccess(productModel));
    });
  }
}
