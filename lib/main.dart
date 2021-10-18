import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/landlord/wrapper.dart';
import 'package:home_explorer/screens/onBoardingScreen.dart';
import 'package:home_explorer/wrapper.dart';
import 'package:home_explorer/landlord/my_apartments/apartments_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFE5E5E5),
      ),
      home: LandLordWrapper(),
    );
  }
}
