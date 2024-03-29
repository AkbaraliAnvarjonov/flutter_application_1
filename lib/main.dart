import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/domain/products_repository.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/products_bloc/products_event.dart';
import 'package:flutter_application_1/features/home/presentation/pages/home_page.dart';
import 'package:flutter_application_1/get_it.dart';
import 'package:flutter_application_1/router/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: BlocProvider(
      //   create: (context) =>
      //       ProductsBloc(productsRepo: ProductsRepositoryImpl())
      //         ..add(GetProductsEvent()),
      //   child: const HomePage(),
      // ),
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
