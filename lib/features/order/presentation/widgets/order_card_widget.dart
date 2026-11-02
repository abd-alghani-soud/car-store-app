import 'package:flutter/material.dart';
import '../../../../core/constants/my_color.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({
    super.key,
    required this.order,
    required this.onViewDetails,
  });

  final Map<String, dynamic> order;
  final VoidCallback onViewDetails;

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (order['status']) {
      case 'Approved':
        statusColor = Colors.green;
        break;
      case 'Pending':
        statusColor = Colors.orange;
        break;
      default:
        statusColor = Colors.blue;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order['carName'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: MyColor.textPrimary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  order['status'],
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Type: ${order['orderType']}",
            style: TextStyle(color: MyColor.textSecondary, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            "Date: ${order['date']}",
            style: TextStyle(color: MyColor.textSecondary, fontSize: 13),
          ),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order['price'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyColor.accentBlue,
                  fontSize: 14,
                ),
              ),
              TextButton(
                onPressed: onViewDetails,
                child: const Text("View Details"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
