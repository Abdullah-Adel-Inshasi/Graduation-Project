import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/landlord/wrapper.dart';
import 'package:home_explorer/models/apartment.dart';
import 'package:home_explorer/models/user.dart';
import 'package:home_explorer/normal_user/wrapper.dart';

import '../size_config.dart';
import 'login_screen.dart';

class SignupScreenGeneric extends StatefulWidget {

  int? type;


  SignupScreenGeneric({this.type});

  @override
  _SignupScreenGenericState createState() => _SignupScreenGenericState();
}

class _SignupScreenGenericState extends State<SignupScreenGeneric> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
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

  setSelectedRadio2(int val){
    setState(() {
      selectedValue2 = val;
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
                                controller: name,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: SizeConfig.scaleTextFont(14),color: Color(0xFFB6B7B7)),
                                    focusedBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    hintText: 'الإسم الكامل'
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
                                controller: confirm_password,
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
                                                setSelectedRadio2(value!);
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
                                                setSelectedRadio2(value!);
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
                          SizedBox(height: SizeConfig.scaleHeight(40),),
                          GestureDetector(
                            onTap: (){
                              if(name.text.isNotEmpty&&email.text.isNotEmpty&&password.text.isNotEmpty
                              && confirm_password.text.isNotEmpty&&_mobile.text.isNotEmpty){
                                if(password.text==confirm_password.text){
                                  if(widget.type==2){
                                    if(selectedValue2==1){
                                      landLord.add(LandLord.isOffice(id: landLord.length, fullName: name.text.toString(),
                                          email: email.text.toString(), phoneNumber: _mobile.text.toString(),
                                          password: password.text.toString(), isRealEstateOffice: selectedValue2==1,
                                          OfficeName: name.text.toString(),OfficeAddress: Address(city: "city", street: "street", estateNo: "estateNo")));
                                      Navigator.pushAndRemoveUntil(context,
                                          MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                                      print(landLord);
                                    }else{
                                      landLord.add(LandLord(id: landLord.length, fullName: name.text.toString(),
                                          email: email.text.toString(), phoneNumber: _mobile.text.toString(),
                                          password: password.text.toString(), isRealEstateOffice: selectedValue2==1));
                                      Navigator.pushAndRemoveUntil(context,
                                          MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                                      print(landLord);
                                    }
                                  }else{
                                    normalUser.add(NormalUser(id: landLord.length, fullName: name.text.toString(),
                                        email: email.text.toString(), phoneNumber: _mobile.text.toString(),isSingle: selectedValue==2,
                                        password: password.text.toString(),familyNumber:numOfSons,age: age.text.toString(),));
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                                    print(normalUser);
                                  }
                                }else{
                                  print("كلمة المرور غير متطابقة");
                                }
                              }else{
                                print("يرجى التأكد من جميع البيانات المطلوبة");
                              }
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
                              child: Text('تسجيل', style: TextStyle(fontSize: SizeConfig.scaleTextFont(18),color: Color(0xffF6F6F6))),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.scaleHeight(20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.scaleHeight(30),
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
