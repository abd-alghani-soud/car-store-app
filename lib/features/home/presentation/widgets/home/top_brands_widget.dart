import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/features/home/presentation/pages/top_brands_page.dart';
import 'package:car_store_app/features/home/presentation/widgets/home/top_brand_item_widget.dart';
import 'package:flutter/material.dart';

class TopBrandsWidget extends StatelessWidget {
  const TopBrandsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final brands = [
      {"name": "BMW"},
      {"name": "Mercedes"},
      {"name": "Porsche"},
      {"name": "Ferrari"},
      {"name": "Scoda"},
      {"name": "Matiz"},
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Top Brands",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyColor.textPrimary,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TopBrandsPage()),
                );
              },
              child: const Text(
                "View All",
                style: TextStyle(
                  fontSize: 14,
                  color: MyColor.accentBlue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 85,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return TopBrandItemWidget(brand: brands[index]);
            },
          ),
        ),
      ],
    );
  }
}
