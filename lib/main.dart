import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_ai_apparel_shop/config/routes/routes.dart';
import 'package:gemini_ai_apparel_shop/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'simple_bloc_observer.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'src/modules/camera/camera_bloc/camera_bloc.dart';
import 'src/modules/home/home_bloc/home_bloc.dart';
import 'src/modules/home/repositories/apparel_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize firebase
  await Firebase.initializeApp(
    name: "gemini apparel app",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //initialize bloc observer
  Bloc.observer = SimpleBlocObserver();

  //initialize gemini ai
    // Access your API key as an environment variable (see "Set up your API key" above)
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ApparelRepo apparelRepo = ApparelRepo();
    return MultiBlocProvider(
            providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(apparelRepo)..add(HomeInitialEvent()),
        ),
        BlocProvider<CameraBloc>(
          create: (context) => CameraBloc(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            primaryColor: primaryColor,
            useMaterial3: true,
            ),
        routerConfig: router,
      ),
    );
  }
}
