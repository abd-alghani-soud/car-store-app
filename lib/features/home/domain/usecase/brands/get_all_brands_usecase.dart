import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/domain/entity/brand_entity.dart';
import 'package:car_store_app/features/home/domain/repository/brand_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandsUsecase {
  final BrandRepo repo;

  GetAllBrandsUsecase(this.repo);

  Future<Either<Failure, List<BrandEntity>>> call() async {
    return await repo.getAllBrandsRepo();
  }
}
