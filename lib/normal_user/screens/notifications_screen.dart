import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/constants/styles.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFF14688C),
            pinned: true,
            title: Text(
              'الإشعارات',
              style: GoogleFonts.tajawal(color: Colors.white, fontSize: 22),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(children: <Widget>[
              NearYou(),
              NearYou(),
            ]),
          )
        ],
      ),
    );
  }
}

class NearYou extends StatelessWidget {
  const NearYou({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
      padding: EdgeInsets.only(right: 16, top: 16, bottom: 8, left: 24),
      decoration: BoxDecoration(
        border: kLineBorder,
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Card Title
          Text(
            'عقارات بالقرب من شارع الجلاء',
            style: GoogleFonts.tajawal(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          //Card Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('بحدود 400\$ - 600\$ '),
              SizedBox(width: 16),
              Text('4 - 2 غرف'),
              Spacer(),
              Container(
                width: 20,
                height: 24,
                alignment: Alignment.center,
                child: Text('7'),
                decoration: BoxDecoration(border: kLineBorder),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.restore_from_trash,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              NotificationApartmentCard(
                imageUrl: 'assets/images/fancyhouse.jpg',
                numOfRooms: 3,
                price: 152,
              ),
              NotificationApartmentCard(
                price: 235,
                imageUrl: 'assets/images/house1.jpg',
                numOfRooms: 45,
              ),
              NotificationApartmentCard(
                price: 1,
                imageUrl: 'assets/images/house4.jpg',
                numOfRooms: -8,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class NotificationApartmentCard extends StatelessWidget {
  final int price;
  final String imageUrl;
  final int numOfRooms;

  const NotificationApartmentCard(
      {Key? key,
      required this.price,
      required this.imageUrl,
      required this.numOfRooms})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          imageUrl,
          width: 100,
          height: 90,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 6),
        Text(
          '$price\$ / الشهر',
          style: GoogleFonts.tajawal(),
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.bed_outlined,
              size: 20,
            ),
            SizedBox(width: 5),
            Text(
              'الغرف : $numOfRooms',
              style: GoogleFonts.tajawal(),
            )
          ],
        ),
      ],
    );
  }
}
