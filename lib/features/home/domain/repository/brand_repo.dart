import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/domain/entity/brand_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BrandRepo {
  // =================== getAllBrandsRepo ===================
  Future<Either<Failure, List<BrandEntity>>> getAllBrandsRepo();

  // =================== getBrandByIdRepo ===================
  Future<Either<Failure, BrandEntity>> getBrandByIdRepo(int id);

  // =================== createBrandRepo ===================
  Future<Either<Failure, BrandEntity>> createBrandRepo(BrandEntity brand);

  // =================== deleteBrandRepo ===================
  Future<Either<Failure, void>> deleteBrandRepo(int id);

  // =================== updateBrandRepo ===================
  Future<Either<Failure, void>> updateBrandRepo(int id, BrandEntity brand);
}
