import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/core/utils/type_def.dart';
import 'package:ecommerce/features/product/domain/repository/product_respository.dart';

class DeleteProductUseCase implements UseCase<void, String> {
  final ProductRepository productRepository;

  DeleteProductUseCase({required this.productRepository});

  @override
  ResultFuture<void> call(String params) async {
    final result = await productRepository.deleteProduct(params);
    return result;
  }
}
