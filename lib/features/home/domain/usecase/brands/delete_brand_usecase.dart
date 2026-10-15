import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/domain/repository/brand_repo.dart';
import 'package:dartz/dartz.dart';

class DeleteBrandUsecase {
  final BrandRepo repo;

  DeleteBrandUsecase(this.repo);

  Future<Either<Failure, void>> call(int id) async {
    return await repo.deleteBrandRepo(id);
  }
}
