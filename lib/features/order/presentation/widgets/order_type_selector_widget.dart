import 'package:flutter/material.dart';
import '../../../../core/constants/my_color.dart';
import '../../../../core/enums/order_type.dart';

class OrderTypeSelectorWidget extends StatelessWidget {
  final OrderType selectedType;
  final ValueChanged<OrderType> onTypeSelected;

  const OrderTypeSelectorWidget({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTypeButton(context, OrderType.rent, 'Rent'),
        const SizedBox(width: 8),
        _buildTypeButton(context, OrderType.buy, 'Buy'),
        const SizedBox(width: 8),
        _buildTypeButton(context, OrderType.installment, 'Installment'),
      ],
    );
  }

  Widget _buildTypeButton(BuildContext context, OrderType type, String title) {
    final isSelected = selectedType == type;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTypeSelected(type),
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
}
