import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/auth/domain/entities/login_entity.dart';
import 'package:car_store_app/features/auth/domain/entities/signup_entity.dart';
import 'package:car_store_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../datasources/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      LoginEntity loginEntity;
      loginEntity = await authRemoteDataSource.login(
        email: email,
        password: password,
      );
      return right(loginEntity);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignupEntity>> signup({
    required String fullName,
    required String email,
    required String password,
    required String address,
    required String phone,
    required String role,
  }) async {
    try {
      SignupEntity signupEntity;
      signupEntity = await authRemoteDataSource.signup(
        fullName: fullName,
        email: email,
        password: password,
        address: address,
        phone: phone,
        role: role,
      );
      return right(signupEntity);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
