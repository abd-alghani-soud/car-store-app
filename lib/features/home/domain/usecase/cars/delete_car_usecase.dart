import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/domain/repository/car_repo.dart';
import 'package:dartz/dartz.dart';

class DeleteCarUsecase {
  final CarRepo repo;

  DeleteCarUsecase(this.repo);

  Future<Either<Failure, void>> call(int id) async {
    return await repo.deleteCarRepo(id);
  }
}
