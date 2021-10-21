import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';

class PriceAndLocation extends StatefulWidget {
  const PriceAndLocation({Key? key}) : super(key: key);

  @override
  _PriceAndLocationState createState() => _PriceAndLocationState();
}

class _PriceAndLocationState extends State<PriceAndLocation> {
  List<String> cities = [
    'غزة',
    'رفح',
    'خانيونس',
    'النصيرات',
    'الزوايدة',
    'تل الهوا',
    'جباليا'
  ];
  List<String> rental_timeframe = [
    'شهر',
    'قصير المدى (2 - 5 أشهر)',
    'طويل المدى (6+ أشهر)'
  ];
  List<String> typeOfRealEstae = ['شقة', 'منزل', 'روف'];
  List<String> numOfRooms = ['1', '2', '3', '4', '5+'];
  List<bool> selectedRooms = [false, false, false, true, false];
  List<String> numOfBathrooms = ['1', '2', '3+'];
  List<bool> selectedBathrooms = [false, false, false];
  bool nearMosque = false;
  bool nearSuperMarket = false;
  bool hasAC = false;
  bool hasElevator = false;
  bool hasGarage = false;
  bool hasBalcony = false;

  // ignore: non_constant_identifier_names
  late String selected_city;
  late String selected_timeframe;

  int selectedTypeOfAd = 1;
  late String selectedTypeOfRealEstate;

  isSelected(int selected, int this_index) {
    return this_index == selected;
  }

