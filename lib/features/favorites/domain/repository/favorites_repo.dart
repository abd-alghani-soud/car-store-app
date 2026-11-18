import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/core/entities/car_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FavoritesRepo {
  Future<Either<Failure, List<CarEntity>>> getMyFavoritesRepo();

  Future<Either<Failure, String>> toggleFavoriteRepo(int carId);
}
