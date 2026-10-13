import 'package:car_store_app/core/component/function/app_validate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/my_color.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/main_text_field.dart';

class SignupPageBody extends StatefulWidget {
  const SignupPageBody({super.key});

  @override
  State<SignupPageBody> createState() => _SignupPageBodyState();
}

class _SignupPageBodyState extends State<SignupPageBody> {
  final _fromKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Form(
          key: _fromKey,
          child: Column(
            children: [
              SizedBox(height: 120),
              Text(
                'Create New Account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MyColor.textPrimary,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Set Up Your UserName And Password\n You Can Always Change It Later',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: MyColor.textSecondary),
              ),
              SizedBox(height: 30),
              MainTextField(
                height: 50,
                width: 355,
                hint: 'Username',
                prefixIcon: Icon(Icons.person, color: MyColor.borderColor),
                hintTextStyle: TextStyle(
                  color: MyColor.borderColor,
                  fontSize: 16,
                ),
                fillColor: MyColor.inputFill,
                borderRadius: BorderRadius.circular(16),
              ),
              SizedBox(height: 20),
              MainTextField(
                controller: _emailController,
                validator: (value) {
                  return validateEmail(value);
                },
                height: 50,
                width: 355,
                hint: 'Email',
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: MyColor.borderColor,
                ),
                hintTextStyle: TextStyle(
                  color: MyColor.borderColor,
                  fontSize: 16,
                ),
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
                hintTextStyle: TextStyle(
                  color: MyColor.borderColor,
                  fontSize: 16,
                ),
                fillColor: MyColor.inputFill,
                borderRadius: BorderRadius.circular(16),
                isPassword: true,
              ),
              SizedBox(height: 20),
              MainTextField(
                controller: _passwordConfirmController,
                validator: (value) {
                  return validateConfirmPassword(
                    value,
                    _passwordController.text,
                  );
                },
                height: 50,
                width: 355,
                hint: 'Confirm password',
                prefixIcon: Icon(
                  Icons.lock_outline_sharp,
                  color: MyColor.borderColor,
                ),
                hintTextStyle: TextStyle(
                  color: MyColor.borderColor,
                  fontSize: 16,
                ),
                fillColor: MyColor.inputFill,
                borderRadius: BorderRadius.circular(16),
                isPassword: true,
              ),
              SizedBox(height: 62),
              MainButton(
                text: 'Sign Up',
                textColor: MyColor.background,
                fontSize: 14,
                fontWeight: FontWeight.normal,
                width: 330,
                height: 50,
                color: MyColor.accentBlue,
                borderRadius: BorderRadius.circular(22),
                onPressed: () {
                  if (_fromKey.currentState!.validate()) {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    print('Login Success : Email:$email');
                  } else {
                    print('Validation Error');
                  }
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have on account? ',
                    style: TextStyle(color: MyColor.textPrimary, fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(color: MyColor.accentBlue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
