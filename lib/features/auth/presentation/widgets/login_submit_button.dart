import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/core/route/app_route.dart';
import 'package:car_store_app/core/widgets/error_message_widget.dart';
import 'package:car_store_app/core/widgets/loading_widget.dart';
import 'package:car_store_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/my_color.dart';
import '../../../../core/widgets/main_button.dart';

class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({
    super.key,
    required this.authCubit,
    required this.onPressed,
  });

  final AuthCubit authCubit;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: authCubit,
      listener: (context, state) {
        if (state.loginStatus == StatusEnum.success) {
          GoRouter.of(context).go(AppRoute.kHomePage);
        }
      },
      builder: (context, state) {
        final isLoading = state.loginStatus == StatusEnum.loading;
        if (isLoading) {
          return LoadingWidget();
        }
        return Column(
          children: [
            if (state.loginStatus == StatusEnum.failure) ...[
              ErrorMessageWidget(messageError: state.messageError!),
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
