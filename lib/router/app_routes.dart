import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/route_names.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/home/domain/products_repository.dart';
import '../features/home/presentation/bloc/products_bloc/products_bloc.dart';
import '../features/home/presentation/bloc/products_bloc/products_event.dart';
import '../features/home/presentation/pages/home_page.dart';

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final String routName = settings.name ?? "";

    switch (routName) {
      case AppRouteNames.splash:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                ProductsBloc(productsRepo: ProductsRepositoryImpl())
                  ..add(GetProductsEvent()),
            child: const HomePage(),
          ),
        );
      case AppRouteNames.home:
        return CupertinoPageRoute(builder: (context) => const HomePage());
      default:
        return CupertinoPageRoute(builder: (context) => const Scaffold());
    }
  }
}
