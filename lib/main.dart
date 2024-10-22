import 'package:be_talent_desafio_mobile/constants.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Pallete.white,
        appBarTheme: const AppBarTheme(backgroundColor: Pallete.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Helvetica Neue",
        textTheme: const TextTheme(
          //H1
          headlineLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          //H2
          headlineMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          //H3
          headlineSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
