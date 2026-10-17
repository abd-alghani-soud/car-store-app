import 'package:car_store_app/core/error/exceptions.dart';
import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/data/datasource/cars_remote_datasource.dart';
import 'package:car_store_app/features/home/data/model/car_model.dart';
import 'package:car_store_app/features/home/domain/entity/car_entity.dart';
import 'package:car_store_app/features/home/domain/repository/car_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CarRepo)
class CarRepoImp implements CarRepo {
  final CarsRemoteDatasource data;

  CarRepoImp(this.data);

  // =================== getPublicCarsRepo ===================
  @override
  Future<Either<Failure, List<CarEntity>>> getPublicCarsRepo() async {
    try {
      final response = await data.getPublicCarsDatasource();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }

  // =================== getCarByIdRepo ===================
  @override
  Future<Either<Failure, CarEntity>> getCarByIdRepo(int id) async {
    try {
      final response = await data.getCarByIdDatasource(id);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }

  // =================== getCarImagesRepo ===================
  @override
  Future<Either<Failure, List<String>>> getCarImagesRepo(int id) async {
    try {
      final response = await data.getCarImagesDatasource(id);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }

  // =================== searchCarsRepo ===================
  @override
  Future<Either<Failure, List<CarEntity>>> searchCarsRepo({
    int? brandId,
    String? model,
    double? minPrice,
    double? maxPrice,
    int? year,
    String? fuelType,
    String? gearType,
  }) async {
    try {
      final response = await data.searchCarsDatasource(
        brandId: brandId,
        model: model,
        minPrice: minPrice,
        maxPrice: maxPrice,
        year: year,
        fuelType: fuelType,
        gearType: gearType,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }

  // =================== getMyCarsRepo ===================
  @override
  Future<Either<Failure, List<CarEntity>>> getMyCarsRepo() async {
    try {
      final response = await data.getMyCarsDatasource();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }

  // =================== addCarRepo ===================
  @override
  Future<Either<Failure, int>> addCarRepo(CarEntity car) async {
    try {
      final carModel = car is CarModel
          ? car
          : CarModel(
              id: car.id,
              name: car.name,
              brand: car.brand,
              price: car.price,
              rating: car.rating,
              reviews: car.reviews,
              transmission: car.transmission,
              image: car.image,
            );
      final response = await data.addCarDatasource(carModel);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }

  // =================== deleteCarRepo ===================
  @override
  Future<Either<Failure, void>> deleteCarRepo(int id) async {
    try {
      await data.deleteCarDatasource(id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }

  // =================== updateCarRepo ===================
  @override
  Future<Either<Failure, void>> updateCarRepo(int id, CarEntity car) async {
    try {
      final carModel = car is CarModel
          ? car
          : CarModel(
              id: car.id,
              name: car.name,
              brand: car.brand,
              price: car.price,
              rating: car.rating,
              reviews: car.reviews,
              transmission: car.transmission,
              image: car.image,
            );
      await data.updateCarDatasource(id, carModel);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }
}
