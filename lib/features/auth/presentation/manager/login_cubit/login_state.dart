part of 'login_cubit.dart';

@immutable
class LoginState extends Equatable {
  final StatusEnum? loginStatus;
  final LoginEntity? loginEntity;
  final String? messageError;

  LoginState({
    this.loginStatus = StatusEnum.initial,
    this.loginEntity,
    this.messageError,
  });

  @override
  List<Object?> get props => [loginStatus, loginEntity, messageError];

  LoginState copyWith({
    StatusEnum? loginStatus,
    LoginEntity? loginEntity,
    String? messageError,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      loginEntity: loginEntity ?? this.loginEntity,
      messageError: messageError ?? this.messageError,
    );
  }
}
