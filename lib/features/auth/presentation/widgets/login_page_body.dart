import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/constants/my_images.dart';
import 'package:car_store_app/core/route/app_route.dart';
import 'package:car_store_app/core/widgets/main_button.dart';
import 'package:car_store_app/core/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/component/function/app_validate.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final _fromKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120),
              SvgPicture.asset(MyImages.logIcon),
              SizedBox(height: 30),
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MyColor.textPrimary,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Log in to your account using email',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: MyColor.textSecondary),
              ),
              SizedBox(height: 30),
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
              SizedBox(height: 62),
              MainButton(
                text: 'Login',
                textColor: MyColor.background,
                fontSize: 14,
                fontWeight: FontWeight.normal,
                width: 330,
                height: 50,
                color: MyColor.accentBlue,
                borderRadius: BorderRadius.circular(22),
                onPressed: () {

                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'First time here? ',
                    style: TextStyle(color: MyColor.textPrimary, fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRoute.kSignupPage);
                    },
                    child: Text(
                      'Sign Up',
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
