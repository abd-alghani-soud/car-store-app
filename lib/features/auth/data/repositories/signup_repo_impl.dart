import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:car_store_app/features/auth/domain/entities/signup_entity.dart';
import 'package:car_store_app/features/auth/domain/repositories/signup_repo.dart';
import 'package:dartz/dartz.dart';

class SignupRepoImpl extends SignupRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  SignupRepoImpl({required this.authRemoteDataSource});

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
