import 'package:coincap/models/app_config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HttpService {
  // http client
  final Dio dio = Dio();

  AppConfig? _appConfig;
  String? _baseUrl;

  HttpService() {
    _appConfig = GetIt.instance.get<AppConfig>();
    _baseUrl = _appConfig!.API_BASE_URL;
  }

  Future<Response?> get(String path) async {
    try {
      String url = "$_baseUrl$path";
      Response response = await dio.get(url);
      return response;
    } catch (e) {
      print("Unable to perform a get request");
      print(e);
    }

    return null;
  }
}