import 'package:flutter/material.dart';
import 'package:home_explorer/landlord/my_apartments/apartments_screen.dart';
import 'package:home_explorer/landlord/notifications/notifications_wrapper.dart';
import 'package:home_explorer/landlord/profile/landlord_homescreen.dart';

class LandLordWrapper extends StatefulWidget {
  const LandLordWrapper({Key? key}) : super(key: key);

  @override
  _LandLordWrappeState createState() => _LandLordWrappeState();
}

class _LandLordWrappeState extends State<LandLordWrapper> {
  final List<Widget> _bnbScreens = [
    MyApartments(),
    Text(''),
    NotificationsWrapper(),
    HomeScreen_Landlord(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          unselectedIconTheme: IconThemeData(size: 20),
          selectedIconTheme: IconThemeData(size: 30),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'عقاراتي',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'اضافة عقار',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              label: 'الاشعارات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'الملف الشخصي',
            ),
          ],
        ),
        body: _bnbScreens[_selectedIndex],
      ),
    );
  }
}
