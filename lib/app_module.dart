import 'package:clean_arch/core/utils/date_input_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/data/datasources/space_media_datasource.dart';
import 'modules/home/data/repositories/space_media_repository.dart';
import 'modules/home/domain/usecase/get_space_media_from_date_usecase.dart';
import 'modules/home/presenter/controllers/home_store.dart';
import 'package:http/http.dart' as http;

import 'modules/home/presenter/pages/home_page.dart';
import 'modules/home/presenter/pages/picture_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => HomeStore(getSpaceMediaFromDateUsecase: i())),
    Bind.lazySingleton((i) => GetSpaceMediaFromDateUsecase(i())),
    Bind.lazySingleton((i) => SpaceMediaRepository(datasource: i())),
    Bind.lazySingleton((i) => SpaceMediaDatasource(converter: i(), client: i())),
    Bind.lazySingleton((i) => http.Client()),
    Bind.lazySingleton((i) => DateInputConverter()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
    //ChildRoute('/picture', child: (_, args) => PicturePage.fromArgs(args.data)),
  ];
}
