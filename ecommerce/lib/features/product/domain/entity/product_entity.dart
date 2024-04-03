import 'package:ecommerce/features/product/domain/entity/rating_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String title;
  final num price;
  final String description;
  final String catagory;
  final String imageUrl;
  final RatingEntity rating;

  const ProductEntity(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.catagory,
      required this.imageUrl,
      required this.rating});

  @override
  List<Object?> get props =>
      [id, title, price, description, catagory, imageUrl, rating];
}
