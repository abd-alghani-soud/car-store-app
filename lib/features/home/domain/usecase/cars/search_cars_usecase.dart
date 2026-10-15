import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/domain/entity/car_entity.dart';
import 'package:car_store_app/features/home/domain/repository/car_repo.dart';
import 'package:dartz/dartz.dart';

class SearchCarsUsecase {
  final CarRepo repo;

  SearchCarsUsecase(this.repo);

  Future<Either<Failure, List<CarEntity>>> call({
    int? brandId,
    String? model,
    double? minPrice,
    double? maxPrice,
    int? year,
    String? fuelType,
    String? gearType,
  }) async {
    return await repo.searchCarsRepo(
      brandId: brandId,
      model: model,
      minPrice: minPrice,
      maxPrice: maxPrice,
      year: year,
      fuelType: fuelType,
      gearType: gearType,
    );
  }
}
