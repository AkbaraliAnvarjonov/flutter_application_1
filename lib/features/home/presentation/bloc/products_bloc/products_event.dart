import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/home/data/model/product_request.dart';

abstract class ProductsEvent extends Equatable {}

class GetProductsEvent extends ProductsEvent {
  @override
  List<Object?> get props => [];
}

class DeleteProductsEvent extends ProductsEvent {
  final int id;

  DeleteProductsEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class UpdateProductsEvent extends ProductsEvent {
  final ProductRequest productRequest;

  UpdateProductsEvent({required this.productRequest});

  @override
  List<Object?> get props => [productRequest];
}
