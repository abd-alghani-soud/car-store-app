import 'package:car_store_app/core/services/api_service.dart';
import 'package:car_store_app/features/auth/data/models/login_model.dart';
import 'package:car_store_app/features/auth/data/models/signup_model.dart';
import 'package:car_store_app/features/auth/domain/entities/login_entity.dart';
import 'package:car_store_app/features/auth/domain/entities/signup_entity.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<LoginEntity> loginDatasource({required String email, required String password});

  Future<SignupEntity> signupDatasource({
    required String fullName,
    required String email,
    required String password,
    required String address,
    required String phone,
    required String role,
  });
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl({required this.apiService});

  // =================== login ===================
  @override
  Future<LoginEntity> loginDatasource({
    required String email,
    required String password,
  }) async {
    final data = await apiService.post(
      endPoint: 'Auth/login',
      data: {"email": email, "password": password},
    );
    LoginEntity loginEntity;
    loginEntity = LoginModel.fromJson(data);
    return loginEntity;
  }

  // =================== signup ===================
  @override
  Future<SignupEntity> signupDatasource({
    required String fullName,
    required String email,
    required String password,
    required String address,
    required String phone,
    required String role,
  }) async {
    final data = await apiService.post(
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
