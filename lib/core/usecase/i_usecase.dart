import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'erros/failures.dart';

abstract class IUsecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

//utilizando para quando não for necessário passar parâmetros
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
