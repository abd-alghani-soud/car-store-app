import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/profile/domain/entities/profile_entity.dart';
import 'package:car_store_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:dartz/dartz.dart';

class GetProfileUseCase {
  final ProfileRepo profileRepo;

  GetProfileUseCase({required this.profileRepo});

  Future<Either<Failure, ProfileEntity>> call() async {
    return await profileRepo.getProfileRepo();
  }
}
