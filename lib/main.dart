import 'package:flutter/material.dart';
import 'home_screen.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff0074c7),//Color(0xff2145f3),
        ),
        useMaterial3: true,
        iconTheme: const IconThemeData(color: Colors.white70,size: 50.0,),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            letterSpacing: 1,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          displayMedium : TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white70,
            fontSize: 24,
          ),
        ),
      ),
      home: const MyHomePage() ,///const Result(result: 30.5,age: 30,isMale: true,),
    );
  }
}
