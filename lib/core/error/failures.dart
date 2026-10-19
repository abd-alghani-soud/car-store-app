import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class UnAuthenticatedFailure extends Failure {
  const UnAuthenticatedFailure(super.message);
}

class OfflineFailure extends Failure {
  const OfflineFailure(super.message);
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure(super.message);
}

String mapExceptionToMessage(dynamic e) {
  if (e is DioException) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timed out. Please try again';

      case DioExceptionType.connectionError:
        return 'Please check your internet connection';

      case DioExceptionType.badResponse:
        final responseData = e.response?.data;
        print('error :$responseData');

        // إذا كانت الاستجابة نصاً صريحاً (String) مثل ما يرسله الباك إند حالياً
        if (responseData is String) {
          return responseData;
        }

        // إذا كانت الاستجابة عبارة عن JSON (Map)
        if (responseData is Map) {
          if (responseData.containsKey('message')) {
            return responseData['message'].toString();
          } else if (responseData.containsKey('title')) {
            return responseData['title'].toString();
          }
        }

        return 'Server error occurred. Please try again later';
      default:
        return 'Something went wrong. Please try again later';
    }
  }

  // في حال كان Exception عادي
  final String errorStr = e.toString();
  if (errorStr.contains('Connection refused') ||
      errorStr.contains('SocketException') ||
      errorStr.contains('Network is unreachable') ||
      errorStr.contains('Failed host lookup')) {
    return 'Please check your internet connection';
  }

  return 'Something went wrong. Please try again later';
}
