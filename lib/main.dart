import 'package:flutter/material.dart';
import 'package:textrecognizer/screens/home_screen.dart';
import 'package:textrecognizer/screens/on_boarding_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xfffffaf0),
        highlightColor: Color(0xffff6f61),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffff6f61),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          )
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'IBMPlexSans',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          displayMedium: TextStyle(
            fontFamily: 'IBMPlexSans',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black
        ),
        labelSmall: TextStyle(
          fontFamily: 'IBMPlexSans',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.white
        )
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const OnBoardingScreen(),
            );
            case '/home':
            return MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const OnBoardingScreen(),
            );
        }
      }
    );
  }
}