import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/constants/styles.dart';
import 'package:home_explorer/models/apartment.dart';
import 'package:home_explorer/constants/styles.dart' as Constant;

class ApartmentScreen extends StatelessWidget {
  final Apartment apartment;

  const ApartmentScreen({Key? key, required this.apartment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            physics:
            BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              // SliverPersistentHeader(
              //   delegate: BlurredOutAppBar(),
              //   pinned: true,
              // ),

              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Images(imageUrl: apartment.imageUrl),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      transform: Matrix4.translationValues(0, -16, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ApartmentPrice(price: apartment.price),
                          // SizedBox(height: 20),
                          // BookingDetails(
                          //   bookingPercentage: 22,
                          //   numOfAvailableDays: 5,
                          //   numOfIntrestedPeople: 23,
                          // ),
                          SizedBox(height: 20),
                          DetailedParagraph(
                            title: 'وصف العقار',
                            body:
                            ' مساحة الشقة 170 م ومسورة وفيها بئر مياه خاص ومبنى مؤسس لخمس طوابق بعد الدور الارضي بالقرب من مفترق ضبيط جنوب جامع ابو ايوب الانصاري',
                          ),
                          SizedBox(height: 20),
                          DetailedParagraph(
                            title: 'اتجاهات الشقة',
                            body: 'الشقة على شارعين',
                          ),
                          SizedBox(height: 32),
                          ApartmentDetails(apartment: apartment),
                          SizedBox(height: 20),
                          AvailableDays(),
                          SizedBox(height: 32),
                          Text(
                            'قد يعجبك أيضاً',
                            style: Constant.kHeadlineTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [HalfImageCard(), HalfImageCard()],
                          ),
                          SizedBox(height: 32),
                          Text(
                            'إبقى على معرفة',
                            style: Constant.kHeadlineTextStyle,
                          ),
                          SizedBox(height: 20),
                          TrackThisApartment(),
                          SizedBox(height: 15),
                          ReportButton(),
                          SizedBox(height: 30),
                          MakeAnOfferButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // SliverFillRemaining()
            ],
          ),
        ),
      ),
    );
  }
}

class TrackThisApartment extends StatelessWidget {
  const TrackThisApartment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      color: Colors.red,
      child: Row(
        children: <Widget>[
          Text('for'),
        ],
      ),
    );
  }
}

