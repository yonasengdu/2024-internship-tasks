import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/core/utils/type_def.dart';
import 'package:ecommerce/features/product/domain/repository/product_respository.dart';
import 'package:equatable/equatable.dart';

class AddProductUseCase implements UseCase<void, ProductParams> {
  final ProductRepository productRepository;

  AddProductUseCase({required this.productRepository});

  @override
  ResultFuture<void> call(ProductParams params) async {
    final product = await productRepository.addProduct(params.title,
        params.price, params.description, params.catagory, params.imageUrl);

    return product;
  }
}

class ProductParams extends Equatable {
  final String title;
  final num price;
  final String description;
  final String catagory;
  final String imageUrl;

  const ProductParams(
      {required this.title,
      required this.price,
      required this.description,
      required this.catagory,
      required this.imageUrl});

  @override
  List<Object?> get props => [title, price, description, catagory, imageUrl];
}
