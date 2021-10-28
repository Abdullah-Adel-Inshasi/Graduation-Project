import 'package:flutter/material.dart';
import 'package:home_explorer/normal_user/screens/bookmarks.dart';
import 'package:home_explorer/normal_user/screens/home_screen.dart';
import 'package:home_explorer/normal_user/screens/notifications_screen.dart';
import 'package:home_explorer/normal_user/screens/profile_screen.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final List<Widget> _bnbScreens = [
    HomeScreen(),
    NotificationsScreen(),
    Bookmarks(),
    ProfileScreen(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF4EDEA),
        drawer: Drawer(child: Text('155555555555555555'),),
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
              icon: Icon(_selectedIndex == 0 ? Icons.home:Icons.home_outlined),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1 ? Icons.notifications:Icons.notifications_none),
              label: 'الاشعارات',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2 ? Icons.bookmark:Icons.bookmark_border),
              label: 'الحجوزات',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3 ? Icons.person:Icons.person_outline),
              label: 'الملف الشخصي',
            ),
          ],
        ),
        body: _bnbScreens[_selectedIndex],
      ),
    );
  }
}
