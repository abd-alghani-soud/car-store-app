import 'package:car_store_app/features/home/domain/entity/brand_entity.dart';

class BrandModel extends BrandEntity {
  const BrandModel({
    required super.id,
    required super.name,
    required super.logoUrl,
    required super.modelsCount,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['brandId'] ?? json['id'] ?? 0,
      name: json['name'] ?? '',
      logoUrl: json['brandLogoUrl'] ?? json['logoUrl'] ?? '',
      modelsCount: json['modelsCount'] ?? 10,
    );
  }
}
