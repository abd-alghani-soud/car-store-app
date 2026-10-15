import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/domain/entity/brand_entity.dart';
import 'package:car_store_app/features/home/domain/repository/brand_repo.dart';
import 'package:dartz/dartz.dart';

class CreateBrandUsecase {
  final BrandRepo repo;

  CreateBrandUsecase(this.repo);

  Future<Either<Failure, BrandEntity>> call(BrandEntity brand) async {
    return await repo.createBrandRepo(brand);
  }
}
