import 'package:car_store_app/features/home/domain/entity/brand_entity.dart';

class BrandModel extends BrandEntity {
  const BrandModel({
    required super.id,
    required super.name,
    required super.logoUrl,
    required super.modelsCount,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    String logo = json['brandLogoUrl'] ?? json['logoUrl'] ?? '';
    if (logo.startsWith('/')) {
      logo = 'http://10.0.2.2:5000$logo';
    }
    return BrandModel(
      id: json['brandId'] ?? json['id'] ?? 0,
      name: json['name'] ?? '',
      logoUrl: logo,
      modelsCount: json['modelsCount'] ?? 10,
    );
  }
}
