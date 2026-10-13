import 'package:dio/dio.dart';

class Api {
  final String _baseUrl = 'http://localhost:5222/api';
  final Dio _dio;

  Api(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl/$endPoint');
    return response.data;
  }
  Future<Map<String, dynamic>>post ({dynamic data ,required String endPoint})async{
    final response=await _dio.post('$_baseUrl/$endPoint',data: data);
    return response.data;
  }
}
