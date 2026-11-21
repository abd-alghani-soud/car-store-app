import 'package:flutter/material.dart';
import 'custom_date_tile.dart';

class RentDateSelectorsWidget extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final Function(bool isStart) onPickDate;

  const RentDateSelectorsWidget({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onPickDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDateTile(
          title: 'Rent start date',
          subtitle: startDate == null
              ? "click on the start date"
              : "${startDate!.year}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
          icon: Icons.calendar_today,
          onTap: () => onPickDate(true),
        ),
        const SizedBox(height: 12),
        CustomDateTile(
          title: 'Rent end date',
          subtitle: endDate == null
              ? "click on the end date"
              : "${endDate!.year}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
          icon: Icons.event_available,
          onTap: () => onPickDate(false),
        ),
      ],
    );
  }
}
