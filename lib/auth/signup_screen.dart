import 'package:flutter/material.dart';

import '../size_config.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool isObscure = true;
  bool isObscure1 = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFFEF9EF),
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
                    color: Color(0xFFFEF9EF),
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
                    SizedBox(
                      height: SizeConfig.scaleHeight(20),
                    ),
                    /************************/
                    Row(
                      children: [
                        Icon(Icons.lock, color: Color(0xFF8B8B8B),size: SizeConfig.scaleTextFont(18),),
                        SizedBox(
                          width: SizeConfig.scaleHeight(10),
                        ),
                        Text(
                          'تأكيد كلمة المرور',
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
                          obscureText: isObscure1,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: SizeConfig.scaleTextFont(14),color: Color(0xFFB6B7B7)),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintText: "تأكيد كلمة المرور",
                            suffixIcon: IconButton(
                              icon: isObscure1 ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                              onPressed: (){
                                setState(() {
                                  isObscure1 = !isObscure1;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(55),
                    ),
                    /************************/
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        alignment: Alignment.center,
                        height: SizeConfig.scaleHeight(50),
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
                        ),
                        child: Text('تسجيل', style: TextStyle(fontSize: SizeConfig.scaleTextFont(18),color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'لديك حساب بالفعل؟',
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
                            Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                          },
                          child: Text(
                            'تسجيل الدخول',
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
