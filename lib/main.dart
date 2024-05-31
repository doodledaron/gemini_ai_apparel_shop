import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gemini_ai_apparel_shop/config/routes/routes.dart';
import 'package:gemini_ai_apparel_shop/constants/colors.dart';
import 'package:gemini_ai_apparel_shop/src/modules/home/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: primaryColor,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
