import 'package:flutter/material.dart';

class InstallmentFormWidget extends StatelessWidget {
  const InstallmentFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text("خطة التقسيط", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        const TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "الدفعة الأولى (\$)",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        const TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "عدد الأشهر (الأقساط)",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Execute POST /api/Orders/installment
          },
          child: const Text("إرسال طلب التقسيط"),
        ),
      ],
    );
  }
}