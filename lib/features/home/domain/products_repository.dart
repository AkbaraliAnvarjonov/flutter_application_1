import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/core/either_dart/either_dart.dart';
import 'package:flutter_application_1/features/home/data/model/product_model.dart';

import '../../../core/error/failure.dart';
import '../../../core/error/server_error.dart';

part 'package:flutter_application_1/features/home/data/products_repository_impl.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();

  Future<Either<Failure, bool>> deleteProducts({required int id});
}
