import 'package:car_store_app/features/auth/presentation/pages/login_page.dart';
import 'package:car_store_app/features/auth/presentation/pages/signup_page.dart';
import 'package:car_store_app/features/home/presentation/pages/all_cars_page.dart';
import 'package:car_store_app/features/home/presentation/pages/car_details_page.dart';
import 'package:car_store_app/features/home/presentation/pages/top_brands_page.dart';
import 'package:car_store_app/features/main/presentation/pages/main_page.dart';
import 'package:car_store_app/features/order/presentation/pages/orders_page.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';

abstract class AppRoute {
  static const kSignupPage = '/signupPage';
  static const kHomePage = '/homePage';
  static const kMainPage = '/mainPage';
  static const kTopBrandsPage = '/topBrandsPage';
  static const kCarDetailsPage = '/carDetailsPage';
  static const kAllCarsPage = '/allCarsPage';
  static const kOrdersPage = '/ordersPage';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => LoginPage()),
      GoRoute(path: kSignupPage, builder: (context, state) => SignupPage()),
      GoRoute(path: kHomePage, builder: (context, state) => HomePage()),
      GoRoute(path: kMainPage, builder: (context, state) => MainPage()),
      GoRoute(
        path: kTopBrandsPage,
        builder: (context, state) => const TopBrandsPage(),
      ),
      GoRoute(
        path: kAllCarsPage,
        builder: (context, state) => const AllCarsPage(),
      ),
      GoRoute(
        path: kCarDetailsPage,
        builder: (context, state) {
          final carData = state.extra as Map<String, dynamic>? ?? {};
          return CarDetailsPage(carData: carData);
        },
      ),
      GoRoute(path: kOrdersPage, builder: (context, state) {
        final carId =state.extra as int;
        return OrdersPage(carId: carId);
      } ),
    ],
  );
}
