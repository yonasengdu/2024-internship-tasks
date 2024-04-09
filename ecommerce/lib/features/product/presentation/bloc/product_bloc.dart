import 'package:ecommerce/features/product/domain/entity/product_entity.dart';
import 'package:ecommerce/features/product/domain/usecase/add_product_usecase.dart';
import 'package:ecommerce/features/product/domain/usecase/delete_product_usecase.dart';
import 'package:ecommerce/features/product/domain/usecase/get_product_usecase.dart';
import 'package:ecommerce/features/product/domain/usecase/get_products_usecase.dart';
import 'package:ecommerce/features/product/domain/usecase/search_product_usecase.dart';
import 'package:ecommerce/features/product/domain/usecase/update_product_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "product_event.dart";
part "product_state.dart";

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({
    required AddProductUseCase addProductUseCase,
    required DeleteProductUseCase deleteProductUseCase,
    required GetProductUseCase getProductUseCase,
    required GetProductsUseCase getProductsUseCase,
    required SearchProductUseCase searchProductUseCase,
    required UpdateProductUseCase updateProductUseCase,
  })  : _addProductUseCase = addProductUseCase,
        _deleteProductUseCase = deleteProductUseCase,
        _getProductUseCase = getProductUseCase,
        _getProductsUseCase = getProductsUseCase,
        _searchProductUseCase = searchProductUseCase,
        _updateProductUseCase = updateProductUseCase,
        super(ProductInitialState()) {
    on<GetProductsEvent>(_getProductsHandler);
    on<GetProductEvent>(_getProductHandler);
    on<SearchProdutEvent>(_searchProductHandler);
    on<AddProductEvent>(_addProductHandler);
    on<UpdateProductEvent>(_updateProductHandler);
    on<DeleteProductEvent>(_deleteProductHandler);
  }

  final AddProductUseCase _addProductUseCase;
  final DeleteProductUseCase _deleteProductUseCase;
  final GetProductUseCase _getProductUseCase;
  final GetProductsUseCase _getProductsUseCase;
  final SearchProductUseCase _searchProductUseCase;
  final UpdateProductUseCase _updateProductUseCase;

  Future<void> _getProductsHandler(
    GetProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoadingState());
    final result = await _getProductsUseCase.call();
    result.fold(
      (error) => emit(
        ProductFailureState(message: "Unable to get products😒😒"),
      ),
      (products) => emit(ProductsSuccessState(products: products)),
    );
  }

  Future<void> _getProductHandler(
    GetProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoadingState());
    final result = await _getProductUseCase.call(event.productId);
    result.fold(
        (error) => emit(
              ProductFailureState(message: "Unable to get your product😒😒"),
            ),
        (product) => emit(ProductSuccessState(productEntity: product)));
  }

  Future<void> _searchProductHandler(
    SearchProdutEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(SearchProductLoadingState());
    final result = await _searchProductUseCase.call(event.query);
    result.fold(
        (error) => emit(
              ProductFailureState(message: "Unable to get your product😒😒"),
            ), (products) {
      if (products.isEmpty) {
        emit(
          NoProductFoundState(
              message: "No product found with this ${event.query}"),
        );
      } else {
        emit(
          SearchProductSuccessState(products: products),
        );
      }
    });
  }

  Future<void> _addProductHandler(
    AddProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(AddProductLoadingState());
    final ProductParams newProduct = ProductParams(
      catagory: event.catagory,
      title: event.title,
      price: event.price,
      description: event.description,
      imageUrl: event.imageUrl,
    );
    final result = await _addProductUseCase.call(newProduct);

    result.fold(
        (error) =>
            emit(ProductFailureState(message: "unable to add your product ")),
        (right) => emit(AddProductSuccessState()));
  }

  Future<void> _updateProductHandler(
    UpdateProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(UpdateProductLoadingState());
    final UpdateProductParams updatedProduct = UpdateProductParams(
      id: event.id,
      title: event.title,
    );
    final result = await _updateProductUseCase.call(updatedProduct);
    result.fold(
      (error) =>
          emit(ProductFailureState(message: "unable to update product ")),
      (right) => emit(UpdateProductSuccessState()),
    );
  }

  Future<void> _deleteProductHandler(
    DeleteProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(DeleteProductLoadingState());
    final result = await _deleteProductUseCase.call(event.id);
    result.fold(
      (error) =>
          emit(ProductFailureState(message: "unable to Delete product ")),
      (right) => emit(DeleteProductSuccessState()),
    );
  }
}
