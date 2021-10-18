import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Aqarati extends StatelessWidget {
  const Aqarati({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
      child: Column(
        children: [
          ApartmnetCardLandlord(),
          SizedBox(height: 10),
          ApartmnetCardLandlord(),
        ],
      ),
    );
  }
}

class ApartmnetCardLandlord extends StatelessWidget {
  const ApartmnetCardLandlord({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: Image.asset(
            'assets/images/fancyhouse.jpg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'عمارة  رقم 12 بناية 16',
          style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          'الاجار الشهري : 200\$',
          style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          'باقي لاستلام الاجار : 20 يوم',
          style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
