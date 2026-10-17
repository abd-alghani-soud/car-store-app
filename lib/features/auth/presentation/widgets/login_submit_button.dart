import 'package:car_store_app/core/route/app_route.dart';
import 'package:car_store_app/core/widgets/error_message_widget.dart';
import 'package:car_store_app/core/widgets/loading_widget.dart';
import 'package:car_store_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/my_color.dart';
import '../../../../core/widgets/main_button.dart';

class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({
    super.key,
    required this.loginCubit,
    required this.onPressed,
  });

  final LoginCubit loginCubit;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: loginCubit,
      listener: (context, state) {
        if (state is LoginSuccess) {
          if (context.mounted) {
            GoRouter.of(context).go(AppRoute.kSignupPage);
          }
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoading;
        if (isLoading) {
          return LoadingWidget();
        }
        return Column(
          children: [
            if (state is LoginFailure) ...[
              ErrorMessageWidget(messageError: state.errMessage),
              SizedBox(height: 16),
            ],
            MainButton(
              text: 'Login',
              textColor: MyColor.background,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              width: 330,
              height: 50,
              color: MyColor.accentBlue,
              borderRadius: BorderRadius.circular(22),
              onPressed: onPressed,
            ),
          ],
        );
      },
    );
  }
}
