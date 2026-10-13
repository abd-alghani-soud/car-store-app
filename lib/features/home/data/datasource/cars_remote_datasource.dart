import 'package:car_store_app/core/services/api_service.dart';
import 'package:car_store_app/features/home/data/model/car_model.dart';

// =================== CarsRemoteDatasource ===================
abstract class CarsRemoteDatasource {
  Future<List<CarModel>> getPublicCarsDatasource();

  Future<int> addCarDatasource(CarModel car);

  Future<void> deleteCarDatasource(int id);

  Future<void> updateCarDatasource(int id, CarModel car);

  Future<CarModel> getCarByIdDatasource(int id);

  Future<List<CarModel>> searchCarsDatasource({
    int? brandId,
    String? model,
    double? minPrice,
    double? maxPrice,
    int? year,
    String? fuelType,
    String? gearType,
  });

  Future<List<CarModel>> getMyCarsDatasource();

  Future<List<String>> getCarImagesDatasource(int id);
}

// =================== CarsRemoteDatasourceImp ===================
class CarsRemoteDatasourceImp implements CarsRemoteDatasource {
  final ApiService api;

  CarsRemoteDatasourceImp(this.api);

  // =================== getPublicCarsDatasource ===================
  @override
  Future<List<CarModel>> getPublicCarsDatasource() async {
    final response = await api.get(endPoint: 'Cars');
    final List data = response;
    return data.map((car) => CarModel.fromJson(car)).toList();
  }

  // =================== getCarByIdDatasource ===================
  @override
  Future<CarModel> getCarByIdDatasource(int id) async {
    final response = await api.get(endPoint: 'Cars/$id');
    return CarModel.fromJson(response);
  }

  @override
  Future<List<String>> getCarImagesDatasource(int id) async {
    final response = await api.get(endPoint: 'Cars/$id/images');
    final List data = response;
    return data.map((img) => img.toString()).toList();
  }

  // =================== searchCarsDatasource ===================

  @override
  Future<List<CarModel>> searchCarsDatasource({
    int? brandId,
    String? model,
    double? minPrice,
    double? maxPrice,
    int? year,
    String? fuelType,
    String? gearType,
  }) async {
    final response = await api.get(
      endPoint: 'Cars/search',
      queryParameters: {
        if (brandId != null) 'brandId': brandId,
        if (model != null) 'model': model,
        if (minPrice != null) 'minPrice': minPrice,
        if (maxPrice != null) 'maxPrice': maxPrice,
        if (year != null) 'year': year,
        if (fuelType != null) 'fuelType': fuelType,
        if (gearType != null) 'gearType': gearType,
      },
    );
    final List data = response;
    return data.map((car) => CarModel.fromJson(car)).toList();
  }

  // =================== getMyCarsDatasource ===================
  @override
  Future<List<CarModel>> getMyCarsDatasource() async {
    final response = await api.get(endPoint: 'Cars/my-cars');
    final List data = response;
    return data.map((car) => CarModel.fromJson(car)).toList();
  }

  // =================== addCarDatasource ===================

  @override
  Future<int> addCarDatasource(CarModel car) async {
    final response = await api.post(
      endPoint: 'Cars/add',
      data: {
        'model': car.name,
        'pricePerDay': car.price,
        'gearType': car.transmission,
      },
    );
    return response['carId'] ?? response['id'] ?? 0;
  }

  // =================== deleteCarDatasource ===================
  @override
  Future<void> deleteCarDatasource(int id) async {
    await api.delete(endPoint: 'Cars/$id');
  }

  // =================== updateCarDatasource ===================
  @override
  Future<void> updateCarDatasource(int id, CarModel car) async {
    await api.put(
      endPoint: 'Cars/$id',
      data: {
        'model': car.name,
        'pricePerDay': car.price,
        'gearType': car.transmission,
      },
    );
  }
}
