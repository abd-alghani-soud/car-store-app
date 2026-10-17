import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/home/domain/repository/car_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCarImagesUsecase {
  final CarRepo repo;

  GetCarImagesUsecase(this.repo);

  Future<Either<Failure, List<String>>> call(int id) async {
    return await repo.getCarImagesRepo(id);
  }
}
