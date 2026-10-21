import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/features/home/presentation/widgets/top_brands/top_brands_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBrandsPage extends StatelessWidget {
  const TopBrandsPage({super.key});

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
          "Top Brands",
          style: TextStyle(
            color: MyColor.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: TopBrandsBodyWidget(),
    );
  }
}
