import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/core/services/dependecies.dart';
import 'package:car_store_app/core/widgets/error_message_widget.dart';
import 'package:car_store_app/core/widgets/loading_widget.dart';
import 'package:car_store_app/features/home/presentation/bloc/brands/brands_bloc.dart';
import 'package:car_store_app/features/home/presentation/pages/top_brands_page.dart';
import 'package:car_store_app/features/home/presentation/widgets/home/top_brand_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopBrandsWidget extends StatelessWidget {
  const TopBrandsWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
        BlocBuilder<BrandsBloc, BrandsState>(
          bloc: getIt<BrandsBloc>(),
          builder: (context, state) {
            if (state.getAllBrandsStatus == StatusEnum.loading) {
              return const SizedBox(
                height: 85,
                child: Center(child: LoadingWidget()),
              );
            } else if (state.getAllBrandsStatus == StatusEnum.failure) {
              return SizedBox(
                height: 85,
                child: Center(
                  child: ErrorMessageWidget(
                    messageError: state.messageError ?? "Failed to load brands",
                  ),
                ),
              );
            } else if (state.getAllBrandsStatus == StatusEnum.success) {
              final brands = state.allBrands;
              if (brands.isEmpty) {
                return const SizedBox(
                  height: 85,
                  child: Center(child: Text("No brands found")),
                );
              }
              return SizedBox(
                height: 85,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: brands.length,
                  itemBuilder: (context, index) {
                    final brand = brands[index];
                    return TopBrandItemWidget(
                      brand: {
                        "name": brand.name,
                        "image": brand.logoUrl,
                      },
                    );
                  },
                ),
              );
            }
            return const SizedBox(height: 85);
          },
        ),
      ],
    );
  }
}
