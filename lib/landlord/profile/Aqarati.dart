import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/landlord/manage_apartment.dart';
import 'package:home_explorer/landlord/my_apartments/public_apartments.dart';
import 'package:page_transition/page_transition.dart';

class Aqarati extends StatelessWidget {
  const Aqarati({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                'خاص',
                style: GoogleFonts.tajawal(
                    fontSize: 32, fontWeight: FontWeight.w600),
              ),
              Column(
                children: [
                  ApartmnetCardLandlord(
                    apt_name: 'عمارة شارع الجلاء',
                    days_until_pay: 12,
                    imageIrl: 'assets/images/house2.jpg',
                    rent: 120,
                  ),
                  ApartmnetCardLandlord(
                    apt_name: 'عمارة الاقصى',
                    days_until_pay: 12,
                    imageIrl: 'assets/images/house1.jpg',
                    rent: 120,
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'عام',
                    style: GoogleFonts.tajawal(
                        fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                  Column(
                    children: [
                      ApartmnetCardLandlord(
                        apt_name: 'عمارة لوح حديد',
                        days_until_pay: 12,
                        imageIrl: 'assets/images/house3.jpg',
                        rent: 120,
                      ),
                      ApartmnetCardLandlord(
                        apt_name: 'بيت الشيخ',
                        days_until_pay: 12,
                        imageIrl: 'assets/images/house4.jpg',
                        rent: 120,
                      )
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ApartmnetCardLandlord extends StatelessWidget {
  final String imageIrl;
  final String apt_name;
  final int rent;
  final int days_until_pay;

  const ApartmnetCardLandlord(
      {Key? key,
      required this.imageIrl,
      required this.apt_name,
      required this.rent,
      required this.days_until_pay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          PageTransition(
              child: ApartmentPage_Landlord(),
              type: PageTransitionType.bottomToTop)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: Image.asset(
              imageIrl,
              width: double.infinity,
              height: 140,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 8),
          Text(
            apt_name,
            style:
                GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'الاجار الشهري : ${rent}\$',
            style:
                GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            'باقي لاستلام الاجار : ${days_until_pay} يوم',
            style:
                GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
