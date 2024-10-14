import 'package:be_talent_desafio_mobile/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
        fontFamily: "Helvetica Neue",
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 24.42,
          ),
          headlineMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 19.54,
          ),
          headlineSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 19.09,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
