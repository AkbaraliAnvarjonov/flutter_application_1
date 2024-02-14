import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/features/home/domain/products_repository.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => Dio()
    ..options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      sendTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

  homeFeatures();
}

homeFeatures() {
  sl
    ..registerFactory<ProductsBloc>(() => ProductsBloc(productsRepo: sl()))
    ..registerLazySingleton<ProductsRepo>(
        () => ProductsRepositoryImpl(dio: sl()));
}
