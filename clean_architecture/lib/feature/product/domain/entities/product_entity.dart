import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final num price;

  const ProductEntity(this.id, {required this.name, required this.description, required this.price});
  
  @override

  List<Object?> get props => [name, description,price];
  
}


