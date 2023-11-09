part of 'utils.dart';

class Request {
  static Future<Map<dynamic, dynamic>> post(
      String url, Map<dynamic, dynamic> data) async {
    try {
      final dio = Dio();

      final resp = await dio.post(url, data: data);

      return resp.data;
    } catch (e) {
      return {"status": "error", "response": "Servicio no disponible"};
    }
  }

  static Future<dynamic> get(String url) async {
    try {
      final _dio = new Dio();

      final resp = await _dio.get(url,
          options: Options(
              contentType: 'application/json', headers: <String, String>{}));

      return resp.data;
    } catch (e) {
      return {"status": "error", "response": "Servicio no disponible"};
    }
  }
}
