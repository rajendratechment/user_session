import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  final String title;

  const SplashScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      context.pushReplacement('/login');
    });

    return  Scaffold(
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.asset('assets/img.png'),
            ),
          )
          ,
      const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Hello \n I am your flutter",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
      ),
    ]));
  }
}
