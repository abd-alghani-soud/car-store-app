import 'package:car_store_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/login_entity.dart';

@injectable
class LoginUseCase {
  final AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  Future<Either<Failure, LoginEntity>> call({
    required String email,
    required String password,
  }) async {
    return await authRepo.login(email: email, password: password);
  }
}
