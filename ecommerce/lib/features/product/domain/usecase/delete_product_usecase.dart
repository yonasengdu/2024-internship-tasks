import 'package:ecommerce/core/utils/type_def.dart';
import 'package:ecommerce/features/product/domain/repository/product_respository.dart';

class DeleteProductUseCase {
  final ProductRepository productRepository;

  DeleteProductUseCase({required this.productRepository});

  ResultFuture<void> call(String id) async {
    final result = await productRepository.deleteProduct(id);
    return result;
  }
}
