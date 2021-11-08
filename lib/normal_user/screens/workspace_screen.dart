import 'package:flutter/material.dart';
import 'package:home_explorer/landlord/add_apartment/appbar/add_realestate.dart';
import 'package:home_explorer/models/apartment.dart';
import 'package:home_explorer/normal_user/screens/store_screen.dart';
import 'package:home_explorer/constants/styles.dart' as Constant;

import 'apartment_screen.dart';

class WorkSpaceScreen extends StatelessWidget {
  final WorkSpace workSpace;


  WorkSpaceScreen({required this.workSpace});

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
              SliverPersistentHeader(
                delegate: BlurredOutAppBar(),
                pinned: true,
              ),

              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Images(imageUrl: 'assets/images/house5.jpg'),
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
                          ApartmentPrice(price: 120),
                          // SizedBox(height: 20),
                          // BookingDetails(
                          //   bookingPercentage: 22,
                          //   numOfAvailableDays: 5,
                          //   numOfIntrestedPeople: 23,
                          // ),
                          SizedBox(height: 20),
                          DetailedParagraph(
                            title: 'الموقع',
                            body: 'غزة - النصر - نبيل طموس',
                          ),
                          SizedBox(height: 20),
                          DetailedParagraph(
                            title: 'وصف مساحة العمل',
                            body:
                                ' مساحة الشقة 170 م ومسورة وفيها بئر مياه خاص ومبنى مؤسس لخمس طوابق بعد الدور الارضي بالقرب من مفترق ضبيط جنوب جامع ابو ايوب الانصاري',
                          ),
                          SizedBox(height: 32),
                          WorkSpaceDetails(),
                          SizedBox(height: 20),
                          AvailableDays(start: workSpace.beginObservation,end: workSpace.endObservation,),
                          SizedBox(height: 32),
                          Text(
                            'قد يعجبك أيضاً',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [HalfImageCard(), HalfImageCard()],
                          ),
                          SizedBox(height: 32),

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

class WorkSpaceDetails extends StatelessWidget {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ApartmentDetail(
                label: 'مساحة الغرفة',
                iconData: Icons.format_size,
                value: '20 متر مربع',
              ),
              SizedBox(height: 6),
              ApartmentDetail(
                label: 'الطابق',
                iconData: Icons.menu,
                value: 'الثالث', //سوق شعبي و على شارع تجاري و على شارع عام
              ),
              SizedBox(height: 6),
              ApartmentDetail(
                label: 'اسم المبنى',
                iconData: Icons.store_mall_directory,
                value: 'برج وطن', //سوق شعبي و على شارع تجاري و على شارع عام
              ),
              SizedBox(height: 6),
              ApartmentDetail(
                label: 'اشتراك الانترنت',
                iconData: Icons.wifi,
                value: '8 ميجا', //سوق شعبي و على شارع تجاري و على شارع عام
              ),
              SizedBox(height: 6),
              ApartmentDetail(
                label: 'عدد المكاتب',
                iconData: Icons.desktop_mac,
                value: '9', //تشطيب ورشة / تشطيب مخزن
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Color(0xFF14688C),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'مكيف',
                        style: Constant.kBodyTextStyle
                            .copyWith(color: Colors.white),
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
                            color: Color(0xFF14688C),
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Color(0xFF14688C),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'مصعد',
                        style: Constant.kBodyTextStyle
                            .copyWith(color: Colors.white),
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
                            color: Color(0xFF14688C),
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.grey.shade200,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'خط ماتور',
                        style: Constant.kBodyTextStyle
                            .copyWith(color: Color(0xFF14688C)),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                          child: Icon(
                            Icons.clear,
                            color: Colors.red,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
