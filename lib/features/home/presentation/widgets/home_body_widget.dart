import 'package:car_store_app/features/home/presentation/widgets/custom_appbar_widget.dart';
import 'package:car_store_app/features/home/presentation/widgets/custom_car_card_widget.dart';
import 'package:car_store_app/features/home/presentation/widgets/custom_search_widget.dart';
import 'package:car_store_app/features/home/presentation/widgets/top_brands_widget.dart';
import 'package:flutter/material.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: .start,
          children: [
            CustomAppbarWidget(),
            SizedBox(height: 20),
            CustomSearchWidget(),
            SizedBox(height: 20),
            TopBrandsWidget(),
            SizedBox(height: 20),
            CustomCarCardWidget(),
          ],
        ),
      ),
    );
  }
}
