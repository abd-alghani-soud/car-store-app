import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/core/widgets/loading_widget.dart';
import 'package:car_store_app/core/widgets/main_button.dart';
import 'package:car_store_app/features/order/presentation/manager/order_cubit/order_cubit.dart';
import 'package:car_store_app/features/order/presentation/widgets/custom_date_tile.dart';
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
  void dispose() {
    _notesController.dispose();
    super.dispose();
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
        const SizedBox(height: 12),
        MainTextField(
          controller: _notesController,
          label: 'Notes user',
          hint: '(Optional)',
          fillColor: MyColor.inputFill,
          borderColor: MyColor.primaryColor,
        ),
        const SizedBox(height: 24),
        BlocConsumer<OrderCubit, OrderState>(
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
          builder: (context, state) {
            if (state.rentOrderStatus == StatusEnum.initial ||
                state.rentOrderStatus == StatusEnum.success ||
                state.rentOrderStatus == StatusEnum.failure) {
              return MainButton(
                width: 400,
                text: 'Confirm',
                borderRadius: BorderRadius.circular(18),
                color: MyColor.accentBlue,
                textColor: Colors.white,
                fontSize: 12,
                onPressed: _submitRentOrder,
              );
            }
            if (state.rentOrderStatus == StatusEnum.loading) {
              return Center(child: LoadingWidget());
            }
            return SizedBox();
          },
        ),
      ],
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
