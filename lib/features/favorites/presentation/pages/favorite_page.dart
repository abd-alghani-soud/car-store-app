import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/core/services/dependecies.dart';
import 'package:car_store_app/features/favorites/presentation/bloc/favorite_bloc.dart';
import 'package:car_store_app/features/favorites/presentation/widgets/favorite_body_widget.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    getIt<FavoriteBloc>().add(GetMyFavoritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.background,
      appBar: AppBar(
        backgroundColor: MyColor.cardColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Favorites',
          style: TextStyle(
            color: MyColor.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: const FavoriteBodyWidget(),
    );
  }
}
