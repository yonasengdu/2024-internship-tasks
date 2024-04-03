import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/core/utils/type_def.dart';
import 'package:ecommerce/features/product/domain/repository/product_respository.dart';
import 'package:equatable/equatable.dart';

class UpdateProductUseCase implements UseCase<void, UpdateProductParams> {
  final ProductRepository productRepository;

  UpdateProductUseCase({required this.productRepository});

  @override
  ResultFuture<void> call(UpdateProductParams params) async {
    final product = await productRepository.updateProduct(
      params.title,
      params.id,
    );

    return product;
  }
}

class UpdateProductParams extends Equatable {
  final String id;
  final String title;

  const UpdateProductParams({required this.id, required this.title});

  @override
  List<Object?> get props => [title, id];
}
