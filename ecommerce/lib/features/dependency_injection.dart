import 'package:ecommerce/features/product/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:ecommerce/features/product/data/data_source/remote_data_source/remote_data_source_impl.dart';
import 'package:ecommerce/features/product/data/repository/product_repositoy_impl.dart';
import 'package:ecommerce/features/product/domain/repository/product_respository.dart';
import 'package:ecommerce/features/product/domain/usecase/add_product_usecase.dart';
import 'package:ecommerce/features/product/domain/usecase/delete_product_usecase.dart';
import 'package:ecommerce/features/product/domain/usecase/get_product_usecase.dart';
import 'package:ecommerce/features/product/domain/usecase/get_products_usecase.dart';
import 'package:ecommerce/features/product/domain/usecase/search_product_usecase.dart';
import 'package:ecommerce/features/product/domain/usecase/update_product_usecase.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Product
  sl.registerFactory(() => ProductBloc(
      addProductUseCase: sl(),
      deleteProductUseCase: sl(),
      getProductUseCase: sl(),
      getProductsUseCase: sl(),
      searchProductUseCase: sl(),
      updateProductUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetProductUseCase(productRepository: sl()));
  sl.registerLazySingleton(() => GetProductsUseCase(productRepository: sl()));
  sl.registerLazySingleton(() => AddProductUseCase(productRepository: sl()));
  sl.registerLazySingleton(() => UpdateProductUseCase(productRepository: sl()));
  sl.registerLazySingleton(() => DeleteProductUseCase(productRepository: sl()));
  sl.registerLazySingleton(() => SearchProductUseCase(productRepository: sl()));

  //  Repository
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
        remoteDataSource: sl(),
      ));

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton(() => http.Client());
}
