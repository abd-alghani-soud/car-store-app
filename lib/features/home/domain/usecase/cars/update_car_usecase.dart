import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/domain/entity/car_entity.dart';
import 'package:car_store_app/features/home/domain/repository/car_repo.dart';
import 'package:dartz/dartz.dart';

class UpdateCarUsecase {
  final CarRepo repo;

  UpdateCarUsecase(this.repo);

  Future<Either<Failure, void>> call(int id, CarEntity car) async {
    return await repo.updateCarRepo(id, car);
  }
}
