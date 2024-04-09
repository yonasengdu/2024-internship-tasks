part of "product_bloc.dart";

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductSuccessState extends ProductState {
  final ProductEntity productEntity;

  ProductSuccessState({required this.productEntity});

  @override
  List<Object?> get props => [productEntity];
}

class ProductsSuccessState extends ProductState {
  final List<ProductEntity> products;

  ProductsSuccessState({required this.products});

  @override
  List<Object?> get props => [products];
}

class SearchProductLoadingState extends ProductState {}

class SearchProductSuccessState extends ProductState {
  final List<ProductEntity> products;

  SearchProductSuccessState({required this.products});

  @override
  List<Object?> get props => [products];
}

class NoProductFoundState extends ProductState {
  final String message;

  NoProductFoundState({required this.message});

  @override
  List<String> get props => [message];
}

class ProductFailureState extends ProductState {
  final String message;

  ProductFailureState({required this.message});

  @override
  List<String> get props => [message];
}

class AddProductSuccessState extends ProductState {}
class AddProductLoadingState extends ProductState {}

class UpdateProductSuccessState extends ProductState {}
class UpdateProductLoadingState extends ProductState {}

class DeleteProductSuccessState extends ProductState {}
class DeleteProductLoadingState extends ProductState {}