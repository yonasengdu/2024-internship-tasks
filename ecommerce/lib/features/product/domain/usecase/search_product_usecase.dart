import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/core/utils/type_def.dart';
import 'package:ecommerce/features/product/domain/entity/product_entity.dart';
import 'package:ecommerce/features/product/domain/repository/product_respository.dart';

class SearchProductUseCase {
  final ProductRepository productRepository;

  SearchProductUseCase({required this.productRepository});

  ResultFuture<List<ProductEntity>> call(String query) async {
    final result = await productRepository.searchProducts(query);
    return result;
  }
}
