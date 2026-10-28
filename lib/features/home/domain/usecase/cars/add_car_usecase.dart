import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/core/entities/car_entity.dart';
import 'package:car_store_app/features/home/domain/repository/car_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCarUsecase {
  final CarRepo repo;

  AddCarUsecase(this.repo);

  Future<Either<Failure, int>> call(CarEntity car) async {
    return await repo.addCarRepo(car);
  }
}
