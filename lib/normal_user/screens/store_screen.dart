import 'package:flutter/material.dart';
import 'package:home_explorer/models/apartment.dart';
import 'package:home_explorer/constants/styles.dart' as Constant;

import 'apartment_screen.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

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
                            title: 'وصف المعرض',
                            body:
                                ' مساحة الشقة 170 م ومسورة وفيها بئر مياه خاص ومبنى مؤسس لخمس طوابق بعد الدور الارضي بالقرب من مفترق ضبيط جنوب جامع ابو ايوب الانصاري',
                          ),
                          SizedBox(height: 20),
                          DetailedParagraph(
                            title: 'مساحة السدة',
                            body: '170 متر',
                          ),
                          SizedBox(height: 32),
                          StoreDetailss(),
                          SizedBox(height: 20),
                          AvailableDays(),
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

class StoreDetailss extends StatelessWidget {
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
                label: 'مساحة المعرض',
                iconData: Icons.format_size,
                value: '120 متر مربع',
              ),
              SizedBox(height: 6),
              ApartmentDetail(
                label: 'حالة التشطيب',
                iconData: Icons.star,
                value: 'تشطيب معرض ', //تشطيب ورشة / تشطيب مخزن
              ),
              SizedBox(height: 6),
              ApartmentDetail(
                label: 'تصنيف المعرض',
                iconData: Icons.store,
                value: 'معرض مجمع', //سوق شعبي و على شارع تجاري و على شارع عام
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
                        'مصعد',
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
