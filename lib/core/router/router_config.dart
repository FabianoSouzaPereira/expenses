import 'package:expenses/core/router/paths.dart' as paths;
import 'package:expenses/core/router/routes.dart' as routes;
import 'package:go_router/go_router.dart';

GoRoute router = GoRoute(
  path: paths.SplashPagePath,
  routes: [
    GoRoute(
      name: routes.LoginPageRoute,
      path: paths.LoginPagePath,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: routes.HomePageRoute,
      path: paths.HomePagePath,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: routes.SplashPageRoute,
      path: paths.SplashPagePath,
      builder: (context, state) => const SplashPage(),
    ),
  ],
);
