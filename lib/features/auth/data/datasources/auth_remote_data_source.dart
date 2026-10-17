import 'package:car_store_app/core/services/api.dart';
import 'package:car_store_app/features/auth/data/models/login_model.dart';
import 'package:car_store_app/features/auth/data/models/signup_model.dart';
import 'package:car_store_app/features/auth/domain/entities/login_entity.dart';
import 'package:car_store_app/features/auth/domain/entities/signup_entity.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<LoginEntity> login({required String email, required String password});

  Future<SignupEntity> signup({
    required String fullName,
    required String email,
    required String password,
    required String address,
    required String phone,
    required String role,
  });
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final Api api;

  AuthRemoteDataSourceImpl({required this.api});

  @override
  Future<LoginEntity> login({
    required String email,
    required String password,
  }) async {
    var data = await api.post(
      endPoint: 'Auth/login',
      data: {"email": email, "password": password},
    );
    LoginEntity loginEntity;
    loginEntity = LoginModel.fromJson(data);
    return loginEntity;
  }

  @override
  Future<SignupEntity> signup({
    required String fullName,
    required String email,
    required String password,
    required String address,
    required String phone,
    required String role,
  }) async {
    var data = await api.post(
      endPoint: 'Auth/register',
      data: {
        "fullName": fullName,
        "email": email,
        "password": password,
        "role": "user",
        "phone": phone,
        "address": address,
      },
    );
    SignupEntity signupEntity;
    signupEntity = SignupModel.fromJson(data);
    return signupEntity;
  }
}
