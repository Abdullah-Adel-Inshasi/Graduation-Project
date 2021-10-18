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
  List<Widget> tabScreens = [Notifications_List(),ComplaintBox()];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
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
        title: Text(
          'الاشعارات',
          style: GoogleFonts.tajawal(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.menu), onPressed: () {}, color: Colors.black),
        ],
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
            color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: tabScreens[selected_index],
    );
  }
}
