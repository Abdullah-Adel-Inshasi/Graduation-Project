import 'package:flutter/material.dart';
import 'package:home_explorer/landlord/wrapper.dart';
import 'package:home_explorer/normal_user/wrapper.dart';
import 'package:home_explorer/splash_screen.dart';

import 'auth/login_screen.dart';
import 'map_screen.dart';
import 'normal_user/screens/home_screen.dart';


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
      home: SplashScreen(),
      routes: {
        '/login' : (context) => LoginScreen(),
        '/map' : (context) => MapScreen(),
      },
    );
  }
}
