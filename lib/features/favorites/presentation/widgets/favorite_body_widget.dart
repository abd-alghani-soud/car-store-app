import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/enums/status_enum.dart';
import 'package:car_store_app/core/services/dependecies.dart';
import 'package:car_store_app/core/widgets/error_message_widget.dart';
import 'package:car_store_app/core/widgets/loading_widget.dart';
import 'package:car_store_app/features/favorites/presentation/bloc/favorite_bloc.dart';
import 'package:car_store_app/features/home/presentation/widgets/common/car_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBodyWidget extends StatelessWidget {
  const FavoriteBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteBloc, FavoriteState>(
      bloc: getIt<FavoriteBloc>(),
      listener: (context, state) {
        if (state.toggleFavoriteStatus == StatusEnum.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Updated favorites'),
              duration: Duration(milliseconds: 500),
              backgroundColor: MyColor.accentBlue,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.getMyFavoritesStatus == StatusEnum.loading) {
          return const LoadingWidget();
        }
        if (state.getMyFavoritesStatus == StatusEnum.failure) {
          return ErrorMessageWidget(
            messageError: state.messageError ?? 'Failed to load favorites',
          );
        }

        final favorites = state.favorites;

        if (favorites.isEmpty) {
          return const Center(
            child: Text(
              'No favorite cars yet',
              style: TextStyle(
                color: MyColor.textSecondary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final car = favorites[index];
            final carMap = {
              "id": car.id,
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
}
