import 'package:car_store_app/core/widgets/main_button.dart';
import 'package:car_store_app/features/order/presentation/widgets/custom_date_tile.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/my_color.dart';

class RentFormWidget extends StatefulWidget {
  final int carId;

  const RentFormWidget({super.key, required this.carId});

  @override
  State<RentFormWidget> createState() => _RentFormWidgetState();
}

class _RentFormWidgetState extends State<RentFormWidget> {
  DateTime? startDate;
  DateTime? endDate;
  bool isLoading = false;

  Future<void> _pickDate(BuildContext context, {required bool isStart}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          "Rent details",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: MyColor.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        CustomDateTile(
          title: 'Rent start date',
          subtitle: startDate == null
              ? "click on the start date"
              : "${startDate!.year}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
          icon: Icons.calendar_today,
          onTap: () => _pickDate(context, isStart: true),
        ),
        const SizedBox(height: 12),
        CustomDateTile(
          title: 'Rent end date',
          subtitle: endDate == null
              ? "click on the end date"
              : "${endDate!.year}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
          icon: Icons.event_available,
          onTap: () => _pickDate(context, isStart: false),
        ),
        const SizedBox(height: 24),
        MainButton(
          text: 'Confirm',
          borderRadius: BorderRadius.circular(18),
          color: MyColor.accentBlue,
          textColor: Colors.white,
          fontSize: 12,
          onPressed: isLoading
              ? null
              : () async {
                  if (startDate == null || endDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select a start and end data!"),
                      ),
                    );
                    return;
                  }

                  if (endDate!.isBefore(startDate!)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "The end date must be after the start date!",
                        ),
                      ),
                    );
                    return;
                  }
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  print("Car ID: ${widget.carId}");
                  print("Start Date: $startDate");
                  print("End Date: $endDate");
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
