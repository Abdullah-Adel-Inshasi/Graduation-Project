import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/landlord/chats_wrapper/chat_wrapper.dart';
import 'package:home_explorer/landlord/my_apartments/apartments_screen.dart';
import 'package:home_explorer/landlord/notifications/notifications_wrapper.dart';
import 'package:home_explorer/models/apartment.dart';
import 'package:home_explorer/models/user.dart';
import 'package:page_transition/page_transition.dart';

import 'add_apartment/appbar/add_realestate.dart';

class LandLordWrapper extends StatefulWidget {
  late final User? user;

  LandLordWrapper({required this.user});

  @override
  _LandLordWrappeState createState() => _LandLordWrappeState(user: user);
}

class _LandLordWrappeState extends State<LandLordWrapper> {
  late final User? user;

  _LandLordWrappeState({required this.user});

  late List<Widget> _bnbScreens = [
    MyApartments(user: widget.user),
    AddRealEstate(user: widget.user,),
    ChatWrapper(),
    // HomeScreen_Landlord(),
  ];
  int _selectedIndex = 0;

  bool isPro = false;


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:Color(0xFFF6F6F6),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: 240,
                width: double.infinity,
                color:Color(0xFF14688C),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/user_image.png'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      user!.fullName,
                      style: GoogleFonts.tajawal(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(user!.phoneNumber,
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.tajawal(
                          color: Colors.white,
                          fontSize: 22,
                        ))
                  ],
                ),
              ),
              SizedBox(height: 30),
              SwitchListTile.adaptive(
                title: Text('Makani Pro'),
                secondary: Icon(Icons.add),
                value: isPro,
                onChanged: (x) {
                  setState(() {
                    isPro = x;
                  });
                },
              ),
              ListTile(
                title: Text('الاشعارات'),
                leading: Icon(Icons.notifications),
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: NotificationsWrapper(),
                          type: PageTransitionType.rightToLeft));
                },
              ),
              ListTile(
                title: Text('الدعم و المساندة'),
                leading: Icon(Icons.support_agent),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                },
                child: ListTile(
                  title: Text('تسجيل خروج'),
                  leading: Icon(Icons.logout),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 16,
          onTap: (int index) {
            setState(
              () {
                _selectedIndex = index;
              },
            );
          },
          backgroundColor: Color(0xFFFEF9EF),
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF14688C),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          unselectedIconTheme: IconThemeData(size: 15),
          selectedIconTheme: IconThemeData(size: 30),
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
              label: 'عقاراتي',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 1 ? Icons.add_circle_sharp : Icons.add),
              label: 'اضافة عقار',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2
                  ? Icons.mail
                  : Icons.mail_outline),
              label: 'الرسائل',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //       _selectedIndex == 3 ? Icons.person : Icons.person_outline),
            //   label: 'الملف الشخصي',
            // ),
          ],
        ),
        body: _bnbScreens[_selectedIndex],
      ),
    );
  }
}
