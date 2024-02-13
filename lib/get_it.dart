import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        // contentType: 'application/json',
        sendTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          // 'Authorization': 'API-KEY',
          // 'X-API-KEY': Constants.apiKey,
          // 'Resource-Id': Constants.resourceId,
          // 'Environment-Id': Constants.environmentId,
        },
        // queryParameters: {'project-id': Constants.projectId},
      )
      ..interceptors.addAll(
        [
          LogInterceptor(
            requestBody: kDebugMode,
            responseBody: kDebugMode,
            logPrint: (object) => kDebugMode ? log('dio: $object') : null,
          ),
          // chuck.getDioInterceptor(),
        ],
      ),
  );

  homeFeatures();
}
homeFeatures(){}