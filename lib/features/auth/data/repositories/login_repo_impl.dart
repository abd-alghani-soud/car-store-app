import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:car_store_app/features/auth/domain/entities/login_entity.dart';
import 'package:car_store_app/features/auth/domain/repositories/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LoginRepo)
class LoginRepoImpl extends LoginRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  LoginRepoImpl({required this.authRemoteDataSource});

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
}
