import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/core/widgets/error_message_widget.dart';
import 'package:car_store_app/core/widgets/loading_widget.dart';
import 'package:car_store_app/core/widgets/success_message_widget.dart';
import 'package:car_store_app/features/order/presentation/manager/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/main_text_field.dart';

class InstallmentFormWidget extends StatefulWidget {
  const InstallmentFormWidget({
    super.key,
    required this.carId,
    required this.orderCubit,
  });

  final int carId;
  final OrderCubit orderCubit;

  @override
  State<InstallmentFormWidget> createState() => _InstallmentFormWidgetState();
}

class _InstallmentFormWidgetState extends State<InstallmentFormWidget> {
  final TextEditingController _monthsController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.orderCubit.resetState();
  }

  @override
  void dispose() {
    _monthsController.dispose();
    _notesController.dispose();
    super.dispose();
  }

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
          controller: _monthsController,
          keyboardType: TextInputType.number,
          label: 'installment month',
          borderColor: MyColor.primaryColor,
          fillColor: MyColor.inputFill,
        ),
        const SizedBox(height: 12),
        MainTextField(
          controller: _notesController,
          label: 'Notes user',
          hint: '(Optional)',
          fillColor: MyColor.inputFill,
          borderColor: MyColor.primaryColor,
        ),
        const SizedBox(height: 12),
        BlocConsumer<OrderCubit, OrderState>(
          bloc: widget.orderCubit,
          listener: (context, state) {
            if (state.installmentOrderStatus == StatusEnum.success) {
              _monthsController.clear();
              _notesController.clear();
            }
          },
          builder: (context, state) {
            if (state.installmentOrderStatus == StatusEnum.initial) {
              return MainButton(
                text: 'Confirm',
                color: MyColor.accentBlue,
                textColor: Colors.white,
                fontSize: 12,
                borderRadius: BorderRadius.circular(18),
                onPressed: _submitOrder,
              );
            }
            if (state.installmentOrderStatus == StatusEnum.success) {
              return Column(
                children: [
                  SuccessMessageWidget(
                    successMessage: 'purchased successfully',
                  ),
                  MainButton(
                    text: 'Confirm',
                    width: 400,
                    color: MyColor.accentBlue,
                    textColor: Colors.white,
                    fontSize: 12,
                    borderRadius: BorderRadius.circular(18),
                    onPressed: _submitOrder,
                  ),
                ],
              );
            }
            if (state.installmentOrderStatus == StatusEnum.loading) {
              return Center(child: LoadingWidget());
            }
            if (state.installmentOrderStatus == StatusEnum.failure) {
              return Column(
                children: [
                  ErrorMessageWidget(
                    messageError: state.errMessage ?? 'something went wrong!',
                  ),
                  MainButton(
                    width: 400,
                    text: 'Confirm',
                    color: MyColor.accentBlue,
                    textColor: Colors.white,
                    fontSize: 12,
                    borderRadius: BorderRadius.circular(18),
                    onPressed: _submitOrder,
                  ),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ],
    );
  }

  void _submitOrder() {
    final installMonth = int.tryParse(_monthsController.text);
    if (installMonth == null || installMonth <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid installment months!")),
      );
      return;
    }
    widget.orderCubit.installmentOrder(
      widget.carId,
      _notesController.text,
      installMonth,
    );
  }
}
