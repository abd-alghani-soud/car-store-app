import 'package:bloc/bloc.dart';
import 'package:car_store_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/enums/status_enum.dart';
import '../../../domain/entities/login_entity.dart';
import '../../../domain/entities/signup_entity.dart';
import '../../../domain/usecases/signup_use_case.dart';

part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.signupUseCase, required this.loginUseCase})
    : super(AuthState());
  final SignupUseCase signupUseCase;
  final LoginUseCase loginUseCase;

  //========================SignupCubit========================

  Future<void> signup({
    required String fullName,
    required String email,
    required String password,
    required String address,
    required String phone,
    required String role,
  }) async {
    emit(state.copyWith(signupStatus: StatusEnum.loading));
    final result = await signupUseCase.call(
      fullName: fullName,
      email: email,
      password: password,
      address: address,
      phone: phone,
      role: role,
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            messageError: failure.message,
            signupStatus: StatusEnum.failure,
          ),
        );
      },
      (signupInf) {
        emit(
          state.copyWith(
            signupInf: signupInf,
            signupStatus: StatusEnum.success,
          ),
        );
      },
    );
  }

  //========================LoginCubit========================
  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(loginStatus: StatusEnum.loading));
    final result = await loginUseCase.call(email: email, password: password);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            messageError: failure.message,
            loginStatus: StatusEnum.failure,
          ),
        );
      },
      (loginInf) {
        emit(
          state.copyWith(loginInf: loginInf, loginStatus: StatusEnum.success),
        );
      },
    );
  }
}
