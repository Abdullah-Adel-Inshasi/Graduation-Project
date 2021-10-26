import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApartmentPage_Landlord extends StatefulWidget {
  const ApartmentPage_Landlord({Key? key}) : super(key: key);

  @override
  State<ApartmentPage_Landlord> createState() => _ApartmentPage_LandlordState();
}

class _ApartmentPage_LandlordState extends State<ApartmentPage_Landlord> {
  bool canEdit = false;
  String address = 'غزة - شارع النصر - دوار الشباب و الرياضة';
  double rentPrice = 120;
  bool isRented = false;
  late TextEditingController addressTEC;
  late PageController _pageController;

  @override
  void initState() {
    addressTEC = TextEditingController(text: address);
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Text('Apartment Name'),
              backgroundColor: Colors.teal,
              leading: BackButton(),
              actions: [
                Switch(
                  value: canEdit,
                  onChanged: (x) => setState(
                    () {
                      canEdit = x;
                    },
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 260,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                child: PageView.builder(
                  controller: _pageController,
                  physics: BouncingScrollPhysics(),
                  padEnds: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset('assets/images/house4.jpg',fit: BoxFit.cover,),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.location_on_rounded),
                        SizedBox(width: 5),
                        Text(
                          'العنوان',
                          style: GoogleFonts.tajawal(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    canEdit ? Text('') : SizedBox(height: 5),
                    TextField(
                      textDirection: TextDirection.rtl,
                      controller: addressTEC,
                      onChanged: (newAddress) =>
                          setState(() => address = newAddress),
                      enabled: canEdit,
                      style: GoogleFonts.tajawal(
                          fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: 10),
                        disabledBorder: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    canEdit ? Text('') : SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(Icons.vpn_key),
                          SizedBox(width: 5),
                          Text(
                            'الحالة : ${isRented ? 'مؤجرة' : 'متاح للإجار'}',
                            style: GoogleFonts.tajawal(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ]),
                        IgnorePointer(
                          ignoring: !canEdit,
                          child: Switch(
                              value: isRented,
                              onChanged: (x) => setState(() => isRented = x)),
                        )
                      ],
                    ),
                    isRented
                        ? Text(
                            'مؤجرة حتى :',
                            style: GoogleFonts.tajawal(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          )
                        : Text(''),
                    isRented
                        ? DateTimePicker(
                            type: DateTimePickerType.dateTimeSeparate,
                            dateMask: 'd MMM, yyyy',
                            initialValue: DateTime.now().toString(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            icon: Icon(Icons.event),
                            dateLabelText: 'Date',
                            timeLabelText: "Hour",
                            selectableDayPredicate: (date) {
                              // Disable weekend days to select from the calendar
                              if (date.weekday == 6 || date.weekday == 7) {
                                return false;
                              }

                              return true;
                            },
                            onChanged: (val) => print(val),
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (val) => print(val),
                          )
                        : Text(''),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
