import 'package:equatable/equatable.dart';

class InsertProductParams extends Equatable {
  final String name ;
  final  String description;
  final num price;

 const InsertProductParams({required this.name, required  this.description, required  this.price});
  
  @override

  List<Object?> get props => [name,description,price];
   
}