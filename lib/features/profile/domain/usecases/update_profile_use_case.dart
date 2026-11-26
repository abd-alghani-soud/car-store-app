import 'package:car_store_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/profile_action_response_entity.dart';

class UpdateProfileUseCase {
  final ProfileRepo profileRepo;

  UpdateProfileUseCase({required this.profileRepo});

  Future<Either<Failure, ProfileActionResponseEntity>> call(
    String? fullName,
    String? address,
    String? phoneNumber,
  ) async {
    return await profileRepo.updateProfileRepo(fullName, address, phoneNumber);
  }
}
