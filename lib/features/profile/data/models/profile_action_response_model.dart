import 'package:car_store_app/features/profile/domain/entities/profile_action_response_entity.dart';

class ProfileActionResponseModel extends ProfileActionResponseEntity {
  final String message;

  ProfileActionResponseModel({required this.message}) : super(message: message);

  factory ProfileActionResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileActionResponseModel(
      message: json['message']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}
