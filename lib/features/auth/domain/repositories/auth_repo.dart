import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/login_entity.dart';
import '../entities/signup_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignupEntity>> signup({
    required String fullName,
    required String email,
    required String password,
    required String address,
    required String phone,
    required String role,
  });

  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  });
}
