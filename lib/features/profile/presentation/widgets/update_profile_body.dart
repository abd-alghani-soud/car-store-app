import 'package:car_store_app/core/component/function/app_validate.dart';
import 'package:car_store_app/core/component/function/show_snackbar.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/my_color.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/main_text_field.dart';

class UpdateProfileBody extends StatefulWidget {
  const UpdateProfileBody({super.key});

  @override
  State<UpdateProfileBody> createState() => _UpdateProfileBodyState();
}

class _UpdateProfileBodyState extends State<UpdateProfileBody> {
  final _fromKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
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
            controller: _fullNameController,
            fillColor: MyColor.inputFill,
            borderColor: MyColor.primaryColor,
            hint: 'Full Name',
          ),
          SizedBox(height: 16),
          MainTextField(
            controller: _phoneNumberController,
            validator: (value) {
              return validateNumber(value);
            },
            keyboardType: TextInputType.number,
            fillColor: MyColor.inputFill,
            borderColor: MyColor.primaryColor,
            hint: 'Phone Number',
          ),
          SizedBox(height: 16),
          MainTextField(
            controller: _addressController,
            fillColor: MyColor.inputFill,
            borderColor: MyColor.primaryColor,
            hint: 'Address',
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
              final hasAnyInput =
                  _addressController.text.trim().isNotEmpty ||
                  _fullNameController.text.trim().isNotEmpty ||
                  _phoneNumberController.text.trim().isNotEmpty;
              if (!hasAnyInput) {
                showSnackBar(
                  message: 'please fill in at least one field to update.',
                  icon: Icons.warning_amber_outlined,
                  iconColor: Colors.yellow,
                  context: context,
                );
                return;
              }
              if (_fromKey.currentState!.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
