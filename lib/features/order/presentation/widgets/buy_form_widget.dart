import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/core/widgets/error_message_widget.dart';
import 'package:car_store_app/core/widgets/loading_widget.dart';
import 'package:car_store_app/core/widgets/main_button.dart';
import 'package:car_store_app/core/widgets/main_text_field.dart';
import 'package:car_store_app/core/widgets/success_message_widget.dart';
import 'package:car_store_app/features/order/presentation/manager/order_cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyFormWidget extends StatelessWidget {
  const BuyFormWidget({
    super.key,
    required this.carId,
    required this.orderCubit,
  });

  final int carId;
  final OrderCubit orderCubit;

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
        BlocBuilder<OrderCubit, OrderState>(
          bloc: orderCubit,
          builder: (context, state) {
            if (state.buyOrderStatus == StatusEnum.initial) {
              return MainButton(
                text: 'Confirm',
                color: MyColor.accentBlue,
                textColor: Colors.white,
                fontSize: 12,
                borderRadius: BorderRadius.circular(18),
                onPressed: () {
                  orderCubit.buyOrder(carId, '');
                },
              );
            }
            if (state.buyOrderStatus == StatusEnum.success) {
              return Column(
                children: [
                  SuccessMessageWidget(
                    successMessage: 'purchased successfully',
                  ),
                  MainButton(
                    width: 400,
                    text: 'Confirm',
                    color: MyColor.accentBlue,
                    textColor: Colors.white,
                    fontSize: 12,
                    borderRadius: BorderRadius.circular(18),
                    onPressed: () {
                      orderCubit.buyOrder(carId, '');
                    },
                  ),
                ],
              );
            }
            if (state.buyOrderStatus == StatusEnum.loading) {
              return Center(child: LoadingWidget());
            }
            if (state.buyOrderStatus == StatusEnum.failure) {
              return Column(
                children: [
                  ErrorMessageWidget(messageError: state.errMessage!),
                  MainButton(
                    width: 400,
                    text: 'Confirm',
                    color: MyColor.accentBlue,
                    textColor: Colors.white,
                    fontSize: 12,
                    borderRadius: BorderRadius.circular(18),
                    onPressed: () {
                      print(carId);
                      orderCubit.buyOrder(carId, '');
                    },
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
}
