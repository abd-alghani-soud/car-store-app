import 'package:car_store_app/core/services/dependecies.dart';
import 'package:car_store_app/features/home/presentation/bloc/brands/brands_bloc.dart';
import 'package:car_store_app/features/home/presentation/bloc/cars/cars_bloc.dart';
import 'package:car_store_app/features/home/presentation/widgets/home/custom_appbar_widget.dart';
import 'package:car_store_app/features/home/presentation/widgets/home/custom_car_card_widget.dart';
import 'package:car_store_app/features/home/presentation/widgets/home/custom_search_widget.dart';
import 'package:car_store_app/features/home/presentation/widgets/home/top_brands_widget.dart';
import 'package:flutter/material.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({super.key});

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getIt<BrandsBloc>().add(GetAllBrandsEvent());
      getIt<CarsBloc>().add(GetPublicCarsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppbarWidget(),
            const SizedBox(height: 20),
            const CustomSearchWidget(),
            const SizedBox(height: 20),
            TopBrandsWidget(),
            const SizedBox(height: 20),
            CustomCarCardWidget(),
          ],
        ),
      ),
    );
  }
}
