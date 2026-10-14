import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/login_entity.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  });
}
