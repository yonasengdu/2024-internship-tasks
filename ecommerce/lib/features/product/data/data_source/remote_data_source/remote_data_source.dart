import 'package:ecommerce/core/utils/type_def.dart';
import 'package:ecommerce/features/product/data/model/product_model.dart';

abstract class RemoteDataSource {
  ResultFutureDataSource<List<ProductModel>> getProducts();
  ResultFutureDataSource<ProductModel> getProduct(
    String id,
  );
  ResultFutureDataSource<List<ProductModel>> searchProducts(
    String query,
  );
  ResultFutureDataSource<void> updateProduct(
    String id,
    String title,
  );
  ResultFutureDataSource<void> deleteProduct(
    String id,
  );
  ResultFutureDataSource<void> addProduct(
    String title,
    num price,
    String description,
    String catagory,
    String imageUrl,
  );
}
