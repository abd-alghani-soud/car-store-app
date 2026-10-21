import 'package:car_store_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/signup_entity.dart';

@injectable
class SignupUseCase {
  final AuthRepo authRepo;

  SignupUseCase({required this.authRepo});

  Future<Either<Failure, SignupEntity>> call({
    required String fullName,
    required String email,
    required String password,
    required String address,
    required String phone,
    required String role,
  }) async {
    return await authRepo.signupRepo(
      fullName: fullName,
      email: email,
      password: password,
      address: address,
      phone: phone,
      role: role,
    );
  }
}
