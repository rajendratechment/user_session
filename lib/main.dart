import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:user_session/screens/home.dart';
import 'package:user_session/screens/login.dart';
import 'package:user_session/screens/signup.dart';
import 'package:user_session/screens/splash.dart';

import 'network/Server.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Server(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MaterialApp.router(
          title: 'Flutter Demo',
          routerConfig: router(),
        ));
  }

  GoRouter router() {
    return GoRouter(
      initialLocation: '/splash',
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen(title: "Splash Screen"),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(title: "login screen"),

        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(title: "Home Screen"),
        ),
        GoRoute(path: '/signup',
            builder :(context,state) =>   SignupScreen() )

      ],
    );
  }

}
