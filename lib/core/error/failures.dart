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
  final String errorStr = e.toString();
  if (errorStr.contains('Connection refused') ||
      errorStr.contains('SocketException') ||
      errorStr.contains('Network is unreachable') ||
      errorStr.contains('Failed host lookup')) {
    return 'Please check your internet connection';
  } else if (errorStr.contains('Timeout')) {
    return 'Connection timed out. Please try again';
  } else {
    return 'Something went wrong. Please try again later';
  }
}
