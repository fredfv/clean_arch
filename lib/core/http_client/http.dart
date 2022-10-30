import 'package:clean_arch/core/http_client/i_http_client.dart';
import 'package:http/http.dart' as httpPackage;

class Http implements IHttpClient {
  final client = httpPackage.Client();

  @override
  Future<HttpResponse> get(String url) async {
    final response = await client.get(Uri.parse(url));
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> post(String url, {required Map<String, dynamic> body}) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
