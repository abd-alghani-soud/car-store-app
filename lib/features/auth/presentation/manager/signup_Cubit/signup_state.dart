part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final String message;
  final int userId;

  SignupSuccess({required this.message, required this.userId});
}

final class SignupFailure extends SignupState {
  final String errMessage;

  SignupFailure({required this.errMessage});
}
