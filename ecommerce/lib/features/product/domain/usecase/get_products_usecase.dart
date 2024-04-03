import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/core/utils/type_def.dart';
import 'package:ecommerce/features/product/domain/entity/product_entity.dart';
import 'package:ecommerce/features/product/domain/repository/product_respository.dart';

class GetProductsUseCase implements UseCaseWithoutParams<List<ProductEntity>> {
  final ProductRepository productRepository;

  GetProductsUseCase({required this.productRepository});

  @override
  ResultFuture<List<ProductEntity>> call() async {
    final result = await productRepository.getProducts();
    return result;
  }
}
