import 'package:equatable/equatable.dart';

class GetDeleteProductParams extends Equatable {
  final String id ;
  const GetDeleteProductParams({ required this.id});
  
  @override

  List<Object?> get props => [id];
   
}