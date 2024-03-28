
import 'package:equatable/equatable.dart';

class UpdateProductParams extends Equatable {
  final String id ;
  final String name ;
  final  String description;
  final num price;

 const UpdateProductParams({required this.id, required this.name, required  this.description, required  this.price});
  
  @override

  List<Object?> get props => [name,description,price];
   
}