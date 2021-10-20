import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications_List extends StatefulWidget {
  @override
  State<Notifications_List> createState() => _Notifications_ListState();
}

class _Notifications_ListState extends State<Notifications_List> {
  List<String> notifications = [
    'اشعار 1',
    'اشعار 2',
    'اشعار 3',
    'اشعار 4',
    'اشعار 4',
    'اشعار 4',
    'اشعار 4',

  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: notifications
          .map(
            (e) => NotificationBuilder(notification: e,goToDetails: (){},),
          )
          .toList(),
    );
  }
}

class NotificationBuilder extends StatelessWidget {
  final String notification;
  final VoidCallback goToDetails;

  const NotificationBuilder({Key? key,required this.notification,required this.goToDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            notification,
            textAlign: TextAlign.right,
            style:
                GoogleFonts.tajawal(fontSize: 22, color: Colors.black),
          ),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: goToDetails,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black,width: 1)
                  ),
                  child: Text(
                    'التفاصيل',
                    style: GoogleFonts.tajawal(fontSize: 16),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
