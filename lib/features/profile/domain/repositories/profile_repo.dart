import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/profile/domain/entities/profile_action_response_entity.dart';
import 'package:car_store_app/features/profile/domain/entities/profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  //=========================getProfileRepo======================
  Future<Either<Failure, ProfileEntity>> getProfileRepo();

  //=========================changePasswordRepo===================
  Future<Either<Failure, ProfileActionResponseEntity>> changePasswordRepo({
    required String oldPassword,
    required String newPassword,
  });

  //=========================updateProfile============================
  Future<Either<Failure, ProfileActionResponseEntity>> updateProfileRepo(
    String? fullName,
    String? address,
    String? phoneNumber,
  );

  //=========================deleteAccountRepo======================
  Future<Either<Failure, ProfileActionResponseEntity>> deleteAccountRepo();
}
