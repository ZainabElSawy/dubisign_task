import 'package:dubisign/core/utils/service_locator.dart';
import 'package:dubisign/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:dubisign/features/home/domain/repository/home_repo.dart';
import 'package:dubisign/features/home/presentation/manager/all_categories_cubit/all_categories_cubit.dart';
import 'package:dubisign/features/home/presentation/manager/all_products_cubit/all_products_cubit.dart';
import 'package:dubisign/features/home/presentation/screens/base.dart';
import 'package:dubisign/features/product/domain/repository/product_repo.dart';
import 'package:dubisign/features/product/presentation/manager/product_cubit/product_cubit.dart';
import 'package:dubisign/features/product/presentation/screens/product_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/cart/domain/repository/cart_repo.dart';
import '../../features/cart/presentation/screens/cart_view.dart';

abstract class AppRouter {
  static const String kHomeView = "/homeView";
  static const String kCartView = "/cartView";
  static const String kProductView = "/productView";
  static final route = GoRouter(
    routes: [
      GoRoute(
        path: kCartView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              CartCubit(getIt.get<CartRepo>())..fetchCartWithProducts(),
          child: const CartView(),
        ),
      ),
      GoRoute(
        path: kProductView,
        builder: (context, state) => BlocProvider(
          create: (context) => ProductCubit(getIt.get<ProductRepo>()),
          child: ProductView(
            id: state.extra as int,
          ),
        ),
      ),
      GoRoute(
        path: "/",
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  AllProductsCubit(getIt.get<HomeRepo>())..fetchProducts(),
            ),
            BlocProvider(
              create: (context) =>
                  AllCategoriesCubit(getIt.get<HomeRepo>())..fetchCategories(),
            ),
          ],
          child: const BaseView(),
        ),
      ),
    ],
  );
}
