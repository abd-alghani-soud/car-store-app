import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/core/route/app_route.dart';
import 'package:car_store_app/core/services/dependecies.dart';
import 'package:car_store_app/core/widgets/error_message_widget.dart';
import 'package:car_store_app/core/widgets/loading_widget.dart';
import 'package:car_store_app/features/home/presentation/bloc/cars/cars_bloc.dart';
import 'package:car_store_app/features/home/presentation/widgets/common/car_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomCarCardWidget extends StatelessWidget {
  const CustomCarCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "All Cars",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyColor.textPrimary,
              ),
            ),
            GestureDetector(
              onTap: () {
                context.push(AppRoute.kAllCarsPage);
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
        BlocBuilder<CarsBloc, CarsState>(
          bloc: getIt<CarsBloc>(),
          builder: (context, state) {
            if (state.getPublicCarsStatus == StatusEnum.loading || state.getPublicCarsStatus == StatusEnum.initial) {
              return const SizedBox(
                height: 200,
                child: Center(child: LoadingWidget()),
              );
            } else if (state.getPublicCarsStatus == StatusEnum.failure) {
              return SizedBox(
                height: 150,
                child: Center(
                  child: ErrorMessageWidget(
                    messageError: state.messageError ?? "Failed to load cars",
                  ),
                ),
              );
            } else if (state.getPublicCarsStatus == StatusEnum.success) {
              final cars = state.allCars;
              if (cars.isEmpty) {
                return const SizedBox(
                  height: 150,
                  child: Center(child: Text("No cars available")),
                );
              }
              final car = cars.first;
              final carMap = {
                "carId":car.id,
                "name": car.name,
                "brand": car.brand,
                "price": car.price,
                "rating": car.rating,
                "reviews": car.reviews,
                "transmission": car.transmission,
                "image": car.image, // Real API image URL!
              };
              return CarCardWidget(car: carMap, margin: EdgeInsets.zero);
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
