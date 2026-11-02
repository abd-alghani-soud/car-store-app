import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/widgets/main_button.dart';
import 'package:car_store_app/core/widgets/main_text_field.dart';
import 'package:flutter/material.dart';

class BuyFormWidget extends StatefulWidget {
  const BuyFormWidget({super.key, required this.carId});

  final int carId;

  @override
  State<BuyFormWidget> createState() => _BuyFormWidgetState();
}

class _BuyFormWidgetState extends State<BuyFormWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "Buy details",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        MainTextField(
          label: 'Notes user',
          hint: '(Optional)',
          fillColor: MyColor.inputFill,
          borderColor: MyColor.primaryColor,
        ),
        SizedBox(height: 20),
        MainButton(
          text: 'Confirm',
          color: MyColor.accentBlue,
          textColor: Colors.white,
          fontSize: 12,
          borderRadius: BorderRadius.circular(18),
          onPressed: isLoading
              ? null
              : () async {
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  print("Car ID: ${widget.carId}");
                  if (mounted) {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
        ),
      ],
    );
  }
}
