import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/core/services/dependecies.dart';
import 'package:car_store_app/core/widgets/error_message_widget.dart';
import 'package:car_store_app/core/widgets/loading_widget.dart';
import 'package:car_store_app/features/home/presentation/bloc/brands/brands_bloc.dart';
import 'package:car_store_app/features/home/presentation/bloc/cars/cars_bloc.dart';
import 'package:car_store_app/features/home/presentation/widgets/all_cars/car_category_filter_widget.dart';
import 'package:car_store_app/features/home/presentation/widgets/common/car_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCarsBodyWidget extends StatefulWidget {
  const AllCarsBodyWidget({super.key});

  @override
  State<AllCarsBodyWidget> createState() => _AllCarsBodyWidgetState();
}

class _AllCarsBodyWidgetState extends State<AllCarsBodyWidget> {
  final ValueNotifier<String> _selectedCategoryNotifier = ValueNotifier<String>("All");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getIt<CarsBloc>().add(GetPublicCarsEvent());
      getIt<BrandsBloc>().add(GetAllBrandsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        // Dynamic category filter chips from BrandsBloc state
        BlocBuilder<BrandsBloc, BrandsState>(
          bloc: getIt<BrandsBloc>(),
          builder: (context, brandState) {
            final brandNames = brandState.allBrands.map((b) => b.name).toList();
            final categories = ["All", ...brandNames];

            return ValueListenableBuilder<String>(
              valueListenable: _selectedCategoryNotifier,
              builder: (context, selectedCategory, child) {
                // If selected category no longer exists in fetched brands, reset to "All"
                if (!categories.contains(selectedCategory)) {
                  _selectedCategoryNotifier.value = "All";
                }

                return CarCategoryFilterWidget(
                  categories: categories,
                  selectedCategory: selectedCategory,
                  onCategorySelected: (category) {
                    _selectedCategoryNotifier.value = category;
                  },
                );
              },
            );
          },
        ),
        const SizedBox(height: 12),
        Expanded(
          child: BlocBuilder<CarsBloc, CarsState>(
            bloc: getIt<CarsBloc>(),
            builder: (context, state) {
              if (state.getPublicCarsStatus == StatusEnum.loading) {
                return const Center(child: LoadingWidget());
              } else if (state.getPublicCarsStatus == StatusEnum.failure) {
                return Center(
                  child: ErrorMessageWidget(
                    messageError: state.messageError ?? "Failed to load cars",
                  ),
                );
              } else if (state.getPublicCarsStatus == StatusEnum.success) {
                final cars = state.allCars;
                return ValueListenableBuilder<String>(
                  valueListenable: _selectedCategoryNotifier,
                  builder: (context, selectedCategory, child) {
                    final filteredCars = selectedCategory == "All"
                        ? cars
                        : cars.where((car) => car.brand.toLowerCase() == selectedCategory.toLowerCase()).toList();

                    if (filteredCars.isEmpty) {
                      return const Center(child: Text("No cars found for this category"));
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredCars.length,
                      itemBuilder: (context, index) {
                        final car = filteredCars[index];
                        final carMap = {
                          "name": car.name,
                          "brand": car.brand,
                          "price": car.price,
                          "rating": car.rating,
                          "reviews": car.reviews,
                          "transmission": car.transmission,
                          "image": car.image,
                        };
                        return CarCardWidget(car: carMap);
                      },
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
