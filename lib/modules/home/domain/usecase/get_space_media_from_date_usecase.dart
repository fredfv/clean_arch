import 'package:dartz/dartz.dart';

import '../../../../core/usecase/erros/failures.dart';
import '../../../../core/usecase/i_usecase.dart';
import '../entities/space_images.dart';
import '../repositories/i_space_media_repository.dart';

class GetSpaceMediaFromDateUsecase implements IUsecase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUsecase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime? date) async {
    return date != null ? await repository.getSpaceMediaFromDate(date) : Left(NullParamFailure());
  }
}
