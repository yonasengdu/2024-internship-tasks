import 'package:clean_architecture/core/failures/mire.dart';

class Minte implements Mire {
  final String message;

  const Minte({required this.message});

  @override
  List<Object> get props =>  [message];

  @override
  bool? get stringify => true;
  
}