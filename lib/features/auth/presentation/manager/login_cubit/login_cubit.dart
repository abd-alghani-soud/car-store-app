import 'package:bloc/bloc.dart';
import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/features/auth/domain/entities/login_entity.dart';
import 'package:car_store_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginState());
  final LoginUseCase loginUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(loginStatus: StatusEnum.loading));
    var result = await loginUseCase.call(email: email, password: password);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            messageError: failure.message,
            loginStatus: StatusEnum.failure,
          ),
        );
      },
      (loginEntity) {
        emit(
          state.copyWith(
            loginEntity: loginEntity,
            loginStatus: StatusEnum.success,
          ),
        );
      },
    );
  }
}
