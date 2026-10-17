import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/my_color.dart';
import '../../../../core/widgets/error_message_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/main_button.dart';
import '../manager/signup_Cubit/signup_cubit.dart';

class SignupSubmitButton extends StatelessWidget {
  final SignupCubit signupCubit;
  final VoidCallback onPressed;

  const SignupSubmitButton({
    super.key,
    required this.signupCubit,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      bloc: signupCubit,
      listener: (context, state) {
        if (state is SignupSuccess) {
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        final bool isLoading = state is SignupLoading;

        if (isLoading) {
          return LoadingWidget();
        }

        return Column(
          children: [
            if (state is SignupFailure) ...[
              ErrorMessageWidget(messageError: state.errMessage),
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
