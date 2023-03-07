// ignore_for_file: file_names
import 'package:dio/dio.dart';
import 'package:flutter_application_2/application/EndPoints.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://awn-sa.com/awn-test/public/api/',
        receiveDataWhenStatusError: true,
        headers: {
          "lang": "ar",
          "Accept": "application/json",
        },
        receiveTimeout: 5000,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
      'lang': "ar",
      'Authorization': "Bearer $TOKEN"
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
      'lang': "ar",
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
      'lang': "ar",
      'Authorization': token ?? '',
    };
    return await dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
