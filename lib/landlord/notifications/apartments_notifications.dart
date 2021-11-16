import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/models/apartment.dart';

class Notifications_List extends StatefulWidget {
  @override
  State<Notifications_List> createState() => _Notifications_ListState();
}

class _Notifications_ListState extends State<Notifications_List> {
  List<String> notifications = [
    'تمت مشاهدة العقار (${home[0].name}',
    'طلب تأجير من ليلى مصباح',
    'هناك 20 مشاهدة جديدة ${home[0].name}',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return NotificationBuilder(
          notification: notifications[index],
          personImgUrl: 'assets/images/notification_bell.png',
          goToDetails: () {},
        );
      },
    );
  }
}

class NotificationBuilder extends StatelessWidget {
  final String notification;
  final VoidCallback goToDetails;
  final String personImgUrl;

  const NotificationBuilder(
      {Key? key,
      required this.notification,
      required this.goToDetails,
      required this.personImgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300, blurRadius: 6.0, spreadRadius: 3)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset('assets/images/notification_bell.png',
                      width: 64, height: 64,color: Colors.black,colorBlendMode: BlendMode.dstIn,)),
              SizedBox(width: 5),
              SizedBox.square(
                child: Text(
                  notification,
                  style: GoogleFonts.tajawal(),
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.more_horiz_sharp),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
