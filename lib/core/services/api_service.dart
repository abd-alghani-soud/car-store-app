import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl = "http://localhost:5000/api";

  ApiService(this._dio);

  // =================== get ===================
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

  // =================== post ===================
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

  // =================== put ===================
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

  // =================== delete ===================
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