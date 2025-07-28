import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../modules/movies/domain/entites/movie.dart';
import '../error/failure.dart';

abstract class BaseUseCase<T,Parameter>{

  Future<Either< Failure,T>> call(Parameter parameter);
}

class NoParameter extends Equatable{
  const NoParameter();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}