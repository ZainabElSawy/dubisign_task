import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._dio);
  final Dio _dio;

  Future<dynamic> get({required String endPoint}) async {
    var headers = {'Accept': 'application/json'};
    Response response = await _dio.request(
      endPoint,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      log(json.encode(response.data));
    }
    return response.data;
  }
}
