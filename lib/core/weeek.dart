import 'package:weeek_api/core/api.dart';

class Weeek with Api {
  static late String _api;
  Weeek._() {
    initApi(_createToken());
  }
  static Future<void> init(String apiKey) async {
    _api = apiKey;
  }

  String _createToken() {
    return "Bearer $_api";
  }

  static Weeek getInstance() {
    return Weeek._();
  }
}
