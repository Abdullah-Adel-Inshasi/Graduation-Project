import 'package:flutter/material.dart';
import 'package:home_explorer/size_config.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 3500) ,(){
      Navigator.pushReplacementNamed(context, '/login');
    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFFEF9EF),
      body: Center(
        child: Image.asset('assets/images/logo.png',height: SizeConfig.scaleHeight(295),width: SizeConfig.scaleWidth(295)),
      ),
    );
  }
}
