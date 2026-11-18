import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/route/app_route.dart';
import 'package:car_store_app/core/services/dependecies.dart';
import 'package:car_store_app/features/favorites/presentation/bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CarCardWidget extends StatelessWidget {
  final Map<String, dynamic> car;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onFavoritePressed;

  const CarCardWidget({
    super.key,
    required this.car,
    this.margin,
    this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    final int carId = car["id"] ?? 0;
    final String imagePath = car["image"] ?? 'assets/images/random/ii.png';
    final bool isNetworkImage = imagePath.startsWith('http');

    return GestureDetector(
      onTap: () {
        context.push(AppRoute.kCarDetailsPage, extra: car);
      },
      child: Container(
        margin: margin ?? const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: MyColor.cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Center(
                  child: isNetworkImage
                      ? Image.network(
                          imagePath,
                          height: 140,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/random/ii.png',
                              height: 140,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Image.asset(
                          imagePath,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                ),
                BlocBuilder<FavoriteBloc, FavoriteState>(
                  bloc: getIt<FavoriteBloc>(),
                  builder: (context, favState) {
                    final bool isFav = carId > 0 &&
                        favState.favorites.any((f) => f.id == carId);

                    return GestureDetector(
                      onTap: () {
                        if (onFavoritePressed != null) {
                          onFavoritePressed!();
                        } else if (carId > 0) {
                          getIt<FavoriteBloc>()
                              .add(ToggleFavoriteEvent(carId: carId));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isFav
                              ? Colors.red.withOpacity(0.15)
                              : MyColor.accentBlue.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav ? Colors.red : MyColor.accentBlue,
                          size: 20,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  car["name"] ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: MyColor.textPrimary,
                  ),
                ),
                Text(
                  car["transmission"] ?? "Automatic",
                  style: const TextStyle(
                    fontSize: 12,
                    color: MyColor.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: MyColor.goldRating, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      "${car["rating"] ?? 4.8}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: MyColor.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "(${car["reviews"] ?? 150} Reviews)",
                      style: const TextStyle(
                        color: MyColor.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "\$${car["price"] ?? 54}",
                        style: const TextStyle(
                          color: MyColor.accentBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const TextSpan(
                        text: " / day",
                        style: TextStyle(
                          color: MyColor.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
