import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/models/status_model.dart';
import 'package:flutter_application_1/features/home/data/model/product_model.dart';

class ProductsState extends Equatable {
  const ProductsState({
    this.status = Status.loading,
    this.products = const [],
  });

  final Status status;
  final List<ProductModel> products;

  ProductsState copyWith({
    Status? status,
    List<ProductModel>? products,
  }) {
    return ProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [
        status,
        products,
      ];
}
