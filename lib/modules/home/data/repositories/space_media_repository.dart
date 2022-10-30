import 'package:clean_arch/core/usecase/erros/exceptions.dart';
import 'package:clean_arch/core/usecase/erros/failures.dart';

import 'package:clean_arch/modules/home/domain/entities/space_images.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/i_space_media_repository.dart';
import '../datasources/i_space_media_datasource.dart';

class SpaceMediaRepository implements ISpaceMediaRepository {
  final ISpaceMediaDatasource datasource;

  SpaceMediaRepository({required this.datasource});

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date) async {
    try {
      final result = await datasource.getSpaceMediaFromDate(date);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
    //aqui da para colocar mais Exceptions, como por exemplo, um CacheException, que seria um erro de cache
    //retornando um Left(CacheFailure()), por exemplo
  }
}
