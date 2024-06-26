import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Image.asset('assets/img.png'),
              ),
              Center(child: const Text("Welcome to home screen"))
            ])));
  }
}
