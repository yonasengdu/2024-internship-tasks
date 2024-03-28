

import 'package:clean_architecture/core/constants/params/product/params.dart';
import 'package:clean_architecture/core/failures/failure.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/feature/product/domain/repositories/repository.dart';
import 'package:either_dart/either.dart';

class InsertProductUseCase implements UseCase<String,InsertProductParams> {
  final ProductRepository productRepository;

  InsertProductUseCase({required this.productRepository});


  @override
  Future<Either<Mire, String>> call(InsertProductParams product) async {
    return await productRepository.insertProduct(product.name, product.description, product.price);
 
  }
  
}

