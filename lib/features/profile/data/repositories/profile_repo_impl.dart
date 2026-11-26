import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:car_store_app/features/profile/domain/entities/profile_action_response_entity.dart';
import 'package:car_store_app/features/profile/domain/entities/profile_entity.dart';
import 'package:car_store_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepoImpl({required this.profileRemoteDataSource});

  //================== ChangePasswordRepo ==========================
  @override
  Future<Either<Failure, ProfileActionResponseEntity>> changePasswordRepo({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final response = await profileRemoteDataSource.changePasswordDataSource(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }

  //================== DeleteAccountRepo ==========================
  @override
  Future<Either<Failure, ProfileActionResponseEntity>>
  deleteAccountRepo() async {
    try {
      final response = await profileRemoteDataSource.deleteAccountDataSource();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }

  //================== GetProfileRepo ==========================
  @override
  Future<Either<Failure, ProfileEntity>> getProfileRepo() async {
    try {
      final response = await profileRemoteDataSource.getProfileDataSource();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }

  //================== UpdateProfileRepo ==========================
  @override
  Future<Either<Failure, ProfileActionResponseEntity>> updateProfileRepo(
    String? fullName,
    String? address,
    String? phoneNumber,
  ) async {
    try {
      final response = await profileRemoteDataSource.updateProfileDataSource(
        fullName,
        address,
        phoneNumber,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return Left(ServerFailure(mapExceptionToMessage(e)));
    }
  }
}
