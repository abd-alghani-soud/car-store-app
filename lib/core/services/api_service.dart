import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  final Dio _dio;
  // Note: 10.0.2.2 is used for Android Emulator, 5222 is the ASP.NET Core backend port from launchSettings.json
  //final String _baseUrl = "http://10.0.2.2:5222/api";
  final String _baseUrl = 'http://localhost:5222/api';
  ApiService(this._dio);

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final response = await _dio.get(
      '$_baseUrl/$endPoint',
      queryParameters: queryParameters,
      options: options,
    );
    return response.data;
  }

  Future<dynamic> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final response = await _dio.post(
      '$_baseUrl/$endPoint',
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return response.data;
  }

  Future<dynamic> put({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final response = await _dio.put(
      '$_baseUrl/$endPoint',
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return response.data;
  }

  Future<dynamic> delete({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final response = await _dio.delete(
      '$_baseUrl/$endPoint',
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return response.data;
  }
}
