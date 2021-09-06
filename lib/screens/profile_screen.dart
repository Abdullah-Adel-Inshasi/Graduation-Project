import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(
              'الملف الشخصي',
              style: GoogleFonts.tajawal(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                    size: 30,
                  )),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          'assets/images/girl.jpg',
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'نانسي عجرم',
                            style: GoogleFonts.tajawal(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'nancy.ajram@gmail.com',
                            style: GoogleFonts.tajawal(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '0591324567',
                            style: GoogleFonts.tajawal(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      print('history');
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      child: Column(
                        children: [
                          Divider(thickness: 2),
                          SizedBox(height: 12),
                          Row(
                            children: <Widget>[
                              Icon(Icons.history),
                              SizedBox(width: 12),
                              Text(
                                'آخر المشاهدات',
                                style: GoogleFonts.tajawal(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 12),
                          Divider(thickness: 2),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  NavigationItem(
                    label: 'الإشعارات',
                    icon: Icons.notifications_none,
                    onTap: () => print('الإشعارات'),
                  ),
                  SizedBox(height: 30),
                  NavigationItem(
                    label: 'الإعدادات',
                    icon: Icons.settings_outlined,
                    onTap: () => print('الإعدادات'),
                  ),
                  SizedBox(height: 30),
                  NavigationItem(
                    label: 'المساعدة',
                    icon: Icons.help_outline,
                    onTap: () => print('المساعدة'),
                  ),
                  SizedBox(height: 30),
                  NavigationItem(
                    label: 'تسجيل الخروج',
                    icon: Icons.logout,
                    onTap: () => print('تسجيل الخروج'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const NavigationItem(
      {Key? key, required this.label, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Row(
          children: <Widget>[
            Icon(icon),
            SizedBox(width: 12),
            Text(
              '$label',
              style: GoogleFonts.tajawal(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
