import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/favorites/domain/repository/favorites_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class ToggleFavoriteUseCase {
  final FavoritesRepo repo;

  ToggleFavoriteUseCase(this.repo);

  Future<Either<Failure, String>> call(int carId) async {
    return await repo.toggleFavoriteRepo(carId);
  }
}
