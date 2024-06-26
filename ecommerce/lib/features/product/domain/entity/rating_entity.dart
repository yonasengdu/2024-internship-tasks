import 'package:equatable/equatable.dart';

class RatingEntity extends Equatable {
  final num rate;
  final num count;

   RatingEntity({required this.rate, required this.count});

  @override
  List<Object?> get props => [rate, count];
}
