import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/auth/signup_landlord.dart';

import '../size_config.dart';

class SignupScreenGeneric extends StatefulWidget {

  int? type;


  SignupScreenGeneric({this.type});

  @override
  _SignupScreenGenericState createState() => _SignupScreenGenericState();
}

class _SignupScreenGenericState extends State<SignupScreenGeneric> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController age = TextEditingController();


  int numOfSons = 1;
  bool isObscure = true;
  bool isObscure1 = true;
  bool isSelected = true;
  int selectedValue = 0;
  bool? isSelectedYes;
  int selectedValue2 = 0;
  bool? isSelectedYes2;

  setSelectedRadio(int val){
    setState(() {
      selectedValue = val;
    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        body: SingleChildScrollView(
          child: Container(
            child: Stack(

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.scaleHeight(150),
                          ),
                          Row(
                            children: [
                              Icon(Icons.person, color: Color(0xFF8B8B8B),size: SizeConfig.scaleTextFont(18),),
                              SizedBox(
                                width: SizeConfig.scaleHeight(10),
                              ),
                              Text(
                                'الإسم الكامل',
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
                              Icon(Icons.phone, color: Color(0xFF8B8B8B),size: SizeConfig.scaleTextFont(20),),
                              SizedBox(
                                width: SizeConfig.scaleWidth(15),
                              ),
                              Text(
                                'جوال',
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
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: SizeConfig.scaleHeight(56),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(SizeConfig.scaleHeight(10)),
                                      bottomRight: Radius.circular(SizeConfig.scaleHeight(10)),
                                    ),
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsetsDirectional.only(start: SizeConfig.scaleWidth(15),end:SizeConfig.scaleWidth(10)),
                                    child: TextField(
                                      keyboardType: TextInputType.phone,
                                      controller: _mobile,
                                      textAlign: TextAlign.right,
                                      cursorColor: Colors.black,
                                      maxLength: 15,
                                      decoration: InputDecoration(
                                          counter: Offstage(),
                                          hintStyle: TextStyle(fontSize: SizeConfig.scaleTextFont(14),color: Color(0xFFB6B7B7)),
                                          focusedBorder: InputBorder.none,
                                          border: InputBorder.none,
                                          hintText: "رقم الجوال"
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.scaleWidth(2),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(10)),
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  height: SizeConfig.scaleHeight(56),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                      topLeft: Radius.circular(SizeConfig.scaleHeight(10)),
                                      bottomLeft: Radius.circular(SizeConfig.scaleHeight(10)),
                                    ),
                                  ),
                                  child: Text('970+',
                                    style: TextStyle(fontSize: SizeConfig.scaleTextFont(14),color: Color(0xFF333333)),),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.scaleHeight(10),
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
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.scaleHeight(10),
                          ),
                          // Container(
                          //   alignment: Alignment.centerRight,
                          //   child: Text(
                          //     'اختر نوع المستخدم : ',
                          //     textAlign: TextAlign.right,
                          //     style: TextStyle(
                          //       fontSize: SizeConfig.scaleTextFont(16),
                          //       color: Color(0xFF8B8B8B),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: SizeConfig.scaleHeight(10),
                          // ),
                          /************************/
                          Visibility(
                            visible: widget.type==1,
                            child: Column(
                              children: [
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
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'الحالة الاجتماعية',
                                    style: TextStyle(
                                      fontSize: SizeConfig.scaleTextFont(18),
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.scaleHeight(20),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Radio(
                                              activeColor: Color(0xFF14688C),
                                              value: 1,
                                              groupValue: selectedValue,
                                              onChanged: (int? value) {
                                                isSelectedYes = true;
                                                setSelectedRadio(value!);
                                              },),
                                            alignment: Alignment.centerLeft,
                                          ),
                                          Container(
                                            child: Text("متزج", style: TextStyle(
                                                fontSize: 16, color: Color(0xFF333333)),),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Radio(
                                              activeColor: Color(0xFF14688C),
                                              value: 2,
                                              groupValue: selectedValue,
                                              onChanged: (int? value) {
                                                isSelectedYes = false;
                                                setSelectedRadio(value!);
                                              },),
                                            alignment: Alignment.centerLeft,
                                          ),
                                          Container(
                                            child: Text("أعزب", style: TextStyle(
                                                fontSize: 16, color: Color(0xFF333333)),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                          Visibility(
                            visible: widget.type==2,
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'نوع صاحب العقار',
                                    style: TextStyle(
                                      fontSize: SizeConfig.scaleTextFont(18),
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.scaleHeight(20),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Radio(
                                              activeColor: Color(0xFF14688C),
                                              value: 1,
                                              groupValue: selectedValue2,
                                              onChanged: (int? value) {
                                                isSelectedYes2 = true;
                                                setSelectedRadio(value!);
                                              },),
                                            alignment: Alignment.centerLeft,
                                          ),
                                          Container(
                                            child: Text("مكتب عقاري", style: TextStyle(
                                                fontSize: 16, color: Color(0xFF333333)),),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Radio(
                                              activeColor: Color(0xFF14688C),
                                              value: 2,
                                              groupValue: selectedValue2,
                                              onChanged: (int? value) {
                                                isSelectedYes2 = false;
                                                setSelectedRadio(value!);
                                              },),
                                            alignment: Alignment.centerLeft,
                                          ),
                                          Container(
                                            child: Text("مؤجر", style: TextStyle(
                                                fontSize: 16, color: Color(0xFF333333)),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     GestureDetector(
                          //       onTap: (){
                          //         setState(() {
                          //           isSelected = !isSelected;
                          //         });
                          //       },
                          //       child: Container(
                          //         width: 120,
                          //         height: 50,
                          //         decoration: BoxDecoration(
                          //           // border: isSelected ? null : Border.all(color: Color(0xFF14688C)),
                          //           color: isSelected ? Color(0xFF14688C) : Colors.white,
                          //           shape: BoxShape.rectangle,
                          //           borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
                          //         ),
                          //         padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(15)),
                          //         child: Text(
                          //           'مستاجر',
                          //           style: TextStyle(
                          //             fontSize: SizeConfig.scaleTextFont(16),
                          //             color: isSelected ?Colors.white: Color(0xFF333333) ,
                          //           ),
                          //           textAlign: TextAlign.center,
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: SizeConfig.scaleWidth(15),
                          //     ),
                          //     GestureDetector(
                          //       onTap: (){
                          //         setState(() {
                          //           isSelected = !isSelected;
                          //         });
                          //       },
                          //       child: Container(
                          //         width: 120,
                          //         height: 50,
                          //         decoration: BoxDecoration(
                          //           // border: !isSelected ? null : Border.all(color: Color(0xFF14688C)),
                          //           color: !isSelected ? Color(0xFF14688C) : Colors.white,
                          //           shape: BoxShape.rectangle,
                          //           borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
                          //         ),
                          //         padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(15)),
                          //         child: Text(
                          //           'صاحب عقار',
                          //           style: TextStyle(
                          //             fontSize: SizeConfig.scaleTextFont(16),
                          //             color: !isSelected ?Colors.white: Color(0xFF333333),
                          //           ),
                          //           textAlign: TextAlign.center,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: SizeConfig.scaleHeight(20),),
                        ],
                      ),
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     GestureDetector(
                    //       onTap: (){
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => SignupLandlord()));
                    //       },
                    //       child: Container(
                    //         width: SizeConfig.scaleWidth(100),
                    //         height: SizeConfig.scaleHeight(55),
                    //         decoration: BoxDecoration(
                    //           color: Color(0xFF14688C),
                    //           borderRadius: BorderRadius.only(
                    //             topLeft: Radius.circular(0),
                    //             bottomLeft: Radius.circular(0),
                    //             topRight: Radius.circular(50),
                    //             bottomRight: Radius.circular(50),
                    //           ),
                    //         ),
                    //         alignment: Alignment.center,
                    //         child: Text("التالي", style: TextStyle(fontSize: SizeConfig.scaleTextFont(20),color: Colors.white),),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(20),
                    ),
                  ],
                )],
            ),
          ),
        ),
      ),
    );
  }
}
