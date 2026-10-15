import 'package:bloc/bloc.dart';
import 'package:car_store_app/features/auth/domain/usecases/signup_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';
@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.signupUseCase}) : super(SignupInitial());
  final SignupUseCase signupUseCase;

  Future<void> signup({
    required String fullName,
    required String email,
    required String password,
    required String address,
    required String phone,
    required String role,
  }) async {
    emit(SignupLoading());
    var result = await signupUseCase.call(
      fullName: fullName,
      email: email,
      password: password,
      address: address,
      phone: phone,
      role: role,
    );
    result.fold(
      (failure) {
        emit(SignupFailure(errMessage: failure.message));
      },
      (signupEntity) {
        emit(
          SignupSuccess(
            message: signupEntity.message,
            userId: signupEntity.userId,
          ),
        );
      },
    );
  }
}
