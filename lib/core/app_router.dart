import 'package:go_router/go_router.dart';
import 'package:xstore_cubit/features/auth/presentation/views/loginview.dart';
import 'package:xstore_cubit/features/onBoarding/presentation/views/onBoarding_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: Routes.onboardview,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: Routes.loginview,
      builder: (context, state) => const LoginView(),
    ),
  ]);
}

class Routes {
  static const onboardview = '/';
  static const loginview = '/loginview';
}
