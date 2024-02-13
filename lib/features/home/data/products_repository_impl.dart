part of 'package:flutter_application_1/features/home/domain/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepo {
  final Dio dio = Dio();

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      final response = await dio.get(AppConstants.baseUrl + Slugs.products);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right((response.data as List)
            .map((json) => ProductModel.fromJson(json))
            .toList());
      }
      return Left(ServerError.withDioError(error: response.data).failure);
    } on DioException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProducts({required int id}) async {
    try {
      final response =
          await dio.delete('${AppConstants.baseUrl}${Slugs.products}/$id');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right(true);
      }
      return Left(ServerError.withDioError(error: response.data).failure);
    } on DioException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }
}
