import 'package:clean_architecture/core/failures/mire.dart';
import 'package:clean_architecture/feature/product/domain/entities/entity.dart';
import 'package:either_dart/either.dart';

abstract class ProductRepository {
  Future<Either<Mire,String>> insertProduct(String name,String description,num price);
  Future<Either<Mire,ProductEntity>> updateProduct(String id, name,String description,num price);
  Future<Either<Mire,String>> deleteProduct(String id);
  Future<Either<Mire,List<ProductEntity>>> getProduct(String id);
}
