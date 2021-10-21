import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int stackIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4EDEA),
      body: IndexedStack(
        index: stackIndex,
        children: [
          CustomScrollView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                pinned: true,
                floating: true,
                title: Text(
                  'الملف الشخصي',
                  style: GoogleFonts.tajawal(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                elevation: 10,
                shadowColor: Colors.black,

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
                        onTap: () {
                          setState(() {
                            stackIndex = 1;
                          });
                        },
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
          CustomScrollView(
            physics:
            BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                elevation: 15,
                title: Text(
                  'الاعدادات',
                  style: GoogleFonts.tajawal(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        stackIndex = 0;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'المساعدة و الآراء',
                        style: GoogleFonts.tajawal(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        height: 16,
                        color: Colors.black,
                        thickness: 1,
                      ),
                      // SizedBox(height: 0),
                      NavigationItem(
                        onTap: () {
                          print('x');
                        },
                        icon: Icons.help_outline,
                        label: 'المساعدة',
                      ),
                      SizedBox(height: 16),
                      NavigationItem(
                        onTap: () {
                          print('x');
                        },
                        icon: Icons.home_repair_service,
                        label: 'الدعم الفني',
                      ),
                      SizedBox(height: 32),
                      Text(
                        'عن عقاري',
                        style: GoogleFonts.tajawal(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        height: 16,
                        color: Colors.black,
                        thickness: 1,
                      ),
                      NavigationItem(
                        onTap: () {
                          print('x');
                        },
                        icon: Icons.question_answer,
                        label: 'من نحن',
                      ),
                      SizedBox(height: 16),
                      NavigationItem(
                        onTap: () {
                          print('x');
                        },
                        icon: Icons.star,
                        label: 'قيم التطبيق',
                      ),
                      SizedBox(height: 16),
                      NavigationItem(
                        onTap: () {
                          print('x');
                        },
                        icon: Icons.share,
                        label: 'شارك التطبيق',
                      ),
                      SizedBox(height: 32),
                      Text(
                        'المعلومات القانونية',
                        style: GoogleFonts.tajawal(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        height: 16,
                        color: Colors.black,
                        thickness: 1,
                      ),
                      NavigationItem(
                        onTap: () {
                          print('x');
                        },
                        icon: Icons.view_list_outlined,
                        label: 'شروط الاستخدام',
                      ),
                      SizedBox(height: 16), NavigationItem(
                        onTap: () {
                          print('x');
                        },
                        icon: Icons.shield,
                        label: 'سياسة الخصوصية',
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
