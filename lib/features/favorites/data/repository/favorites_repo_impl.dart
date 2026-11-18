import 'package:car_store_app/core/error/exceptions.dart';
import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/core/entities/car_entity.dart';
import 'package:car_store_app/features/favorites/data/datasource/favorites_remote_datasource.dart';
import 'package:car_store_app/features/favorites/domain/repository/favorites_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoritesRepo)
class FavoritesRepoImpl implements FavoritesRepo {
  final FavoritesRemoteDatasource dataSource;

  FavoritesRepoImpl(this.dataSource);

  // =================== getMyFavoritesRepo ===================

  @override
  Future<Either<Failure, List<CarEntity>>> getMyFavoritesRepo() async {
    try {
      final response = await dataSource.getMyFavoritesDatasource();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }

  // =================== toggleFavoriteRepo ===================

  @override
  Future<Either<Failure, String>> toggleFavoriteRepo(int carId) async {
    try {
      final response = await dataSource.toggleFavoriteDatasource(carId);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }
}
