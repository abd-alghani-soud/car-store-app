import 'package:bloc/bloc.dart';
import 'package:car_store_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
  final LoginUseCase loginUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var result = await loginUseCase.call(email: email, password: password);
    result.fold(
      (failure) {
        emit(LoginFailure(errMessage: failure.message));
      },
      (loginEntity) {
        emit(
          LoginSuccess(
            message: loginEntity.message,
            token: loginEntity.token,
            role: loginEntity.role,
          ),
        );
      },
    );
  }
}
