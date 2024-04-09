part of "product_bloc.dart";

abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProductsEvent extends ProductEvent {
  GetProductsEvent();
}

class GetProductEvent extends ProductEvent {
  final String productId;

  GetProductEvent({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class SearchProdutEvent extends ProductEvent {
  final String query;

  SearchProdutEvent({required this.query});

  @override
  List<Object?> get props => [query];
}

class AddProductEvent extends ProductEvent {
  final String title;
  final num price;
  final String description;
  final String catagory;
  final String imageUrl;

  AddProductEvent(
      {required this.title,
      required this.price,
      required this.description,
      required this.catagory,
      required this.imageUrl});
  @override
  List<Object?> get props => [title, price, description, catagory, imageUrl];
}

class UpdateProductEvent extends ProductEvent {
  final String id;
  final String title;

  UpdateProductEvent({required this.id, required this.title});

  @override
  List<Object?> get props => [title, id];
}

class DeleteProductEvent extends ProductEvent {
  final String id;

  DeleteProductEvent({required this.id});
  
  @override
  List<Object?> get props => [id];
}