class HalfImageCard extends StatelessWidget {
  const HalfImageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 170,
      child: Column(
        children: [
          Image.asset(
            apartments[0].imageUrl,
            height: 80,
            width: 170,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Constant.kLineBorder,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${apartments[0].price}',
                        style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: '/شهريا',
                        style: GoogleFonts.tajawal(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Text(apartments[0].location),
                Text(
                  ' ${apartments[0].room_number}  غرفة | ${apartments[0]
                      .bathroom_number} حمام | ${apartments[0].size} متر',
                  style: GoogleFonts.tajawal(fontSize: 12),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReportButton extends StatelessWidget {
  const ReportButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('تم الإبلاغ'),
      child: Container(
        child: Row(
          children: <Widget>[
            Icon(
              Icons.flag_outlined,
              color: Colors.red,
            ),
            SizedBox(width: 5),
            Text(
              'الإبلاغ عن هذا العقار',
              style: GoogleFonts.tajawal(color: Colors.black, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

class MakeAnOfferButton extends StatelessWidget {
  const MakeAnOfferButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('ابدأ الرهن الآن'),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22), color: Colors.blue),
        child: Center(
          child: Text(
            'ابدأ الرهن الآن',
            style: GoogleFonts.tajawal(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class AvailableDays extends StatelessWidget {
  const AvailableDays({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: kLineBorder,
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Row(
              children: <Widget>[
                SizedBox(width: 6),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'الأيام المتاحة للزيارة',
                  style: Constant.kBodyTextStyle
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
              ],
            ),
          ),
          Divider(
            color: Colors.black.withOpacity(0.15),
            thickness: 2,
          ),
          Container(
            margin: EdgeInsets.only(right: 7, top: 6),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                ///TODO : make the day name and times bold to stand out and attract user attention
                Text(
                  'الأحد : من ال12 ظهراً حتى 1:30 ظهراً',
                  style: Constant.kBodyTextStyle,
                ),
                Text(
                  'الإثنين : من 12 ظهراً حتى 1:30 ظهراً',
                  style: Constant.kBodyTextStyle,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 26, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(
                          22,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'ارسال طلب زيارة',
                          style: GoogleFonts.tajawal(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ApartmentDetails extends StatelessWidget {
  const ApartmentDetails({
    Key? key,
    required this.apartment,
  }) : super(key: key);

  final Apartment apartment;

  /// TODO : after you created the apartment class , add final Apartment [apartment]
  /// apartment gives access to details about the apartment :
  /// - number of bedrooms
  /// - number of living rooms
  /// - number of bathrooms
  /// - apartment area (x m^2)
  /// -- if the property

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.black.withOpacity(0.15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ApartmentDetail(
                    label: 'غرف النوم',
                    iconData: Icons.bed,
                    num: 3,
                  ),
                  SizedBox(height: 5),
                  ApartmentDetail(
                      label: 'الصالات', iconData: Icons.chair, num: 2),
                  SizedBox(height: 5),
                  ApartmentDetail(
                      label: 'دورات المياه',
                      iconData: Icons.bathtub_outlined,
                      num: 3)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ApartmentDetail(
                    label: 'مساحة الشقة',
                    iconData: Icons.format_size,
                    num: apartment.size,
                  ),
                  SizedBox(height: 5),
                  ApartmentDetail(
                      label: 'الطابق', iconData: Icons.menu, num: 3),
                  SizedBox(height: 5),
                  ApartmentDetail(
                      label: 'رقم الشقة',
                      iconData: Icons.format_list_numbered,
                      num: 202)
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 40,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'مصعد',
                    style:
                    Constant.kBodyTextStyle.copyWith(color: Colors.white),
                  ),
                  SizedBox(width: 5),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.blue,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    'مكيف',
                    style:
                    Constant.kBodyTextStyle.copyWith(color: Colors.white),
                  ),
                  SizedBox(width: 5),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.blue,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    'مفروشة',
                    style:
                    Constant.kBodyTextStyle.copyWith(color: Colors.white),
                  ),
                  SizedBox(width: 5),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.blue,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class ApartmentDetail extends StatelessWidget {
  final String label;
  final IconData iconData;
  final int num;

  const ApartmentDetail({Key? key,
    required this.label,
    required this.iconData,
    required this.num})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        SizedBox(width: 5),
        Text(
          '$label : $num',
          style: Constant.kBodyTextStyle.copyWith(),
        ),
      ],
    );
  }
}

class Images extends StatelessWidget {
  final String imageUrl;

  const Images({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          transitionOnUserGestures: true,
          tag: imageUrl,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          ),
        ),
        Positioned(
          top: 20,
          right: 40,
          left: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap:(){
                  print('added to favourites');
                },
                child: Icon(
                  Icons.favorite_outline_rounded,
                  size: 30,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 30,
                  )),
            ],
          ),
        )
      ],
    );
  }
}

class DetailedParagraph extends StatelessWidget {
  final String title;
  final String body;

  const DetailedParagraph({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: Constant.kHeadlineTextStyle,
        ),
        SizedBox(height: 4),
        Text(
          '$body',
          style: Constant.kBodyTextStyle.copyWith(),
        ),
      ],
    );
  }
}

class BookingDetails extends StatelessWidget {
  final int numOfAvailableDays;
  final int numOfIntrestedPeople;
  final int bookingPercentage;

  BookingDetails({required this.bookingPercentage,
    required this.numOfIntrestedPeople,
    required this.numOfAvailableDays});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              ' الأيام الشاغرة ',
              style: Constant.kBodyTextStyle,
            ),
            SizedBox(height: 8),
            Text(
              '$numOfAvailableDays',
              style: GoogleFonts.tajawal(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              'عدد المهتمين  ',
              style: GoogleFonts.tajawal(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Text(
              '$numOfIntrestedPeople',
              style: GoogleFonts.tajawal(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              ' نسبة اكتمال الحجز ',
              style: GoogleFonts.tajawal(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Text(
              '$bookingPercentage%',
              style: GoogleFonts.tajawal(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ApartmentPrice extends StatelessWidget {
  const ApartmentPrice({
    Key? key,
    required this.price,
  }) : super(key: key);

  final int price;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '\$$price',
            style: GoogleFonts.tajawal(
                color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: '/شهريا',
            style: GoogleFonts.tajawal(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class BlurredOutAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          color: Colors.white.withOpacity(0.4),
          height: 75,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_forward_ios_sharp),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 75;

  @override
  double get minExtent => 75;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