  @override
  void initState() {
    selected_city = cities[0];
    selected_timeframe = rental_timeframe[0];
    selectedTypeOfRealEstate = typeOfRealEstae[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4EDEA),
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            title: Text(
              'اضف عقار',
              style: GoogleFonts.tajawal(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
            backgroundColor: Colors.teal,
            leading: Icon(Icons.menu),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'اختر المنطقة',
                    style: GoogleFonts.tajawal(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 120,
                    child: DropdownButton(
                      alignment: Alignment.centerLeft,
                      value: selected_city,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Icon(Icons.arrow_drop_down_outlined),
                      ),
                      onChanged: (e) => setState(() {
                        selected_city = e.toString();
                      }),
                      items: cities
                          .map((e) => DropdownMenuItem(
                                child: Text(
                                  e,
                                  style: GoogleFonts.tajawal(),
                                ),
                                value: e,
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 18),
                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.location_on_rounded),
                      label: Text(
                        'العنوان',
                        style: GoogleFonts.tajawal(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      hintText: (' الحي - الشارع - اسم البناية ورقم الشقة'),
                      alignLabelWithHint: false,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  Text(
                    'حدد الموقع على الخريطة :',
                    style: GoogleFonts.tajawal(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    width: double.infinity,
                    height: 170,
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: Text('خريطة'),
                  ),
                  SizedBox(height: 22),
                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.monetization_on_sharp),
                      label: Text('الاجار الشهري'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    'مدة العقد',
                    style: GoogleFonts.tajawal(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  DropdownButton(
                    alignment: Alignment.centerRight,
                    value: selected_timeframe,
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Icon(Icons.arrow_drop_down_outlined),
                    ),
                    onChanged: (e) => setState(() {
                      selected_timeframe = e.toString();
                    }),
                    items: rental_timeframe
                        .map((e) => DropdownMenuItem(
                              child: Text(
                                e,
                                style: GoogleFonts.tajawal(),
                              ),
                              value: e,
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    'نوع الإعلان',
                    style: GoogleFonts.tajawal(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTypeOfAd = 1;
                          });
                        },
                        child: Container(
                          width: 170,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(width: 3, color: Colors.blue),
                              color: selectedTypeOfAd == 1
                                  ? Colors.lightBlueAccent
                                  : Colors.transparent),
                          alignment: Alignment.center,
                          child: Text(
                            'خاص',
                            style: GoogleFonts.tajawal(
                              fontSize: 18,
                              color: selectedTypeOfAd == 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTypeOfAd = 2;
                          });
                        },
                        child: Container(
                          width: 170,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(width: 3, color: Colors.blue),
                              color: selectedTypeOfAd == 2
                                  ? Colors.lightBlueAccent
                                  : Colors.transparent),
                          alignment: Alignment.center,
                          child: Text(
                            'عام',
                            style: GoogleFonts.tajawal(
                              fontSize: 18,
                              color: selectedTypeOfAd == 2
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'الخاص : سيتم عرض طلب التأجير على المنصة وسيتم قبول أي طلب استأجار وعرض وسائل الاتصال الخاصة بالمؤجر \n\n الخاص :سيتم عرض طلب التأجير على المنصة واخفاء وسائل الاتصال الخاصة بالمؤجر وعرضها عندا يقبل المؤجر طلب الاستأجار فقط.',
                    style: GoogleFonts.tajawal(fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'نوع العقار السكني',
                    style: GoogleFonts.tajawal(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  DropdownButton(
                    alignment: Alignment.centerRight,
                    value: selectedTypeOfRealEstate,
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Icon(Icons.arrow_drop_down_outlined),
                    ),
                    onChanged: (e) => setState(() {
                      selectedTypeOfRealEstate = e.toString();
                    }),
                    items: typeOfRealEstae
                        .map((e) => DropdownMenuItem(
                              child: Text(
                                e,
                                style: GoogleFonts.tajawal(),
                              ),
                              value: e,
                            ))
                        .toList(),
                  ),
                  Text('عدد الغرف'),
                  ToggleButtons(
                    children: numOfRooms.map((e) => Text(e)).toList(),
                    isSelected: selectedRooms,
                    onPressed: (x) {
                      setState(() {
                        selectedRooms.fillRange(0, selectedRooms.length, false);
                        selectedRooms[x] = true;
                      });
                    },
                  ),
                  Text('عدد الحمامات'),
                  ToggleButtons(
                    children: numOfBathrooms.map((e) => Text(e)).toList(),
                    isSelected: selectedBathrooms,
                    onPressed: (x) {
                      setState(() {
                        selectedBathrooms.fillRange(
                            0, selectedBathrooms.length, false);
                        selectedBathrooms[x] = true;
                      });
                    },
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(
                        'المساحة بالمتر المربع',
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('وصف تفصيلي'),
                  TextField(
                    minLines: 4,
                    maxLines: 6,
                    maxLength: 200,
                    decoration: InputDecoration(
                        hintText: 'اوصف العقار في جدود 200 حرف'),
                  ),
                  SizedBox(height: 15),
                  Text('المزايا'),
                  CheckboxListTile(
                    secondary: Icon(Icons.ac_unit),
                    value: hasAC,
                    onChanged: (x) {
                      setState(() {
                        hasAC = x!;
                      });
                    },
                    title: Text('مكيفة'),
                  ),
                  CheckboxListTile(
                    secondary: Icon(Icons.home_work_sharp),
                    value: nearMosque,
                    onChanged: (x) => setState(() => nearMosque = x!),
                    title: Text('قريبة من مسجد'),
                  ),
                  CheckboxListTile(
                    secondary: Icon(Icons.store_mall_directory_outlined),
                    value: nearSuperMarket,
                    onChanged: (x) => setState(() => nearSuperMarket = x!),
                    title: Text('قريبة من سوبرماركت'),
                  ),
                  CheckboxListTile(
                    secondary: Icon(Icons.elevator),
                    value: hasElevator,
                    onChanged: (x) => setState(() => hasElevator = x!),
                    title: Text('مصعد'),
                  ),
                  CheckboxListTile(
                    secondary: Icon(Icons.garage),
                    value: hasGarage,
                    onChanged: (x) => setState(() => hasGarage = x!),
                    title: Text('جراج'),
                  ),
                  CheckboxListTile(
                    secondary: Icon(Icons.balcony),
                    value: hasBalcony,
                    onChanged: (x) => setState(() => hasBalcony = x!),
                    title: Text('بلكونة'),
                  ),
                  Text('قم بإدراج الصور'),
                  GestureDetector(
                    onTap: () {
                      /// implement upload picture
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload,
                            size: 100,
                            color: Colors.black,
                          ),
                          Text(
                            'اختر صور من الاستوديو',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'ملاحظة : أول صورة سوف تكون صورة الغلاف',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal[50],
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6.0,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      /// implement post ad
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'أعلن عن العقار !',
                        style: GoogleFonts.tajawal(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
