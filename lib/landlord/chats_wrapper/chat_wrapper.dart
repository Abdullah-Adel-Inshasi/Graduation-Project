import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/normal_user/screens/profile_screen.dart';

class ChatWrapper extends StatelessWidget {
  const ChatWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              backgroundColor: Color(0xFF14688C),
              pinned: true,
              floating: true,
              title: Text(
                'الرسائل',
                style: GoogleFonts.tajawal(color: Colors.white, fontSize: 22),
              ),
              elevation: 10,
              shadowColor: Colors.black,
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
      ),
    );
  }
}
