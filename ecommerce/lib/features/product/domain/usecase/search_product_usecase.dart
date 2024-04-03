import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/core/utils/type_def.dart';
import 'package:ecommerce/features/product/domain/entity/product_entity.dart';
import 'package:ecommerce/features/product/domain/repository/product_respository.dart';

class SearchProductUseCase implements UseCase<ProductEntity, String> {
  final ProductRepository productRepository;

  SearchProductUseCase({required this.productRepository});

  @override
  ResultFuture<ProductEntity> call(String params) async {
    final result = await productRepository.getProduct(params);
    return result;
  }
}
