import 'package:car_store_app/features/home/domain/entity/car_entity.dart';
import 'package:flutter/foundation.dart';

class CarModel extends CarEntity {
  const CarModel({
    required super.id,
    required super.name,
    required super.brand,
    required super.price,
    required super.rating,
    required super.reviews,
    required super.transmission,
    required super.image,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    String imageUrl = json['imageUrl'] ?? json['image'] ?? '';
    debugPrint('=== API Car Image Received: $imageUrl ===');
    if (imageUrl.startsWith('/')) {
      imageUrl = 'http://10.0.2.2:5222$imageUrl';
    }
    return CarModel(
      id: json['carId'] ?? json['id'] ?? 0,
      name: json['model'] ?? json['name'] ?? '',
      brand: json['brandName'] ?? json['brand'] ?? '',
      price: (json['pricePerDay'] ?? json['price'] ?? 0.0).toDouble(),
      rating: (json['rating'] ?? 4.8).toDouble(),
      reviews: json['reviewsCount'] ?? json['reviews'] ?? 150,
      transmission: json['gearType'] ?? json['transmission'] ?? 'Automatic',
      image: imageUrl.isNotEmpty ? imageUrl : 'assets/images/random/ii.png',
    );
  }
}
