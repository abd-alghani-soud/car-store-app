import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/features/order/presentation/manager/order_cubit/order_cubit.dart';
import 'package:car_store_app/features/order/presentation/widgets/rent_date_selectors_widget.dart';
import 'package:car_store_app/features/order/presentation/widgets/rent_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/component/function/show_snackbar.dart';
import '../../../../core/constants/my_color.dart';
import '../../../../core/widgets/main_text_field.dart';

class RentFormWidget extends StatefulWidget {
  final int carId;
  final OrderCubit orderCubit;

  const RentFormWidget({
    super.key,
    required this.carId,
    required this.orderCubit,
  });

  @override
  State<RentFormWidget> createState() => _RentFormWidgetState();
}

class _RentFormWidgetState extends State<RentFormWidget> {
  final TextEditingController _notesController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;

  Future<void> _pickDate(BuildContext context, {required bool isStart}) async {
    final DateTime now = DateTime.now();
    final DateTime initial = isStart
        ? (startDate ?? now)
        : (endDate ?? startDate ?? now);
    final DateTime first = isStart ? now : (startDate ?? now);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initial.isBefore(first) ? first : initial,
      firstDate: first,
      lastDate: now.add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
          if (endDate != null && endDate!.isBefore(startDate!)) {
            endDate = null;
          }
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      bloc: widget.orderCubit,
      listener: (context, state) {
        if (state.rentOrderStatus == StatusEnum.success) {
          showSnackBar(
            message: 'purchased successfully',
            icon: Icons.offline_pin_outlined,
            iconColor: Colors.green,
            context: context,
          );
          _notesController.clear();
          setState(() {
            startDate = null;
            endDate = null;
          });
        }
        if (state.rentOrderStatus == StatusEnum.failure) {
          showSnackBar(
            message: state.errMessage ?? 'someThing went wrong!',
            icon: Icons.cancel_outlined,
            iconColor: Colors.red,
            context: context,
          );
        }
      },
      child: ListView(
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
          RentDateSelectorsWidget(
            startDate: startDate,
            endDate: endDate,
            onPickDate: (isStart) => _pickDate(context, isStart: isStart),
          ),
          const SizedBox(height: 12),
          MainTextField(
            controller: _notesController,
            label: 'Notes user',
            hint: '(Optional)',
            fillColor: MyColor.inputFill,
            borderColor: MyColor.primaryColor,
          ),
          const SizedBox(height: 24),
          RentSubmitButton(
            orderCubit: widget.orderCubit,
            onPressed: _submitRentOrder,
          ),
        ],
      ),
    );
  }

  void _submitRentOrder() {
    if (startDate == null || endDate == null) {
      showSnackBar(
        message: 'Please select start and end dates!',
        icon: Icons.warning_amber_outlined,
        iconColor: Colors.yellow,
        context: context,
      );
      return;
    }

    if (!endDate!.isAfter(startDate!)) {
      showSnackBar(
        message: 'End date must be after start date!',
        icon: Icons.warning_amber_outlined,
        iconColor: Colors.yellow,
        context: context,
      );
      return;
    }

    widget.orderCubit.rentOrder(
      widget.carId,
      _notesController.text,
      startDate!,
      endDate!,
    );
  }
}
