import 'package:ecommerce/core/utils/type_def.dart';
import 'package:ecommerce/features/product/domain/entity/product_entity.dart';

abstract class ProductRepository {
  ResultFuture<List<ProductEntity>> getProducts();
  ResultFuture<ProductEntity> getProduct(
    String id,
  );
  ResultFuture<List<ProductEntity>> searchProducts(
    String query,
  );
  ResultVoid updateProduct(
    String id,
    String title,
  );
  ResultVoid deleteProduct(
    String id,
  );
  ResultVoid addProduct(
    String title,
    num price,
    String description,
    String catagory,
    String imageUrl,
  );
}
