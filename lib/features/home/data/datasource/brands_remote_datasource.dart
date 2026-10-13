import 'package:car_store_app/core/services/api_service.dart';
import 'package:car_store_app/features/home/data/model/brand_model.dart';

// =================== BrandsRemoteDatasource ===================
abstract class BrandsRemoteDatasource {
  Future<List<BrandModel>> getAllBrandsDatasource();

  Future<BrandModel> getBrandByIdDatasource(int id);

  Future<BrandModel> createBrandDatasource(BrandModel brand);

  Future<void> deleteBrandDatasource(int id);

  Future<void> updateBrandDatasource(int id, BrandModel brand);
}

// =================== BrandsRemoteDatasourceImp ===================
class BrandsRemoteDatasourceImp extends BrandsRemoteDatasource {
  final ApiService apiService;

  BrandsRemoteDatasourceImp({required this.apiService});

  // =================== getAllBrandsDatasource ===================

  @override
  Future<List<BrandModel>> getAllBrandsDatasource() async {
    final response = await apiService.get(endPoint: 'Brands/All-Brands');
    final List data = response;
    return data.map((json) => BrandModel.fromJson(json)).toList();
  }

  // =================== getBrandByIdDatasource ===================

  @override
  Future<BrandModel> getBrandByIdDatasource(int id) async {
    final response = await apiService.get(
      endPoint: 'Brands',
      queryParameters: {'id': id},
    );
    return BrandModel.fromJson(response);
  }

  // =================== createBrandDatasource ===================

  @override
  Future<BrandModel> createBrandDatasource(BrandModel brand) async {
    final response = await apiService.post(
      endPoint: 'Brands',
      data: {'brandName': brand.name},
    );
    return BrandModel.fromJson(response);
  }

  // =================== deleteBrandDatasource ===================
  @override
  Future<void> deleteBrandDatasource(int id) async {
    await apiService.delete(endPoint: 'Brands/$id');
  }

  // =================== updateBrandDatasource ===================
  @override
  Future<void> updateBrandDatasource(int id, BrandModel brand) async {
    await apiService.put(
      endPoint: 'Brands/$id',
      data: {'brandName': brand.name},
    );
  }
}
