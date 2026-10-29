import 'package:car_store_app/features/order/presentation/widgets/rent_forn_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/my_color.dart';
import '../pages/orders_page.dart';
import 'buy_form_widget.dart';
import 'installment_forn_widget.dart';

class OrdersPageBody extends StatefulWidget {
  const OrdersPageBody({super.key, required this.carId});

  final int carId;

  @override
  State<OrdersPageBody> createState() => _OrdersPageBodyState();
}

class _OrdersPageBodyState extends State<OrdersPageBody> {
  OrderType selectedType = OrderType.rent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              _buildTypeButton(OrderType.rent, 'Rent'),
              const SizedBox(width: 8),
              _buildTypeButton(OrderType.buy, 'Buy'),
              const SizedBox(width: 8),
              _buildTypeButton(OrderType.installment, 'Installment'),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _buildFormContent(selectedType),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeButton(OrderType type, String title) {
    final isSelected = selectedType == type;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedType = type;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? MyColor.accentBlue : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? MyColor.accentBlue : Colors.grey.shade300,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormContent(OrderType type) {
    switch (type) {
      case OrderType.rent:
        return RentFormWidget(carId: widget.carId, key: ValueKey('RentForm'));
      case OrderType.buy:
        return const BuyFormWidget(key: ValueKey('BuyForm'));
      case OrderType.installment:
        return const InstallmentFormWidget(key: ValueKey('InstallmentForm'));
    }
  }
}
