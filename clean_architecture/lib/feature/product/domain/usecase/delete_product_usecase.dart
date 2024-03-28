
import 'package:clean_architecture/core/constants/params/product/params.dart';
import 'package:clean_architecture/core/failures/failure.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/feature/product/domain/repositories/repository.dart';
import 'package:either_dart/either.dart';

class DeleteProductUsesCase implements UseCase<String,GetDeleteProductParams> {
  final ProductRepository productRepository;

  DeleteProductUsesCase({required this.productRepository});

  @override
  Future<Either<Mire, String>> call(GetDeleteProductParams product) async {
    return await productRepository.deleteProduct(product.id);
  }

}