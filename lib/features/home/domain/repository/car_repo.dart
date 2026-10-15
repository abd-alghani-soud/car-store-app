import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/domain/entity/car_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CarRepo {
  // =================== getPublicCarsRepo ===================
  Future<Either<Failure, List<CarEntity>>> getPublicCarsRepo();

  // =================== getCarByIdRepo ===================
  Future<Either<Failure, CarEntity>> getCarByIdRepo(int id);

  // =================== getCarImagesRepo ===================
  Future<Either<Failure, List<String>>> getCarImagesRepo(int id);

  // =================== searchCarsRepo ===================
  Future<Either<Failure, List<CarEntity>>> searchCarsRepo({
    int? brandId,
    String? model,
    double? minPrice,
    double? maxPrice,
    int? year,
    String? fuelType,
    String? gearType,
  });

  // =================== getMyCarsRepo ===================
  Future<Either<Failure, List<CarEntity>>> getMyCarsRepo();

  // =================== addCarRepo ===================
  Future<Either<Failure, int>> addCarRepo(CarEntity car);

  // =================== deleteCarRepo ===================
  Future<Either<Failure, void>> deleteCarRepo(int id);

  // =================== updateCarRepo ===================
  Future<Either<Failure, void>> updateCarRepo(int id, CarEntity car);
}
