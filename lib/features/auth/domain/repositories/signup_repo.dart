import 'package:car_store_app/core/error/failures.dart';
import 'package:car_store_app/features/auth/domain/entities/signup_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignupRepo {
  Future<Either<Failure, SignupEntity>> signup({
    required String fullName,
    required String email,
    required String password,
    required String address,
    required String phone,
    required String role,
  });
}
