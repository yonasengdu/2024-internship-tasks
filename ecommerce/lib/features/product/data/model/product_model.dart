import 'package:ecommerce/core/utils/type_def.dart';
import 'package:ecommerce/features/product/data/model/rating_model.dart';
import 'package:ecommerce/features/product/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.catagory,
    required super.imageUrl,
    required super.rating,
  });

  factory ProductModel.fromMap(DataMap map) {
    return ProductModel(
      id: map["_id"],
      title: map["title"],
      price: map["price"],
      description: map["description"],
      catagory: map["category"],
      imageUrl: map["image"],
      rating: RatingModel.fromMap(map["rating"]),
    );
  }
}
