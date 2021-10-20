import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:home_explorer/landlord/widgets/pressableChip.dart';
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
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/images/house1.jpg',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 25),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /// TODO : Add the apartment details
                  Text(': اسم الشقة',
                      style: GoogleFonts.tajawal(fontSize: 16)),
                  SizedBox(height: 8),
                  Text(': المستأجر الحالي',
                      style: GoogleFonts.tajawal(fontSize: 16)),
                  SizedBox(height: 8),
                  Text(': الحالة', style: GoogleFonts.tajawal(fontSize: 16)),
                  SizedBox(height: 8),
                  Text(": الاجار الشهري",
                      style: GoogleFonts.tajawal(fontSize: 16)),
                  SizedBox(height: 8),
                  Text(': عدد الطلبات',
                      style: GoogleFonts.tajawal(fontSize: 16)),
                ],
              ),

            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PressableChip(label: 'حجب العقار عن المنصة'),
              PressableChip(label: 'الرسائل'),
              PressableChip(label: 'اختر مستأجر')
            ],
          ),
        ],
      ),
    );
  }
}

