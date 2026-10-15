import 'package:car_store_app/features/auth/domain/repositories/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/login_entity.dart';
@injectable
class LoginUseCase {
  final LoginRepo loginRepo;

  LoginUseCase({required this.loginRepo});

  Future<Either<Failure, LoginEntity>> call({
    required String email,
    required String password,
  }) async {
    return await loginRepo.login(email: email, password: password);
  }
}
