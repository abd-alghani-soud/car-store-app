import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/core/services/dependecies.dart';
import 'package:car_store_app/features/home/presentation/bloc/brands/brands_bloc.dart';
import 'package:car_store_app/features/home/presentation/widgets/top_brands/brand_item_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopBrandsBodyWidget extends StatefulWidget {
  const TopBrandsBodyWidget({super.key});

  @override
  State<TopBrandsBodyWidget> createState() => _TopBrandsBodyWidgetState();
}

class _TopBrandsBodyWidgetState extends State<TopBrandsBodyWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getIt<BrandsBloc>().add(GetAllBrandsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsBloc, BrandsState>(
      bloc: getIt<BrandsBloc>(),
      builder: (context, state) {
        if (state.getAllBrandsStatus == StatusEnum.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.getAllBrandsStatus == StatusEnum.failure) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Error: ${state.messageError}",
                style: const TextStyle(color: Colors.red, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else if (state.getAllBrandsStatus == StatusEnum.success) {
          final brands = state.allBrands;
          if (brands.isEmpty) {
            return const Center(child: Text("No brands found"));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
            ),
            itemCount: brands.length,
            itemBuilder: (context, index) {
              final brand = brands[index];
              return BrandItemCardWidget(
                brand: {
                  "name": brand.name,
                  "models": brand.modelsCount,
                  "icon": Icons.directions_car,
                },
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
