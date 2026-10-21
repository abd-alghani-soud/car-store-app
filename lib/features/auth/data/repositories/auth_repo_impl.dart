import 'package:car_store_app/core/error/exceptions.dart';
import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/auth/domain/entities/login_entity.dart';
import 'package:car_store_app/features/auth/domain/entities/signup_entity.dart';
import 'package:car_store_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../datasources/auth_remote_data_source.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  // =================== login ===================
  @override
  Future<Either<Failure, LoginEntity>> loginRepo({
    required String email,
    required String password,
  }) async {
    try {
      LoginEntity loginEntity;
      loginEntity = await authRemoteDataSource.loginDatasource(
        email: email,
        password: password,
      );
      return right(loginEntity);
    } on ServerException catch (e) {
      return left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return left(ServerFailure(mapExceptionToMessage(e)));
    }
  }

  // =================== signup ===================
  @override
  Future<Either<Failure, SignupEntity>> signupRepo({
    required String fullName,
    required String email,
    required String password,
    required String address,
    required String phone,
    required String role,
  }) async {
    try {
      SignupEntity signupEntity;
      signupEntity = await authRemoteDataSource.signupDatasource(
        fullName: fullName,
        email: email,
        password: password,
        address: address,
        phone: phone,
        role: role,
      );
      return right(signupEntity);
    } on ServerException catch (e) {
      return left(ServerFailure(mapExceptionToMessage(e.message)));
    } catch (e) {
      return left(ServerFailure(mapExceptionToMessage(e)));
    }
  }
}
