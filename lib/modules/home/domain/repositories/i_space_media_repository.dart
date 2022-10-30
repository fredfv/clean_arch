import 'package:dartz/dartz.dart';
import '../../../../core/usecase/erros/failures.dart';
import '../entities/space_images.dart';

abstract class ISpaceMediaRepository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date);
}
