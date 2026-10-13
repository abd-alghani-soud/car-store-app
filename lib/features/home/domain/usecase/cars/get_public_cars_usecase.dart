import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/domain/entity/car_entity.dart';
import 'package:car_store_app/features/home/domain/repository/car_repo.dart';
import 'package:dartz/dartz.dart';

class GetPublicCarsUseCase {
  final CarRepo repo;

  GetPublicCarsUseCase(this.repo);

  Future<Either<Failure, List<CarEntity>>> call() async {
    return await repo.getPublicCars();
  }
}
