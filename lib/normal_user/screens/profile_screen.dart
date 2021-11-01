import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/normal_user/screens/chat_screen.dart';

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
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.blue,
                pinned: true,
                floating: true,
                title: Text(
                  'الملف الشخصي',
                  style: GoogleFonts.tajawal(color: Colors.white, fontSize: 22),
                ),
                elevation: 10,
                shadowColor: Colors.black,
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Color(0xFFF4EDEA),
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
                          Spacer(),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Icon(Icons.edit),
                          )
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
                        label: 'الرسائل',
                        icon: Icons.message_outlined,
                        onTap: () => setState(() {
                          stackIndex = 2;
                        }),
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
                        onTap: () => (){
                          Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                        },
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
                backgroundColor: Colors.blue,
                pinned: true,
                floating: true,
                title: Text(
                  'الاعدادات و المساعدة',
                  style: GoogleFonts.tajawal(color: Colors.white, fontSize: 22),
                ),
                elevation: 10,
                shadowColor: Colors.black,
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        stackIndex = 0;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Color(0xFFF4EDEA),
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
                      SizedBox(height: 16),
                      NavigationItem(
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
          CustomScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.blue,
                pinned: true,
                floating: true,
                title: Text(
                  'الرسائل',
                  style: GoogleFonts.tajawal(color: Colors.white, fontSize: 22),
                ),
                elevation: 10,
                shadowColor: Colors.black,
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        stackIndex = 0;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    ChatWithUser(
                      username: 'جميل فارس',
                      networkImgURL:
                          'https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f469ea85cc82fc8d6083f05%2FAmazon-Founder-and-CEO-Jeff-Bezos%2F960x0.jpg%3Ffit%3Dscale',
                      isRead: false,
                      lastMessage: 'حسناً أراك غدا',
                    ),
                    ChatWithUser(
                      username: 'جميل فارس',
                      networkImgURL:
                          'https://img.i-scmp.com/cdn-cgi/image/fit=contain,width=1098,format=auto/sites/default/files/styles/1200x800/public/d8/images/methode/2021/01/26/192d35d8-5618-11eb-84b3-e7426e7b8906_image_hires_131135.jpg?itok=7cjYpM-L&v=1611637908',
                      isRead: true,
                      lastMessage: 'السعر النهائي 120 دولار !',
                    ),
                    ChatWithUser(
                      username: 'كمال السمكري',
                      networkImgURL:
                          'https://ichef.bbci.co.uk/news/640/cpsprodpb/9041/production/_117492963_mackenziescott2.jpg',
                      isRead: false,
                      lastMessage: 'صحيح ! السعر قابل للتفاوض',
                    ),
                    ChatWithUser(
                      username: 'جميل فارس',
                      networkImgURL:
                          'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
                      isRead: true,
                      lastMessage: 'نعم العقار ما زال متاحاً',
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ChatWithUser extends StatelessWidget {
  final String networkImgURL;
  final String username;
  final String lastMessage;
  final bool isRead;

  const ChatWithUser(
      {Key? key,
      required this.networkImgURL,
      required this.username,
      required this.lastMessage,
      required this.isRead})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Chat(
                    imageUrl: networkImgURL,
                    username: username,
                  ))),
      tileColor: isRead ? Colors.grey[300] : Colors.transparent,
      title: Text(username),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(networkImgURL),
      ),
      subtitle: Text(lastMessage),
      trailing: Column(
        mainAxisAlignment:
            isRead ? MainAxisAlignment.start : MainAxisAlignment.spaceEvenly,
        children: [
          Text('05:46 صباحاً'),
          isRead
              ? Text('')
              : Container(
                  width: 14,
                  height: 14,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
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
