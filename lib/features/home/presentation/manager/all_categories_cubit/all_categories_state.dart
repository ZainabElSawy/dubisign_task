part of 'all_categories_cubit.dart';

@immutable
sealed class AllCategoriesState {}

final class AllCategoriesInitial extends AllCategoriesState {}

class AllCategoriesLoading extends AllCategoriesState {}

class AllCategoriesSuccess extends AllCategoriesState {
  final List<String> categories;
  AllCategoriesSuccess(this.categories);
}

class AllCategoriesServerFailure extends AllCategoriesState {
  final String errMessage;
  AllCategoriesServerFailure(this.errMessage);
}

class AllCategoriesNetworkFailure extends AllCategoriesState {
  final String errMessage;
  AllCategoriesNetworkFailure(this.errMessage);
}
