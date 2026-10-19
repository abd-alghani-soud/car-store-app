part of 'auth_cubit.dart';

@immutable
class AuthState extends Equatable {
  final StatusEnum? signupStatus;
  final StatusEnum? loginStatus;
  final LoginEntity? loginInf;
  final SignupEntity? signupInf;
  final String? messageError;

  AuthState({
    this.signupStatus = StatusEnum.initial,
    this.loginStatus = StatusEnum.initial,
    this.loginInf,
    this.signupInf,
    this.messageError,
  });

  @override
  List<Object?> get props => [
    signupStatus,
    loginStatus,
    signupInf,
    loginInf,
    messageError,
  ];

  AuthState copyWith({
    StatusEnum? signupStatus,
    StatusEnum? loginStatus,
    LoginEntity? loginInf,
    SignupEntity? signupInf,
    String? messageError,
  }) {
    return AuthState(
      signupStatus: signupStatus ?? this.signupStatus,
      loginStatus: loginStatus ?? this.loginStatus,
      signupInf: signupInf ?? this.signupInf,
      loginInf: loginInf ?? this.loginInf,
      messageError: messageError ?? this.messageError,
    );
  }
}
