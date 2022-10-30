import 'package:clean_arch/core/usecase/erros/failures.dart';
import 'package:clean_arch/modules/home/domain/usecase/get_space_media_from_date_usecase.dart';
import 'package:clean_arch/modules/home/presenter/controllers/home_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/date_mock.dart';
import '../../../../mocks/space_media_entity_mock.dart';

class MockGetSpaceMediaFromDateUsecase extends Mock implements GetSpaceMediaFromDateUsecase {}

void main() {
  late HomeStore store;
  late GetSpaceMediaFromDateUsecase mockUsecase;

  setUp(() {
    mockUsecase = MockGetSpaceMediaFromDateUsecase();
    store = HomeStore(getSpaceMediaFromDateUsecase: mockUsecase);
  });

  test('should return a SpaceMedia from the usecase', () async {
    // Arrange
    when(() => mockUsecase(any())).thenAnswer((_) async => const Right(tSpaceMedia));

    // Act
    await store.getSpaceMediaFromDate(tDate);

    // Assert
    expect(0, store.value);
    verify(() => mockUsecase(tDate)).called(1);
  });

  final tFailure = ServerFailure();

  test('should return a error from the usecase', () async {
    // Arrange
    when(() => mockUsecase(any())).thenAnswer((_) async => Left(tFailure));

    // Act
    await store.getSpaceMediaFromDate(tDate);

    // Assert
    expect(0, store.value);
    verify(() => mockUsecase(tDate)).called(1);
  });
}
