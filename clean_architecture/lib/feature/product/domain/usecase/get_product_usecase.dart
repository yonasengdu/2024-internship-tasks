
import 'package:clean_architecture/core/constants/params/product/params.dart';
import 'package:clean_architecture/core/failures/failure.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/feature/product/domain/entities/entity.dart';
import 'package:clean_architecture/feature/product/domain/repositories/repository.dart';
import 'package:either_dart/either.dart';

class GetProductUseCase implements UseCase<List<ProductEntity>,GetDeleteProductParams> {
  final ProductRepository productRepository;

  GetProductUseCase({required this.productRepository});

  @override
  Future<Either<Mire, List<ProductEntity>>> call(GetDeleteProductParams product) async {
    return await productRepository.getProduct(product.id);
  }

}