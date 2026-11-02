import 'package:car_store_app/core/constants/my_color.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/main_text_field.dart';

class InstallmentFormWidget extends StatefulWidget {
  const InstallmentFormWidget({super.key, required this.carId});

  final int carId;
  @override
  State<InstallmentFormWidget> createState() => _InstallmentFormWidgetState();
}

class _InstallmentFormWidgetState extends State<InstallmentFormWidget> {
  bool isLoading = false;
   int? installMonth;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          "installment details",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        MainTextField(
          keyboardType: TextInputType.number,
          label: 'installment month',
          borderColor: MyColor.primaryColor,
          fillColor: MyColor.inputFill,
          onChanged: (value){
            setState(() {
              installMonth=int.tryParse(value);
            });
          },
        ),
        const SizedBox(height: 12),
        MainTextField(
          label: 'Notes user',
          hint: '(Optional)',
          fillColor: MyColor.inputFill,
          borderColor: MyColor.primaryColor,
        ),
        const SizedBox(height: 12),
        MainButton(
          text: 'Confirm',
          color: MyColor.accentBlue,
          textColor: Colors.white,
          fontSize: 12,
          borderRadius: BorderRadius.circular(18),
          onPressed: isLoading
              ? null
              : () async {
                  if (installMonth == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select a installment months!"),
                      ),
                    );
                    return;
                  }
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
