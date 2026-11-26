import 'package:car_store_app/core/services/api_service.dart';
import 'package:car_store_app/core/services/shared_preferences_service.dart';
import 'package:dio/dio.dart';
import '../models/profile_action_response_model.dart';
import '../models/profile_model.dart';
//=================== abstract ==================

//=================== profileRemoteDataSource ==================
abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfileDataSource();

  Future<ProfileActionResponseModel> changePasswordDataSource({
    required String oldPassword,
    required String newPassword,
  });

  Future<ProfileActionResponseModel> updateProfileDataSource(
    String? fullName,
    String? address,
    String? phoneNumber,
  );

  Future<ProfileActionResponseModel> deleteAccountDataSource();
}

//=================== profileRemoteDataSourceImpl ==================
class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiService apiService;

  ProfileRemoteDataSourceImpl({required this.apiService});

  //=================== ChangePasswordDataSource ==================
  @override
  Future<ProfileActionResponseModel> changePasswordDataSource({
    required String oldPassword,
    required String newPassword,
  }) async {
    final token = SharedPreferencesService.getToken();
    final data = await apiService.post(
      endPoint: 'Auth/change-password',
      data: {"oldPassword": oldPassword, "newPassword": newPassword},
      options: Options(
        headers: {
          if (token != null && token.isNotEmpty)
            'Authorization': 'Bearer $token',
        },
      ),
    );
    return ProfileActionResponseModel.fromJson(data);
  }

  //=================== DeleteAccountDataSource ==================
  @override
  Future<ProfileActionResponseModel> deleteAccountDataSource() async {
    final token = SharedPreferencesService.getToken();
    final data = await apiService.delete(
      endPoint: 'Auth/delete-account',
      options: Options(
        headers: {
          if (token != null && token.isNotEmpty)
            'Authorization': 'Bearer $token',
        },
      ),
    );
    return ProfileActionResponseModel.fromJson(data);
  }

  //=================== GetProfileDataSource ==================
  @override
  Future<ProfileModel> getProfileDataSource() async {
    final token = SharedPreferencesService.getToken();
    final data = await apiService.get(
      endPoint: 'Auth/profile',
      options: Options(
        headers: {
          if (token != null && token.isNotEmpty)
            'Authorization': 'Bearer $token',
        },
      ),
    );
    return ProfileModel.fromJson(data);
  }

  //=================== UpdateProfileDataSource ==================
  @override
  Future<ProfileActionResponseModel> updateProfileDataSource(
    String? fullName,
    String? address,
    String? phoneNumber,
  ) async {
    final token = SharedPreferencesService.getToken();
    final data = await apiService.put(
      endPoint: 'Auth/update-profile',
      data: {"fullName": fullName, "phone": phoneNumber, "address": address},
      options: Options(
        headers: {
          if (token != null && token.isNotEmpty)
            'Authorization': 'Bearer $token',
        },
      ),
    );
    return ProfileActionResponseModel.fromJson(data);
  }
}
