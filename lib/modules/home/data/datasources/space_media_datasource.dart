import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/usecase/erros/exceptions.dart';
import '../../../../core/utils/date_input_converter.dart';
import '../models/space_media_model.dart';
import 'endpoints/space_endpoints.dart';
import 'i_space_media_datasource.dart';

class SpaceMediaDatasource implements ISpaceMediaDatasource {
  final DateInputConverter converter;
  final http.Client client;

  SpaceMediaDatasource({
    required this.converter,
    required this.client,
  });

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    final dateConverted = converter.format(date);
    final response = await client.get(NasaEndpoints.getSpaceMedia(
      'DEMO_KEY',
      dateConverted,
    ));
    if (response.statusCode == 200) {
      return SpaceMediaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
