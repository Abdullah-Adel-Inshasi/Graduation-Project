import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/landlord/manage_apartment.dart';

import 'package:page_transition/page_transition.dart';
class PublicApartments extends StatelessWidget {
  const PublicApartments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ApartmentCard_Owner(),
      ],
    );
  }
}

class ApartmentCard_Owner extends StatelessWidget {
  const ApartmentCard_Owner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          ApartmnetCardLandlord(
            apt_name: 'عمارة شارع العباس',
            days_until_pay: 12,
            imageUrl: 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/21276944.jpg?k=c7df7bddc3522b878f60a3e2012c672d1fcbe8a7389aaa597d6ec4292c4a5b62&o=&hp=1',
            rent: 150,
          ),
          ApartmnetCardLandlord(
            apt_name: 'روف على الطابق الرابع',
            days_until_pay: 2,
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7H7QOn-S1wlcX0RN632wtE-yl_zuOQK7jtA&usqp=CAU',
            rent: 200,
          ),
        ],
      ),
    );
  }
}

class ApartmnetCardLandlord extends StatelessWidget {
  final String imageUrl;
  final String apt_name;
  final int rent;
  final int days_until_pay;

  const ApartmnetCardLandlord(
      {Key? key,
        required this.imageUrl,
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
            child: Image.network(
              imageUrl,
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
