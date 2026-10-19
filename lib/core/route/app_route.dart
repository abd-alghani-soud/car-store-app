import 'package:car_store_app/features/auth/presentation/pages/login_page.dart';
import 'package:car_store_app/features/auth/presentation/pages/signup_page.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';

abstract class AppRoute {
  static const kSignupPage = '/signupPage';
  static const kHomePage = '/homePage';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => LoginPage()),
      GoRoute(path: kSignupPage, builder: (context, state) => SignupPage()),
      GoRoute(path: kHomePage, builder: (context, state) => HomePage()),
    ],
  );
}
