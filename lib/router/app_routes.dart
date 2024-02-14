import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/data/model/product_model.dart';
import 'package:flutter_application_1/features/home/presentation/pages/update_page/update_page.dart';
import 'package:flutter_application_1/router/route_names.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/home/domain/products_repository.dart';
import '../features/home/presentation/bloc/products_bloc/products_bloc.dart';
import '../features/home/presentation/bloc/products_bloc/products_event.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../get_it.dart';

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final String routName = settings.name ?? "";

    switch (routName) {
      case AppRouteNames.splash:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<ProductsBloc>()..add(GetProductsEvent()),
            child: const HomePage(),
          ),
        );
      case AppRouteNames.update:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<ProductsBloc>(),
            child: UpdatePage(prouct: settings.arguments as ProductModel),
          ),
        );

      case AppRouteNames.home:
        return CupertinoPageRoute(builder: (context) => const HomePage());
      default:
        return CupertinoPageRoute(builder: (context) => const Scaffold());
    }
  }
}
