import 'package:car_store_app/core/services/dependecies.dart';
import 'package:car_store_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:car_store_app/features/auth/presentation/widgets/login_submit_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/component/function/app_validate.dart';
import '../../../../core/constants/my_color.dart';
import '../../../../core/widgets/main_text_field.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  late LoginCubit loginCubit;
  final _fromKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    loginCubit = getIt.get<LoginCubit>();
    super.initState();
  }

  @override
  void dispose() {
    loginCubit.close();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromKey,
      child: Column(
        children: [
          MainTextField(
            controller: _emailController,
            validator: (value) {
              return validateEmail(value);
            },
            height: 50,
            width: 355,
            hint: 'Email',
            prefixIcon: Icon(Icons.email_outlined, color: MyColor.borderColor),
            hintTextStyle: TextStyle(color: MyColor.borderColor, fontSize: 16),
            fillColor: MyColor.inputFill,
            borderRadius: BorderRadius.circular(16),
          ),
          SizedBox(height: 20),
          MainTextField(
            controller: _passwordController,
            validator: (value) {
              return validatePassword(value);
            },
            height: 50,
            width: 355,
            hint: 'password',
            prefixIcon: Icon(
              Icons.lock_outline_sharp,
              color: MyColor.borderColor,
            ),
            hintTextStyle: TextStyle(color: MyColor.borderColor, fontSize: 16),
            fillColor: MyColor.inputFill,
            borderRadius: BorderRadius.circular(16),
            isPassword: true,
          ),
          SizedBox(height: 62),
          LoginSubmitButton(
            loginCubit: loginCubit,
            onPressed: () {
              if (_fromKey.currentState!.validate()) {
                loginCubit.login(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
