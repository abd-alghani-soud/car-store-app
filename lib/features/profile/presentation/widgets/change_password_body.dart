import 'package:car_store_app/core/component/function/app_validate.dart';
import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/widgets/main_text_field.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/main_button.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  final _fromKey = GlobalKey<FormState>();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromKey,
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(height: 120),
          MainTextField(
            controller: _oldPasswordController,
            validator: (value) {
              return validatePassword(value);
            },
            fillColor: MyColor.inputFill,
            borderColor: MyColor.primaryColor,
            hint: 'Old Password',
            isPassword: true,
          ),
          SizedBox(height: 16),
          MainTextField(
            controller: _newPasswordController,
            validator: (value) {
              return validateNewPassword(value, _oldPasswordController.text);
            },
            fillColor: MyColor.inputFill,
            borderColor: MyColor.primaryColor,
            hint: 'New Password',
            isPassword: true,
          ),
          SizedBox(height: 16),
          MainTextField(
            controller: _confirmPasswordController,
            validator: (value) {
              return validateConfirmPassword(
                value,
                _newPasswordController.text,
              );
            },
            fillColor: MyColor.inputFill,
            borderColor: MyColor.primaryColor,
            hint: 'Confirm Password',
            isPassword: true,
          ),
          SizedBox(height: 32),
          MainButton(
            width: double.infinity,
            text: 'Confirm',
            color: MyColor.accentBlue,
            textColor: Colors.white,
            fontSize: 12,
            borderRadius: BorderRadius.circular(18),
            onPressed: () {
              if (_fromKey.currentState!.validate()) {
                _oldPasswordController.clear();
                _confirmPasswordController.clear();
                _newPasswordController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
