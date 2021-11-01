import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:home_explorer/auth/signup_screen_generic.dart';

import '../size_config.dart';



class GettingStartedScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Color(0xFF14688C),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.png',
                height: SizeConfig.scaleHeight(150),width: SizeConfig.scaleWidth(150),
              ),
              SizedBox(height: SizeConfig.scaleHeight(60)),
              Container(
                width: double.infinity,
                height: SizeConfig.scaleHeight(450),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/user.png',height: SizeConfig.scaleHeight(213),width: SizeConfig.scaleWidth(213),),
                      SizedBox(
                        height: SizeConfig.scaleHeight(25),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreenGeneric(type: 1,)));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: SizeConfig.scaleHeight(50),
                          width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Color(0xFF14688C),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
                          ),
                          child: Text('مستأجر', style: TextStyle(fontSize: SizeConfig.scaleTextFont(18), fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(15),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreenGeneric(type: 2,)));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: SizeConfig.scaleHeight(50),
                          width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Color(0xFF14688C),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
                          ),
                          child: Text('صاحب العقار', style: TextStyle(fontSize: SizeConfig.scaleTextFont(18), fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(30)),
            ],
          ),
        ),
      ),
    );
  }
}


