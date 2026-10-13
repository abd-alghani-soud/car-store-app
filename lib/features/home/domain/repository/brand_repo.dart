import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/domain/entity/brand_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BrandRepo {
  Future<Either<Failure, List<BrandEntity>>> getAllBrands();

  Future<Either<Failure, BrandEntity>> getBrandById(int id);

  Future<Either<Failure, BrandEntity>> createBrand(BrandEntity brand);

  Future<Either<Failure, void>> deleteBrand(int id);

  Future<Either<Failure, void>> updateBrand(int id, BrandEntity brand);
}
