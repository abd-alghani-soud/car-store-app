import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/my_color.dart';
import '../../../../core/enums/status_enum.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/main_button.dart';
import '../manager/order_cubit/order_cubit.dart';

class RentSubmitButton extends StatelessWidget {
  final OrderCubit orderCubit;
  final VoidCallback onPressed;

  const RentSubmitButton({
    super.key,
    required this.orderCubit,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      bloc: orderCubit,
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
            onPressed: onPressed,
          );
        }
        if (state.rentOrderStatus == StatusEnum.loading) {
          return const Center(child: LoadingWidget());
        }
        return const SizedBox();
      },
    );
  }
}
