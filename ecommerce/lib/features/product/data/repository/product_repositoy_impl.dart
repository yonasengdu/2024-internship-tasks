import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/core/utils/type_def.dart';
import 'package:ecommerce/features/product/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:ecommerce/features/product/domain/entity/product_entity.dart';
import 'package:ecommerce/features/product/domain/repository/product_respository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  ResultVoid addProduct(
    String title,
    num price,
    String description,
    String catagory,
    String imageUrl,
  ) async {
    try {
      final res = await remoteDataSource.addProduct(
          title, price, description, catagory, imageUrl);
      return Right(res);
    } on ServerException {
      return const Left(ServerFailure(message: "server Error"));
    }
  }

  @override
  ResultVoid deleteProduct(String id) async {
    try {
      final res = await remoteDataSource.deleteProduct(id);
      return Right(res);
    } on ServerException {
      return const Left(ServerFailure(message: "server Error"));
    }
  }

  @override
  ResultFuture<ProductEntity> getProduct(String id) async {
    try {
      final product = await remoteDataSource.getProduct(id);
      return Right(product);
    } on ServerException {
      return const Left(ServerFailure(message: "server Error"));
    }
  }

  @override
  ResultFuture<List<ProductEntity>> getProducts() async {
    try {
      final products = await remoteDataSource.getProducts();
      return Right(products);
    } on ServerException {
      return const Left(ServerFailure(message: "server Error"));
    }
  }

  @override
  ResultFuture<List<ProductEntity>> searchProducts(String query) async {
    try {
      final products = await remoteDataSource.searchProducts(query);
      return Right(products);
    } on ServerException {
      return const Left(ServerFailure(message: "server Error"));
    }
  }

  @override
  ResultVoid updateProduct(String id, String title) async {
    try {
      final res = await remoteDataSource.updateProduct(id, title);
      return Right(res);
    } on ServerException {
      return const Left(ServerFailure(message: "server Error"));
    }
  }
}
