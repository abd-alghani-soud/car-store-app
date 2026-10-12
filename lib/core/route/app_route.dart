import 'package:car_store_app/features/auth/presentation/pages/signup_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoute {
  static const kSignupPage = '/SignupPage';
  static final router = GoRouter(
    routes: [
      //GoRoute(path: '/', builder: (context, state) => SplashView()),
      GoRoute(path: kSignupPage, builder: (context, state) => SignupPage()),
    ],
  );
}
