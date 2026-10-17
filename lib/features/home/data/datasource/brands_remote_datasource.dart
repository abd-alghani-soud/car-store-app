import 'package:car_store_app/core/error/exceptions.dart';
import 'package:car_store_app/core/services/api_service.dart';
import 'package:car_store_app/features/home/data/model/brand_model.dart';
import 'package:injectable/injectable.dart';

// =================== BrandsRemoteDatasource ===================
abstract class BrandsRemoteDatasource {
  Future<List<BrandModel>> getAllBrandsDatasource();

  Future<BrandModel> getBrandByIdDatasource(int id);

  Future<BrandModel> createBrandDatasource(BrandModel brand);

  Future<void> deleteBrandDatasource(int id);

  Future<void> updateBrandDatasource(int id, BrandModel brand);
}

// =================== BrandsRemoteDatasourceImp ===================
@Injectable(as: BrandsRemoteDatasource)
class BrandsRemoteDatasourceImp extends BrandsRemoteDatasource {
  final ApiService apiService;

  BrandsRemoteDatasourceImp({required this.apiService});

  @override
  Future<List<BrandModel>> getAllBrandsDatasource() async {
    try {
      final response = await apiService.get(endPoint: 'Brands/All-Brands');
      final List data = response;
      return data.map((json) => BrandModel.fromJson(json)).toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<BrandModel> getBrandByIdDatasource(int id) async {
    try {
      final response = await apiService.get(endPoint: 'Brands', queryParameters: {'id': id});
      return BrandModel.fromJson(response);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<BrandModel> createBrandDatasource(BrandModel brand) async {
    try {
      final response = await apiService.post(
        endPoint: 'Brands',
        data: {'brandName': brand.name},
      );
      return BrandModel.fromJson(response);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> deleteBrandDatasource(int id) async {
    try {
      await apiService.delete(endPoint: 'Brands/$id');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> updateBrandDatasource(int id, BrandModel brand) async {
    try {
      await apiService.put(
        endPoint: 'Brands/$id',
        data: {'brandName': brand.name},
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
