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
      backgroundColor: Color(0xFF1D7AA3),
      body: Center(
        child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
            ),
            child: Image.asset('assets/images/splash_logo.jpg',
                height: SizeConfig.scaleHeight(295),
                width: SizeConfig.scaleWidth(295))),
      ),
    );
  }
}
