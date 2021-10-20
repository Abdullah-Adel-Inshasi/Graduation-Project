import 'package:flutter/material.dart';
import 'package:home_explorer/landlord/my_apartments/apartments_screen.dart';
import 'package:home_explorer/landlord/notifications/notifications_wrapper.dart';
import 'package:home_explorer/landlord/profile/landlord_homescreen.dart';

import 'add_apartment/appbar/price_and_location.dart';

class LandLordWrapper extends StatefulWidget {
  const LandLordWrapper({Key? key}) : super(key: key);

  @override
  _LandLordWrappeState createState() => _LandLordWrappeState();
}

class _LandLordWrappeState extends State<LandLordWrapper> {
  final List<Widget> _bnbScreens = [
    MyApartments(),
    PriceAndLocation(),
    NotificationsWrapper(),
    HomeScreen_Landlord(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF4EDEA),

        drawer: Drawer(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[],
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
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          unselectedIconTheme: IconThemeData(size: 20),
          selectedIconTheme: IconThemeData(size: 30),
          type: BottomNavigationBarType.fixed,
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
                  ? Icons.notifications
                  : Icons.notifications_none),
              label: 'الاشعارات',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 3 ? Icons.person : Icons.person_outline),
              label: 'الملف الشخصي',
            ),
          ],
        ),
        body: _bnbScreens[_selectedIndex],
      ),
    );
  }
}
