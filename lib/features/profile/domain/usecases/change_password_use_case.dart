import 'package:car_store_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/profile_action_response_entity.dart';

class ChangePasswordUseCase {
  final ProfileRepo profileRepo;

  ChangePasswordUseCase({required this.profileRepo});

  Future<Either<Failure, ProfileActionResponseEntity>> call({
    required String oldPassword,
    required String newPassword,
  }) async {
    return await profileRepo.changePasswordRepo(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }
}
