import 'package:flutter_application_1/core/models/status_model.dart';
import 'package:flutter_application_1/features/home/domain/products_repository.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/products_bloc/products_event.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/products_bloc/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({
    required this.productsRepo,
  }) : super(const ProductsState()) {
    on<GetProductsEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      final result = await productsRepo.getAllProducts();
      result.either(
          (left) => null,
          (right) =>
              emit(state.copyWith(products: right, status: Status.success)));
    });

    on<DeleteProductsEvent>(_deleteProducts);
  }

  final ProductsRepo productsRepo;

  Future<void> _deleteProducts(
      DeleteProductsEvent event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(status: Status.loading));
    await productsRepo.deleteProducts(id: event.id);
    emit(state.copyWith(status: Status.success));
  }
}
