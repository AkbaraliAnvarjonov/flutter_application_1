import 'package:equatable/equatable.dart';

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
