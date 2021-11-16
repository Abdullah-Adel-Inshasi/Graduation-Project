import 'package:flutter/material.dart';
import 'package:home_explorer/landlord/wrapper.dart';
import 'package:home_explorer/pick_provider.dart';
import 'package:home_explorer/splash_screen.dart';
import 'package:provider/provider.dart';


import 'auth/login_screen.dart';
import 'models/user.dart';
import 'normal_user/wrapper.dart';


void main() => runApp(ChangeNotifierProvider<PicProvider>(
    create: (context)=>PicProvider(),
    child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        scaffoldBackgroundColor: Color(0xFFE5E5E5),
      ),
      // home: LoginScreen(),
      home: SplashScreen(),
      // home: LandLordWrapper(user: landLord[0],),
      routes: {
        '/login' : (context) => LoginScreen(),
      },
    );
  }
}