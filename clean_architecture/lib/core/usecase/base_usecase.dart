import 'package:clean_architecture/core/failures/mire.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type,Params> {
  Future<Either<Mire,Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}