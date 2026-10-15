import 'package:car_store_app/core/error/exceptions.dart';
import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/data/datasource/brands_remote_datasource.dart';
import 'package:car_store_app/features/home/data/model/brand_model.dart';
import 'package:car_store_app/features/home/domain/entity/brand_entity.dart';
import 'package:car_store_app/features/home/domain/repository/brand_repo.dart';
import 'package:dartz/dartz.dart';

class BrandRepoImp implements BrandRepo {
  final BrandsRemoteDatasource data;

  BrandRepoImp(this.data);

  // =================== getAllBrandsRepo ===================
  @override
  Future<Either<Failure, List<BrandEntity>>> getAllBrandsRepo() async {
    try {
      final response = await data.getAllBrandsDatasource();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // =================== getBrandByIdRepo ===================
  @override
  Future<Either<Failure, BrandEntity>> getBrandByIdRepo(int id) async {
    try {
      final response = await data.getBrandByIdDatasource(id);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // =================== createBrandRepo ===================
  @override
  Future<Either<Failure, BrandEntity>> createBrandRepo(BrandEntity brand) async {
    try {
      final brandModel = brand is BrandModel
          ? brand
          : BrandModel(
              id: brand.id,
              name: brand.name,
              logoUrl: brand.logoUrl,
              modelsCount: brand.modelsCount,
            );
      final response = await data.createBrandDatasource(brandModel);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // =================== deleteBrandRepo ===================
  @override
  Future<Either<Failure, void>> deleteBrandRepo(int id) async {
    try {
      await data.deleteBrandDatasource(id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  // =================== updateBrandRepo ===================
  @override
  Future<Either<Failure, void>> updateBrandRepo(int id, BrandEntity brand) async {
    try {
      final brandModel = brand is BrandModel
          ? brand
          : BrandModel(
              id: brand.id,
              name: brand.name,
              logoUrl: brand.logoUrl,
              modelsCount: brand.modelsCount,
            );
      await data.updateBrandDatasource(id, brandModel);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
