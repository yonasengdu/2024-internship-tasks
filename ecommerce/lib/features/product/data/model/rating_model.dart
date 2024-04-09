import 'package:ecommerce/core/utils/type_def.dart';
import 'package:ecommerce/features/product/domain/entity/rating_entity.dart';

class RatingModel extends RatingEntity {
   RatingModel({
    required super.rate,
    required super.count,
  });

  factory RatingModel.fromMap(DataMap map) {
    return RatingModel(rate: map["rate"], count: map["count"]);
  }
}
