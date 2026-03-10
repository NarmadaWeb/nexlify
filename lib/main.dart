import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nexlify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xffec1313),
        scaffoldBackgroundColor: const Color(0xff1a0505),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xffec1313),
          surface: Color(0xff2a1616),
          background: Color(0xff1a0505),
        ),
        fontFamily: 'Spline Sans',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff1a0505),
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
