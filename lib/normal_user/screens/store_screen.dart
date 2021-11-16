import 'package:flutter/material.dart';
import 'package:home_explorer/models/apartment.dart';
import 'package:home_explorer/constants/styles.dart' as Constant;

import 'apartment_screen.dart';

class StoreScreen extends StatelessWidget {
  final Store store;

  StoreScreen({required this.store});

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
                    Images(imageUrl: store.coverImg),
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
                            body: store.address.toString(),
                          ),
                          SizedBox(height: 20),
                          DetailedParagraph(
                            title: 'وصف المعرض',
                            body:store.aboutEstate,
                          ),
                          SizedBox(height: 20),
                          DetailedParagraph(
                            title: 'مساحة السدة',
                            body: '${store.size} متر',
                          ),
                          SizedBox(height: 32),
                          StoreDetailss(store: store,),
                          SizedBox(height: 20),
                          AvailableDays(start: store.beginObservation,end: store.endObservation,),
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

  final Store store ;


  StoreDetailss({required this.store});

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
                value: '${store.size} متر مربع',
              ),
              SizedBox(height: 6),
              ApartmentDetail(
                label: 'حالة التشطيب',
                iconData: Icons.star,
                value: store.finishingStatus, //تشطيب ورشة / تشطيب مخزن
              ),
              SizedBox(height: 6),
              ApartmentDetail(
                label: 'تصنيف المعرض',
                iconData: Icons.store,
                value: store.exhibitionRating, //سوق شعبي و على شارع تجاري و على شارع عام
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                  color: store.publicStreet==true ? Color(0xFF14688C) : Colors.grey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'معفش',
                        style: Constant.kBodyTextStyle
                            .copyWith(color:store.publicStreet==true ? Colors.white : Colors.red),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                          child: Icon(
                            store.publicStreet==true ? Icons.check : Icons.clear,
                            color: store.publicStreet==true ? Color(0xFF14688C) : Colors.red,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                  color: store.hasPowerLine==true ? Color(0xFF14688C) : Colors.grey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'خط ماتور',
                        style: Constant.kBodyTextStyle
                            .copyWith(color:store.hasPowerLine==true ? Colors.white : Colors.red),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                          child: Icon(
                            store.hasPowerLine==true ? Icons.check : Icons.clear,
                            color: store.hasPowerLine==true ? Color(0xFF14688C) : Colors.red,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                  color: store.hasAc==true ? Color(0xFF14688C) : Colors.grey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'تكييف',
                        style: Constant.kBodyTextStyle
                            .copyWith(color:store.hasAc==true ? Colors.white : Colors.red),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                          child: Icon(
                            store.hasAc==true ? Icons.check : Icons.clear,
                            color: store.hasAc==true ? Color(0xFF14688C) : Colors.red,
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
