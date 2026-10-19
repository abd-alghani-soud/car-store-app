import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/my_color.dart';
import '../../../../core/widgets/error_message_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/main_button.dart';

class SignupSubmitButton extends StatelessWidget {
  final AuthCubit authCubit;
  final VoidCallback onPressed;

  const SignupSubmitButton({
    super.key,
    required this.authCubit,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: authCubit,
      listener: (context, state) {
        if (state.signupStatus == StatusEnum.success) {
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        final bool isLoading = state.signupStatus == StatusEnum.loading;

        if (isLoading) {
          return LoadingWidget();
        }

        return Column(
          children: [
            if (state.signupStatus == StatusEnum.failure) ...[
              ErrorMessageWidget(messageError: state.messageError!),
              SizedBox(height: 16),
            ],
            MainButton(
              width: 330,
              height: 50,
              color: MyColor.accentBlue,
              fontWeight: FontWeight.normal,
              borderRadius: BorderRadius.circular(22),
              text: 'Sign Up',
              textColor: MyColor.background,
              fontSize: 14,
              onPressed: onPressed,
            ),
          ],
        );
      },
    );
  }
}
