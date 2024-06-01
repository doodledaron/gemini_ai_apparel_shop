import 'package:camera/camera.dart';
import 'package:gemini_ai_apparel_shop/src/modules/camera/camera_screen.dart';
import 'package:gemini_ai_apparel_shop/src/modules/camera/image_preview_screen.dart';
import 'package:gemini_ai_apparel_shop/src/modules/navigation/navigation_screen.dart';
import 'package:gemini_ai_apparel_shop/src/modules/suggestion/screens/suggestion_screen.dart';
import 'package:go_router/go_router.dart';

import '../../src/modules/home/screens/home_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: "/navigation",
  routes: <RouteBase>[
    GoRoute(
      path: "/home",
      name: "home",
      builder: (context, state) {
        final int tabIndex = state.extra as int? ?? 0;
        return HomeScreen(
          tabIndex: tabIndex,
        );
      
      },
    ),
    GoRoute(
      path: "/navigation",
      name: "navigation",
      builder: (context, state) {
        final int tabIndex = state.extra as int? ?? 0;
        return NavigationScreen(tabIndex: tabIndex);
      },
    ),
    GoRoute(
      path: "/camera",
      name: "camera",
      builder: (context, state) {
        final cameras = state.extra as List<CameraDescription>?;
        return CameraScreen(
          cameras: cameras!,
        );
      },
    ),
    GoRoute(
      path: "/imagepreview",
      name: "imagepreview",
      builder: (context, state) {
        final imagePath = state.extra as String;
        return ImagePreviewScreen(
          imagePath: imagePath,
        );
      },
    ),
    GoRoute(
      path: "/suggestion",
      name: "suggestion",
      builder: (context, state) {
        return const SuggestionScreen();
      },
    ),
  ],
);
