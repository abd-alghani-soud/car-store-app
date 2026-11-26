import 'package:car_store_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/profile_action_response_entity.dart';

class DeleteAccountUseCase {
  final ProfileRepo profileRepo;

  DeleteAccountUseCase({required this.profileRepo});

  Future<Either<Failure, ProfileActionResponseEntity>> call() async {
    return await profileRepo.deleteAccountRepo();
  }
}
