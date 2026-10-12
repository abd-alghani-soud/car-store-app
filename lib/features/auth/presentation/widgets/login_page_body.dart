import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/constants/my_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_elevated_button.dart';
import 'custom_text_from_filed.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
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
          CustomTextFromFiled(
            hintText: 'Email',
            prefixIcon: Icon(Icons.email_outlined),
          ),
          SizedBox(height: 20),
          CustomTextFromFiled(
            hintText: 'Password',
            prefixIcon: Icon(Icons.lock_outline_sharp),
          ),
          SizedBox(height: 62),
          CustomElevatedButton(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'First time here? ',
                style: TextStyle(color: MyColor.textPrimary, fontSize: 14),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: MyColor.accentBlue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
