import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/features/home/presentation/widgets/all_cars/all_cars_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AllCarsPage extends StatelessWidget {
  const AllCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.background,
      appBar: AppBar(
        backgroundColor: MyColor.cardColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: MyColor.textPrimary, size: 18),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          "All Cars",
          style: TextStyle(
            color: MyColor.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: AllCarsBodyWidget(),
    );
  }
}
