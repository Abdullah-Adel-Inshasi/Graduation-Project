import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/landlord/manage_apartment.dart';
import 'package:home_explorer/models/apartment.dart';
import 'package:page_transition/page_transition.dart';

class ApartmnetCardLandlord extends StatelessWidget {
 final Home home;

  const ApartmnetCardLandlord(
      {Key? key,
        required this.home})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          PageTransition(
              child: ApartmentPage_Landlord(home: home,),
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
              home.coverImg,
              width: double.infinity,
              height: 140,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 8),
          Text(
            home.name,
            style:
            GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'الاجار الشهري : ${home.monthlyRent}\$',
            style:
            GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            'باقي لاستلام الاجار : ${5} يوم',
            style:
            GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}