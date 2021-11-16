// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:home_explorer/landlord/manage_apartment.dart';
// import 'package:home_explorer/landlord/my_apartments/public_apartments.dart';
// import 'package:home_explorer/landlord/widgets/apartment_landlord.dart';
// import 'package:home_explorer/models/apartment.dart';
// import 'package:page_transition/page_transition.dart';
//
// class Aqarati extends StatelessWidget {
//   const Aqarati({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(
//             children: [
//               Text(
//                 'خاص',
//                 style: GoogleFonts.tajawal(
//                     fontSize: 32, fontWeight: FontWeight.w600),
//               ),
//               Column(
//                 children: [
//                   ApartmnetCardLandlord(
//                     home: home[3],
//                   ),
//                   ApartmnetCardLandlord(
//                     home: home[4],
//                   ),
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   Text(
//                     'عام',
//                     style: GoogleFonts.tajawal(
//                         fontSize: 32, fontWeight: FontWeight.w600),
//                   ),
//                   Column(
//                     children: [
//                       ApartmnetCardLandlord(
//                         home: home[3],
//                       ),
//                       ApartmnetCardLandlord(
//                         home: home[4],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
