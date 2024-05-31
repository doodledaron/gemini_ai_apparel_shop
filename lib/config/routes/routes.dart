import 'package:gemini_ai_apparel_shop/src/modules/navigation/navigation_screen.dart';
import 'package:go_router/go_router.dart';

import '../../src/modules/home/screens/home_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: "/navigation",
  routes: <RouteBase>[
    GoRoute(
      path: "/home",
      name: "home",
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: "/navigation",
      name: "navigation",
      builder: (context, state) {

        return NavigationScreen();
      },
    ),
  ],
);
