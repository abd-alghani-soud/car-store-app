import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/core/entities/car_entity.dart';
import 'package:car_store_app/features/home/domain/repository/car_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCarByIdUsecase {
  final CarRepo repo;

  GetCarByIdUsecase(this.repo);

  Future<Either<Failure, CarEntity>> call(int id) async {
    return await repo.getCarByIdRepo(id);
  }
}
