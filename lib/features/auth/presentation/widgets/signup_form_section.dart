import 'package:car_store_app/features/auth/presentation/widgets/signup_submit_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/component/function/app_validate.dart';
import '../../../../core/constants/my_color.dart';
import '../../../../core/services/dependecies.dart';
import '../../../../core/widgets/main_text_field.dart';
import '../manager/signup_Cubit/signup_cubit.dart';

class SignupFormSection extends StatefulWidget {
  const SignupFormSection({super.key});

  @override
  State<SignupFormSection> createState() => _SignupFormSectionState();
}

class _SignupFormSectionState extends State<SignupFormSection> {
  late SignupCubit signupCubit;
  final _fromKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  @override
  void initState() {
    signupCubit = getIt.get<SignupCubit>();
    super.initState();
  }

  @override
  void dispose() {
    signupCubit.close();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _fullNameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromKey,
      child: Column(
        children: [
          MainTextField(
            controller: _fullNameController,
            validator: (value) {
              return validateRequired(value);
            },
            height: 50,
            width: 355,
            hint: 'Username',
            prefixIcon: Icon(Icons.person, color: MyColor.borderColor),
            hintTextStyle: TextStyle(color: MyColor.borderColor, fontSize: 16),
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
          SizedBox(height: 20),
          MainTextField(
            controller: _phoneController,
            validator: (value) {
              return validateRequired(value);
            },
            height: 50,
            width: 355,
            hint: 'phone number',
            prefixIcon: Icon(Icons.phone, color: MyColor.borderColor),
            hintTextStyle: TextStyle(color: MyColor.borderColor, fontSize: 16),
            fillColor: MyColor.inputFill,
            borderRadius: BorderRadius.circular(16),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          MainTextField(
            controller: _addressController,
            height: 50,
            width: 355,
            validator: (value) {
              return validateRequired(value);
            },
            hint: 'Address',
            prefixIcon: Icon(
              Icons.location_city_outlined,
              color: MyColor.borderColor,
            ),
            hintTextStyle: TextStyle(color: MyColor.borderColor, fontSize: 16),
            fillColor: MyColor.inputFill,
            borderRadius: BorderRadius.circular(16),
          ),
          SizedBox(height: 62),
          SignupSubmitButton(
            signupCubit: signupCubit,
            onPressed: () {
              if (_fromKey.currentState!.validate()) {
                signupCubit.signup(
                  fullName: _fullNameController.text,
                  email: _emailController.text,
                  password: _passwordController.text,
                  address: _addressController.text,
                  phone: _phoneController.text,
                  role: 'user',
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
