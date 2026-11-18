import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/core/entities/car_entity.dart';
import 'package:car_store_app/features/favorites/domain/repository/favorites_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMyFavoritesUseCase {
  final FavoritesRepo repo;

  GetMyFavoritesUseCase(this.repo);

  Future<Either<Failure, List<CarEntity>>> call() async {
    return await repo.getMyFavoritesRepo();
  }
}
