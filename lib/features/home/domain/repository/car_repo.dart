import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/domain/entity/car_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CarRepo {
  Future<Either<Failure, List<CarEntity>>> getPublicCars();

  Future<Either<Failure, int>> addCar(CarEntity car);

  Future<Either<Failure, void>> deleteCar(int id);

  Future<Either<Failure, void>> updateCar(int id, CarEntity car);

  Future<Either<Failure, CarEntity>> getCarById(int id);

  Future<Either<Failure, List<CarEntity>>> searchCars({
    int? brandId,
    String? model,
    double? minPrice,
    double? maxPrice,
    int? year,
    String? fuelType,
    String? gearType,
  });

  Future<Either<Failure, List<CarEntity>>> getMyCars();

  Future<Either<Failure, List<String>>> getCarImages(int id);
}
