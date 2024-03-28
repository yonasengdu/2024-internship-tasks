

import 'package:clean_architecture/core/constants/params/product/params.dart';
import 'package:clean_architecture/core/failures/failure.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/feature/product/domain/entities/entity.dart';
import 'package:clean_architecture/feature/product/domain/repositories/repository.dart';
import 'package:either_dart/either.dart';

class UpdateProductUseCase implements UseCase<ProductEntity,UpdateProductParams> {
  final  ProductRepository productRepository;

  UpdateProductUseCase({required this.productRepository});
  @override
  Future<Either<Mire, ProductEntity>> call(UpdateProductParams product) async {
    return await productRepository.updateProduct(product.id, product.name, product.description, product.price);
  }
}