import 'package:car_store_app/core/constants/my_color.dart';
import 'package:flutter/material.dart';

class CarSpecsGridWidget extends StatelessWidget {
  final String transmission;

  const CarSpecsGridWidget({
    super.key,
    required this.transmission,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildSpecCard(Icons.settings, "Transmission", transmission)),
        const SizedBox(width: 12),
        Expanded(child: _buildSpecCard(Icons.local_gas_station, "Fuel Type", "Gasoline")),
        const SizedBox(width: 12),
        Expanded(child: _buildSpecCard(Icons.airline_seat_recline_normal, "Capacity", "4 Persons")),
      ],
    );
  }

  Widget _buildSpecCard(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: MyColor.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: MyColor.accentBlue, size: 22),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 11, color: MyColor.textSecondary),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: MyColor.textPrimary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
