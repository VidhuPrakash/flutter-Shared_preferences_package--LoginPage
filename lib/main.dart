import 'package:flutter/material.dart';
import 'package:login/splash.dart';

final SAVED_USER = 'USER LOGGED';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 86, 0, 99),
          primarySwatch: Colors.deepPurple),
      home: ScreenSplash(),
    );
  }
}
