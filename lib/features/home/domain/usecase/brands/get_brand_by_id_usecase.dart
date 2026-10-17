import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/domain/entity/brand_entity.dart';
import 'package:car_store_app/features/home/domain/repository/brand_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandByIdUsecase {
  final BrandRepo repo;

  GetBrandByIdUsecase(this.repo);

  Future<Either<Failure, BrandEntity>> call(int id) async {
    return await repo.getBrandByIdRepo(id);
  }
}
