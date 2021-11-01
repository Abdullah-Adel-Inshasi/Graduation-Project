import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../size_config.dart';

class SignupLandlord extends StatefulWidget {
  const SignupLandlord({Key? key}) : super(key: key);

  @override
  _SignupLandlordState createState() => _SignupLandlordState();
}

class _SignupLandlordState extends State<SignupLandlord> {

  // TextEditingController email = TextEditingController();

  TextEditingController age = TextEditingController();


  int numOfSons = 1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        body: Stack(

          children: [
            Container(
              child: Image.asset('assets/images/login.png'),
            ),
            Positioned(
              top: SizeConfig.scaleHeight(40),
              right: SizeConfig.scaleWidth(32),
              child: Container(
                child: Text(
                  'تسجيل',
                  style: TextStyle(
                    fontSize: SizeConfig.scaleTextFont(22),
                    color: Color(0xFFF6F6F6),
                  ),
                ),
                margin: EdgeInsets.only(right: SizeConfig.scaleWidth(32),top:SizeConfig.scaleHeight(10),bottom: SizeConfig.scaleHeight(30)),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.scaleHeight(150),
                    ),

                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, color: Color(0xFF8B8B8B),size: SizeConfig.scaleTextFont(20),),
                        SizedBox(
                          width: SizeConfig.scaleWidth(15),
                        ),
                        Text(
                          'العمر',
                          style: TextStyle(
                            fontSize: SizeConfig.scaleTextFont(16),
                            color: Color(0xFF333333),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(10),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: SizeConfig.scaleHeight(56),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
                      ),
                      child: Padding(
                        padding:  EdgeInsetsDirectional.only(start: SizeConfig.scaleWidth(15),end:SizeConfig.scaleWidth(10)),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: age,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: SizeConfig.scaleTextFont(14),color: Color(0xFFB6B7B7)),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintText: "العمر",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(20),
                    ),

                    Text(
                      'عدد أفراد الاسرة',
                      style: GoogleFonts.tajawal(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            numOfSons > 0
                                ? setState(() {
                              numOfSons--;
                            })
                                : null;
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF14688C),
                            ),
                            child: Center(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 20,
                                )),
                          ),
                        ),
                        Text(
                          numOfSons.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF14688C)),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              numOfSons++;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF14688C),
                            ),
                            child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(50),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
