import 'package:flutter/material.dart';
import 'package:home_explorer/auth/signup_screen_generic.dart';
import 'package:home_explorer/normal_user/wrapper.dart';

import '../size_config.dart';
import 'getting_started_screen.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool isObscure = true;

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
                  'دخول',
                  style: TextStyle(
                    fontSize: SizeConfig.scaleTextFont(22),
                    color: Color(0xFFF6F6F6),
                  ),
                ),
                margin: EdgeInsets.only(right: SizeConfig.scaleWidth(32),top:SizeConfig.scaleHeight(10),bottom: SizeConfig.scaleHeight(30)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(25)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.scaleHeight(100),
                    ),
                    Image.asset('assets/images/logo.png',
                      height: SizeConfig.scaleHeight(150),width: SizeConfig.scaleWidth(150),
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(30),
                    ),
                    Row(
                      children: [
                        Icon(Icons.mail, color: Color(0xFF8B8B8B),size: SizeConfig.scaleTextFont(18),),
                        SizedBox(
                          width: SizeConfig.scaleHeight(10),
                        ),
                        Text(
                          'البريد الإلكتروني',
                          style: TextStyle(
                            fontSize: SizeConfig.scaleTextFont(16),
                            color: Color(0xFF8B8B8B),
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
                          controller: email,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: SizeConfig.scaleTextFont(14),color: Color(0xFFB6B7B7)),
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintText: "البريد الإلكتروني"
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: SizeConfig.scaleHeight(20),
                    ),
                    Row(
                      children: [
                        Icon(Icons.lock, color: Color(0xFF8B8B8B),size: SizeConfig.scaleTextFont(18),),
                        SizedBox(
                          width: SizeConfig.scaleHeight(10),
                        ),
                        Text(
                          'كلمة المرور',
                          style: TextStyle(
                            fontSize: SizeConfig.scaleTextFont(16),
                            color: Color(0xFF8B8B8B),
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
                          controller: password,
                          cursorColor: Colors.black,
                          obscureText: isObscure,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: SizeConfig.scaleTextFont(14),color: Color(0xFFB6B7B7)),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintText: "كلمة المرور",
                            suffixIcon: IconButton(
                              icon: isObscure ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                              onPressed: (){
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        child: Text(
                          'نسيت كلمة المرور؟',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: SizeConfig.scaleTextFont(14),
                            color: Color(0xFF14688C),
                          ),
                        ),
                        onPressed: (){},
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(55),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Wrapper()));
                        print("login");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: SizeConfig.scaleHeight(50),
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Color(0xff14688C),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
                        ),
                        child: Text('دخول', style: TextStyle(fontSize: SizeConfig.scaleTextFont(18),color: Color(0xffF6F6F6))),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(15),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Google',
                                  style: TextStyle(
                                    fontSize: SizeConfig.scaleTextFont(16),
                                    color: Color(0xFF333333),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: SizeConfig.scaleWidth(10),
                                ),
                                Image.asset('assets/images/google.png',
                                  height: SizeConfig.scaleHeight(16),width: SizeConfig.scaleWidth(16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.scaleWidth(15),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Facebook',
                                  style: TextStyle(
                                    fontSize: SizeConfig.scaleTextFont(16),
                                    color: Color(0xFF333333),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: SizeConfig.scaleWidth(10),
                                ),
                                Image.asset('assets/images/facebook.png',
                                  height: SizeConfig.scaleHeight(16),width: SizeConfig.scaleWidth(16),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(120),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ليس لديك حساب؟',
                          style: TextStyle(
                            fontSize: SizeConfig.scaleTextFont(14),
                            color: Color(0xFF333333),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.scaleHeight(5),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GettingStartedScreen()));
                          },
                          child: Text(
                            'التسجيل',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: SizeConfig.scaleTextFont(14),
                              color: Color(0xFF14688C),
                            ),
                          ),
                        ),
                      ],
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
