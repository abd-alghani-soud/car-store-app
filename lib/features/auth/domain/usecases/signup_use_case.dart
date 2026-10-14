import 'package:car_store_app/features/auth/domain/repositories/signup_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/signup_entity.dart';

class SignupUseCase {
  final SignupRepo signupRepo;

  SignupUseCase({required this.signupRepo});

  Future<Either<Failure, SignupEntity>> call({
    required String fullName,
    required String email,
    required String password,
    required String address,
    required String phone,
    required String role,
  }) async {
    return await signupRepo.signup(
      fullName: fullName,
      email: email,
      password: password,
      address: address,
      phone: phone,
      role: role,
    );
  }
}
