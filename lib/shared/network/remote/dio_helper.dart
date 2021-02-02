import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class DioHelper {
  static Dio dio;

  DioHelper() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/v2/',
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
  }

  static Future<Response> postData({
    path,
    data,
    token,
    query,
  }) async {
    return await dio.post(
      path,
      data: data ?? null,
      queryParameters:  query ?? null,
    );
  }
}

class Http {
  static fetchData(path) async {
    var api ;
    http.Response response = await http.get('$path');
     api = json.decode(response.body);
    return api ;
  }
}