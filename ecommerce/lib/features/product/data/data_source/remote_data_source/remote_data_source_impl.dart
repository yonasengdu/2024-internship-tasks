import 'dart:convert';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/utils/type_def.dart';
import 'package:ecommerce/features/product/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:ecommerce/features/product/data/model/product_model.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  ResultFutureDataSource<void> addProduct(
    String title,
    num price,
    String description,
    String catagory,
    String imageUrl,
  ) async {
    final response = await client.post(
        Uri.parse("https://products-api-5a5n.onrender.com/api/v1/products"));

    if (response.statusCode != 201) {
      throw  ServerException(message: "server Failure");
    }
  }

  @override
  ResultFutureDataSource<void> deleteProduct(
    String id,
  ) async {
    final response = await client.delete(Uri.parse(
        "https://products-api-5a5n.onrender.com/api/v1/products/${id}"));

    if (response.statusCode != 200) {
      throw  ServerException(message: "server Failure");
    }
  }

  @override
  ResultFutureDataSource<ProductModel> getProduct(
    String id,
  ) async {
    final response = await client.get(Uri.parse(
        "https://products-api-5a5n.onrender.com/api/v1/products/${id}"));

    if (response.statusCode == 200) {
      return ProductModel.fromMap(json.decode(response.body)["product"]);
    } else {
      throw  ServerException(message: "server Failure");
    }
  }

  @override
  ResultFutureDataSource<List<ProductModel>> getProducts() async {
    final response = await client.get(
        Uri.parse("https://products-api-5a5n.onrender.com/api/v1/products"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)["products"];
      return jsonData.map((e) => ProductModel.fromMap(e)).toList();
    } else {
      throw  ServerException(message: "server Failure");
    }
  }

  @override
  ResultFutureDataSource<List<ProductModel>> searchProducts(
    String query,
  ) async {
    DataMap queryParameters = {"title": query};
    final response = await client.get(
        Uri.parse("https://products-api-5a5n.onrender.com/api/v1/products")
            .replace(
      queryParameters: queryParameters,
    ));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)["products"];
      return jsonData.map((e) => ProductModel.fromMap(e)).toList();
    } else {
      throw  ServerException(message: "server Failure");
    }
  }

  @override
  ResultFutureDataSource<void> updateProduct(
    String id,
    String title,
  ) async {
    final response = await client.patch(Uri.parse(
        "https://products-api-5a5n.onrender.com/api/v1/products${id}"));

    if (response.statusCode != 201) {
      throw  ServerException(message: "server Failure");
    }
  }
}
