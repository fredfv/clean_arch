import 'package:flutter/cupertino.dart';

import '../../domain/usecase/get_space_media_from_date_usecase.dart';

class HomeStore extends ValueNotifier<int> {
  final GetSpaceMediaFromDateUsecase getSpaceMediaFromDateUsecase;

  HomeStore({required this.getSpaceMediaFromDateUsecase}) : super(0);

  getSpaceMediaFromDate(DateTime date) async {
    value = 1;
    final result = await getSpaceMediaFromDateUsecase(date);
    result.fold((error) => value = 2, (success) => value = 3);
    value = 0;
  }
}
