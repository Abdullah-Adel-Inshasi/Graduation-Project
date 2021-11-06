import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/landlord/notifications/apartments_notifications.dart';
import 'package:home_explorer/landlord/notifications/complaint_box.dart';

class NotificationsWrapper extends StatefulWidget {
  const NotificationsWrapper({Key? key}) : super(key: key);

  @override
  _NotificationsWrapperState createState() => _NotificationsWrapperState();
}

class _NotificationsWrapperState extends State<NotificationsWrapper>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selected_index = 0;
  List<Widget> tabScreens = [Notifications_List(), ComplaintBox()];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Color(0xFF14688C),
          title: Text(
            'الاشعارات',
            style: GoogleFonts.tajawal(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
            controller: tabController,
            labelColor: Colors.black,
            indicatorColor: Color(0xFF12263A),
            unselectedLabelColor: Color(0xFFC5D8D1),
            tabs: [
              Tab(text: 'اشعارات العقارات'),
              Tab(text: 'صندوق الشكاوي'),
            ],
            onTap: (int index) {
              setState(() {
                selected_index = index;
              });
            },
          ),
        ),
        body: tabScreens[selected_index],
      ),
    );
  }
}
