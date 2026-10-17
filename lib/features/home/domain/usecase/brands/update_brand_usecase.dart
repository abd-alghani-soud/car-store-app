import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/domain/entity/brand_entity.dart';
import 'package:car_store_app/features/home/domain/repository/brand_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateBrandUsecase {
  final BrandRepo repo;

  UpdateBrandUsecase(this.repo);

  Future<Either<Failure, void>> call(int id, BrandEntity brand) async {
    return await repo.updateBrandRepo(id, brand);
  }
}
