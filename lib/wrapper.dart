import 'package:flutter/material.dart';
import 'package:home_explorer/screens/home_screen.dart';
import 'package:home_explorer/screens/notifications_screen.dart';
import 'package:home_explorer/screens/profile_screen.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final List<Widget> _bnbScreens = [
    HomeScreen(),
    NotificationsScreen(),
    Text('bookmarks'),
    ProfileScreen(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF4EDEA),
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
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              label: 'الاشعارات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: 'الحجوزات',
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
