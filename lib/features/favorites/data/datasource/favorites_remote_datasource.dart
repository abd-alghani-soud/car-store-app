import 'package:car_store_app/core/error/exceptions.dart';
import 'package:car_store_app/core/services/api_service.dart';
import 'package:car_store_app/core/services/shared_preferences_service.dart';
import 'package:car_store_app/core/models/car_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class FavoritesRemoteDatasource {
  Future<List<CarModel>> getMyFavoritesDatasource();

  Future<String> toggleFavoriteDatasource(int carId);
}

@Injectable(as: FavoritesRemoteDatasource)
class FavoritesRemoteDatasourceImp implements FavoritesRemoteDatasource {
  final ApiService api;

  FavoritesRemoteDatasourceImp(this.api);

  // =================== getMyFavoritesDatasource ===================
  @override
  Future<List<CarModel>> getMyFavoritesDatasource() async {
    final token = SharedPreferencesService.getToken();
    final response = await api.get(
      endPoint: 'Favorites/my-favorites',
      options: Options(
        headers: {
          if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
        },
      ),
    );
    if (response is List) {
      return response.map((car) => CarModel.fromJson(car)).toList();
    } else if (response is Map && response.containsKey('message')) {
      throw ServerException(response['message'].toString());
    }
    return [];
  }

  // =================== toggleFavoriteDatasource ===================
  @override
  Future<String> toggleFavoriteDatasource(int carId) async {
    final token = SharedPreferencesService.getToken();
    final response = await api.post(
      endPoint: 'Favorites/toggle/$carId',
      options: Options(
        headers: {
          if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
        },
      ),
    );
    if (response is Map) {
      return response['message'] ?? response['Message'] ?? 'Success';
    }
    return response.toString();
  }
}
