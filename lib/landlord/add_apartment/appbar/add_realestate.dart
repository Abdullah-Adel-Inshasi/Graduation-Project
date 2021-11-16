// ignore_for_file: unnecessary_statements
//
// import 'dart:ui';
// import 'dart:io';

import 'dart:io';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/landlord/wrapper.dart';
import 'package:home_explorer/models/apartment.dart';
import 'package:home_explorer/models/user.dart';
import 'package:home_explorer/pick_provider.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:collection';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../size_config.dart';

class AddRealEstate extends StatefulWidget {
  final User? user;

  AddRealEstate({required this.user});

  @override
  _AddRealEstateState createState() => _AddRealEstateState();
}

class _AddRealEstateState extends State<AddRealEstate> {
  List<String> cities = [
    'غزة',
    'رفح',
    'خانيونس',
    'النصيرات',
    'الزوايدة',
    'تل الهوا',
    'جباليا'
  ];

  // ignore: non_constant_identifier_names
  List<String> rental_timeframe = [
    'شهر',
    'قصير المدى (2 - 5 أشهر)',
    'طويل المدى (6+ أشهر)'
  ];
  List<String> typeOfRealEstate = [
    'منزل',
    'متجر',
    'مساحة عمل',
  ];

  // ignore: non_constant_identifier_names
  late String selected_city;

  // ignore: non_constant_identifier_names
  late String selected_timeframe;

  late String selectedTypeOfRealEstate;
  late TextEditingController address;

  late TextEditingController price;
  File? file;

  TextEditingController home_des = TextEditingController();
  TextEditingController store_des = TextEditingController();
  TextEditingController works_des = TextEditingController();
  int currentStep = 0;
  List<Widget> detailsStep = [
    HouseDetails(),
    StoreDetails(),
    WorkspaceDetails(),
  ];


  // late File _image;
  // final ImagePicker _picker = ImagePicker();
  // Future getImage() async {
  //   var pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     _image = File(pickedFile.path);
  //   });
  // }
  void add(){
    if (selectedTypeOfRealEstate == 'منزل') {
      home.add(Home(
          numOfBathroom:2,
          numOfRoom: 4,
          direction: 'جنوبي شرقي',
          numOfHalls: 2,
          floor: 6,
          typeOfHome: HomeType.house,
          user: landLord[landLord.length - 1],
          downpayment: 300,
          apartmentNumber: 23,
          monthlyRent: 250,
          name: 'no.1',
          address: address1,
          size: 170,
          imgUrl: ['assets/images/myImage.jpg'],
          coverImg: 'assets/images/myImage.jpg',
          aboutEstate: "شقة سكنية في عمارة بيروت 3",
          beginObservation: startDate1,
          endObservation: EndDate1,
          isAvailable: true,
          hasFurnature: HouseDetails().hasFurnature,
          hasAC: HouseDetails().hasAC,
          hasElevator: HouseDetails().hasElevator,
          closeFromSchool: HouseDetails().closeFromSchool,
          closeFromMosque: HouseDetails().closeFromMosque,
          hasGarage: HouseDetails().hasGarage,
          isPrivat: false));
    } else if (selectedTypeOfRealEstate == 'متجر') {
      store.add(Store(
          stockRoomSize: 100,
          user: landLord[0],
          downpayment: 200,
          finishingStatus: "سوبر لوكس",
          exhibitionRating: "معرض مجمع",
          monthlyRent: 180,
          name: "no.1",
          address: address2,
          size: 150,
          imgUrl: ['assets/images/house3.jpg'],
          coverImg: 'assets/images/house3.jpg',
          aboutEstate: "الوصف...",
          beginObservation: startDate1,
          endObservation: EndDate1,
          isAvailable: true,
          hasAc: true,
          isPrivat: false,
          publicStreet: true));
    } else {
      workSpace.add(WorkSpace(
          user: landLord[0],
          downpayment: 200,
          monthlyRent: 180,
          name: "no.1",
          address: address2,
          size: 150,
          imgUrl: ['assets/images/house3.jpg'],
          coverImg: 'assets/images/house3.jpg',
          aboutEstate: "الوصف...",
          beginObservation: startDate1,
          endObservation: EndDate1,
          isAvailable: true,
          isPrivat: false,
          publicStreet: true,
          numOfDesks: 1,
          internetStatus: 'نت قوي',
          hasPowerCable: true,
          hasAC: false));
    }
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => LandLordWrapper(user: widget.user,)), (route) => false);
  }


  @override
  void initState() {
    selected_city = cities[0];
    selected_timeframe = rental_timeframe[0];
    selectedTypeOfRealEstate = typeOfRealEstate[0];
    address = TextEditingController();
    price = TextEditingController();
    super.initState();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'تم إرسال طلبك',
            textDirection: TextDirection.rtl,
          ),
          content: Text(
              'سيتم مراجعة طلبك و التأكد أنه يتوافق مع المتطلبات '
              'سيتم إشعارك بحالة الطلب ',
              textDirection: TextDirection.rtl),
          actions: <Widget>[
            TextButton(
              child: const Text('العودة الى الصفحة الرئيسية'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => LandLordWrapper(user: widget.user,)), (route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<PicProvider>(
      builder: (context,provider,x){
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xFFF6F6F6),
          appBar: AppBar(
            backgroundColor: Color(0xFF14688C),
            title: Text('أضف عقار',
                style: GoogleFonts.tajawal(
                    color: Colors.white, fontWeight: FontWeight.w600)),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Theme(
                  data: ThemeData(
                      colorScheme: ColorScheme.light(
                        primary: Color(0xFF14688C),
                      )),
                  child: Stepper(
                    physics: ClampingScrollPhysics(),
                    type: StepperType.vertical,
                    currentStep: currentStep,
                    onStepTapped: (x) {},
                    onStepCancel: () {
                      currentStep == 0 ? null : setState(() => currentStep--);
                    },
                    onStepContinue: () {
                      currentStep < 5 ? setState(() => currentStep++) : add();
                    },
                    steps: [
                      Step(
                        state: currentStep > 0
                            ? StepState.complete
                            : StepState.indexed,
                        isActive: currentStep > 0,
                        title: Text('اختر نوع العقار',
                            style: GoogleFonts.tajawal(
                                color: Colors.black, fontWeight: FontWeight.w600)),
                        content: Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: DropdownButton(
                            alignment: Alignment.centerRight,
                            elevation: 4,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(15),
                            value: selectedTypeOfRealEstate,
                            icon: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Icon(Icons.arrow_drop_down_outlined),
                            ),
                            onChanged: (e) => setState(() {
                              selectedTypeOfRealEstate = e.toString();
                            }),
                            items: typeOfRealEstate
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
                      ),
                      Step(
                        state: currentStep > 1
                            ? StepState.complete
                            : StepState.indexed,
                        isActive: currentStep > 1,
                        title: Text('الموقع',
                            style: GoogleFonts.tajawal(
                                color: Colors.black, fontWeight: FontWeight.w600)),
                        content: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: DropdownButton(
                                alignment: Alignment.centerRight,
                                elevation: 4,
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(15),
                                value: selected_city,
                                icon: Icon(Icons.arrow_drop_down_outlined),
                                onChanged: (e) => setState(() {
                                  selected_city = e.toString();
                                }),
                                items: cities
                                    .map((e) => DropdownMenuItem(
                                  child: Text(
                                    e,
                                    style: GoogleFonts.tajawal(),
                                    textAlign: TextAlign.center,
                                  ),
                                  value: e,
                                ))
                                    .toList(),
                              ),
                            ),
                            SizedBox(height: 18),
                            TextField(
                              controller: address,
                              decoration: InputDecoration(
                                icon: Icon(Icons.location_on_rounded),
                                label: Text(
                                  'عنوان تفصيلي',
                                  style: GoogleFonts.tajawal(
                                      fontSize: 14, fontWeight: FontWeight.w600),
                                ),
                                hintText:
                                (' الحي - الشارع - اسم البناية ورقم الشقة'),
                                alignLabelWithHint: false,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              alignment: Alignment.center,
                              child: LandlordMap(),
                            ),
                          ],
                        ),
                      ),
                      Step(
                        state: currentStep > 2
                            ? StepState.complete
                            : StepState.indexed,
                        isActive: currentStep > 2,
                        title: Text('تفاصيل إضافية',
                            style: GoogleFonts.tajawal(
                                color: Colors.black, fontWeight: FontWeight.w600)),
                        content: detailsStep[typeOfRealEstate
                            .indexOf(selectedTypeOfRealEstate.toString())],
                      ),
                      Step(
                        state: currentStep > 3
                            ? StepState.complete
                            : StepState.indexed,
                        isActive: currentStep > 3,
                        title: Text(
                          'السعر و مدة الإجار',
                          style: GoogleFonts.tajawal(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'السعر',
                              style: GoogleFonts.tajawal(
                                  color: Colors.black, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 120,
                              height: 50,
                              child: TextField(
                                controller: price,
                                keyboardType: TextInputType.number,
                                maxLength: 4,
                                style: GoogleFonts.tajawal(
                                    fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    suffixText: 'شيكل',
                                    contentPadding:
                                    EdgeInsets.fromLTRB(5, 0, 5, 0)),
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              ' مدة الإجار',
                              style: GoogleFonts.tajawal(
                                  color: Colors.black, fontWeight: FontWeight.w600),
                            ),
                            DropdownButton(
                              alignment: Alignment.centerRight,
                              elevation: 4,
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(15),
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
                          ],
                        ),
                      ),
                      Step(
                          state: currentStep > 4
                              ? StepState.complete
                              : StepState.indexed,
                          isActive: currentStep > 4,
                          title: Text(
                            'ساعات الزيارة',
                            style: GoogleFonts.tajawal(
                                color: Colors.black, fontWeight: FontWeight.w600),
                          ),
                          content: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('من',
                                    style: GoogleFonts.tajawal(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                                DateTimePicker(
                                  type: DateTimePickerType.dateTimeSeparate,
                                  dateMask: 'd MMM, yyyy',
                                  initialValue: DateTime.now().toString(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  icon: Icon(Icons.event),
                                  dateLabelText: 'يوم',
                                  timeLabelText: "ساعة",
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
                                ),
                                Text('الى',
                                    style: GoogleFonts.tajawal(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                                DateTimePicker(
                                  type: DateTimePickerType.dateTimeSeparate,
                                  dateMask: 'd MMM, yyyy',
                                  initialValue: DateTime.now().toString(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  icon: Icon(Icons.event),
                                  dateLabelText: 'يوم',
                                  timeLabelText: "ساعة",
                                  selectableDayPredicate: (date) {
                                    if (date.weekday == 5) {
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
                                ),
                              ],
                            ),
                          )),
                      Step(
                        state: currentStep > 5
                            ? StepState.complete
                            : StepState.indexed,
                        isActive: currentStep > 5,
                        title: Text(
                          'رفع الصور',
                          style: GoogleFonts.tajawal(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        content: GestureDetector(
                          onTap: () async {

                            setState(() {
                              provider.selectFile();
                              throw('e');
                            });},
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
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25),
                //   child: GestureDetector(
                //     onTap: () {
                //
                //     },
                //     child: Container(
                //       alignment: Alignment.center,
                //       height: SizeConfig.scaleHeight(50),
                //       width: double.infinity,
                //       clipBehavior: Clip.antiAlias,
                //       decoration: BoxDecoration(
                //         color: Color(0xff14688C),
                //         shape: BoxShape.rectangle,
                //         borderRadius:
                //         BorderRadius.circular(SizeConfig.scaleHeight(10)),
                //       ),
                //       child: Text('إضافة',
                //           style: TextStyle(
                //               fontSize: SizeConfig.scaleTextFont(18),
                //               color: Color(0xffF6F6F6))),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        );
      },

    );
  }


  // selectFile() async {
  //   Directory directory = await getApplicationDocumentsDirectory();
  //
  //   XFile? imageFile =
  //   await ImagePicker().pickImage(source: ImageSource.gallery);
  //   this.file = File(imageFile!.path);
  // }
  // void getImage(ImageSource imageSource) async {
  //   XFile? imageFile =
  //   await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (imageFile == null) return;
  //   File tmpFile = File(imageFile.path);
  //   final appDir = await getApplicationDocumentsDirectory();
  //   final fileName = basename(imageFile.path);
  //   tmpFile = await tmpFile.copy('${appDir.path}/$fileName');
  //   setState(() {
  //     _image = tmpFile;
  //
  //   });
  // }


  void checkData() {
    switch (currentStep) {
      case 0:
        setState(() {
          currentStep++;
        });
        break;
      case 1:
        if (address.text.isNotEmpty) {
          setState(() {
            currentStep++;
          });
        } else {
          print("ادخل الموقع");
        }
        break;
      case 2:
        setState(() {
          currentStep++;
        });
        break;
      case 3:
        if (price.text.isNotEmpty) {
          setState(() {
            currentStep++;
          });
        } else {
          print("ادخل الموقع");
        }
        break;
      case 4:
        setState(() {
          currentStep++;
        });
        break;
      defulte:
        if (selectedTypeOfRealEstate == 'منزل') {
          home.add(Home(
              numOfBathroom:3,
              numOfRoom: 5,
              direction: 'جنوبي شرقي',
              numOfHalls: 2,
              floor:3,
              typeOfHome: HomeType.house,
              user: landLord[landLord.length-1],
              downpayment: 300,
              apartmentNumber: 23,
              monthlyRent: 250,
              name: 'no.1',
              address: address3,
              size: 170,
              imgUrl: ['assets/images/myImage.jpg'],
              coverImg: 'assets/images/myImage.jpg',
              aboutEstate: HouseDetails().description.text,
              beginObservation: startDate1,
              endObservation: EndDate1,
              isAvailable: true,
              hasAC: true,
              hasElevator: true,
              closeFromMosque: true,
              isPrivat: true));
        } else if (selectedTypeOfRealEstate == 'متجر') {
          store.add(Store(
              stockRoomSize: 100,
              user: landLord[0],
              downpayment: 200,
              finishingStatus: "سوبر لوكس",
              exhibitionRating: "معرض مجمع",
              monthlyRent: 180,
              name: "no.1",
              address: address2,
              size: 150,
              imgUrl: ['assets/images/house3.jpg'],
              coverImg: 'assets/images/house3.jpg',
              aboutEstate: "الوصف...",
              beginObservation: startDate1,
              endObservation: EndDate1,
              isAvailable: true,
              hasAc: true,
              isPrivat: false,
              publicStreet: true));
        } else {
          workSpace.add(WorkSpace(
              user: landLord[0],
              downpayment: 200,
              monthlyRent: 180,
              name: "no.1",
              address: address2,
              size: 150,
              imgUrl: ['assets/images/house3.jpg'],
              coverImg: 'assets/images/house3.jpg',
              aboutEstate: "الوصف...",
              beginObservation: startDate1,
              endObservation: EndDate1,
              isAvailable: true,
              isPrivat: false,
              publicStreet: true,
              numOfDesks: 1,
              internetStatus: 'نت قوي',
              hasPowerCable: true,
              hasAC: false));
        }
        _showMyDialog();
        break;
    }
  }
}

class StoreDetails extends StatefulWidget {
  bool hasAC = false;
  bool hasPowerCable = false;
  bool publicStreet = false;
  late String selectedTypeOfStore;
  late TextEditingController description;

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  List<String> typesOfStore = ['معرض', 'مخزن', 'حاصل'];

  @override
  void initState() {
    widget.selectedTypeOfStore = typesOfStore[0];
    widget.description = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نوع المتجر',
          style: GoogleFonts.tajawal(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 6),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: DropdownButton(
            alignment: Alignment.centerRight,
            elevation: 4,
            isExpanded: true,
            borderRadius: BorderRadius.circular(15),
            value: widget.selectedTypeOfStore,
            icon: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Icon(Icons.arrow_drop_down_outlined),
            ),
            onChanged: (e) => setState(() {
              widget.selectedTypeOfStore = e.toString();
            }),
            items: typesOfStore
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
        SizedBox(height: 16),
        Text(
          'وصف العقار',
          style: GoogleFonts.tajawal(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        TextField(
          controller: widget.description,
          minLines: 4,
          maxLines: 6,
          maxLength: 200,
          style: GoogleFonts.tajawal(fontSize: 16, color: Colors.black),
          decoration: InputDecoration(
            labelText: 'اوصف العقار في حدود 200 حرف',
            alignLabelWithHint: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        SizedBox(height: 15),
        Chips(
          choices: [
            Choice(
                label: 'شارع عام',
                iconData: Icons.add_road,
                onTap: () {
                  setState(() {
                    widget.publicStreet = !widget.publicStreet;
                  });
                }),
            Choice(
                label: 'خط ماتور',
                iconData: Icons.power,
                onTap: () {
                  setState(() {
                    widget.hasPowerCable = !widget.hasPowerCable;
                  });
                }),
            Choice(
                label: 'تكييف',
                iconData: Icons.power,
                onTap: () {
                  setState(() {
                    widget.hasAC = !widget.hasAC;
                  });
                }),
          ],
        )
      ],
    );
  }
}

class WorkspaceDetails extends StatelessWidget {
  bool hasAC = false;
  bool hasPowerCable = false;
  bool publicStreet = false;
  late TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          'وصف العقار',
          style: GoogleFonts.tajawal(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        TextField(
          controller: description,
          minLines: 4,
          maxLines: 6,
          maxLength: 200,
          style: GoogleFonts.tajawal(fontSize: 16, color: Colors.black),
          decoration: InputDecoration(
            labelText: 'اوصف العقار في حدود 200 حرف',
            alignLabelWithHint: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        SizedBox(height: 15),
        Chips(
          choices: [
            Choice(
              label: 'فتى خدمات',
              iconData: Icons.local_drink,
            ),
            Choice(
              label: 'مكيف',
              iconData: Icons.ac_unit,
            ),
            Choice(
              label: 'هدوء',
              iconData: Icons.mode_edit_sharp,
            ),
            Choice(
              label: 'خط ماتور',
              iconData: Icons.power,
            ),
          ],
        )
      ],
    );
  }
}

class HouseDetails extends StatefulWidget {
  late String selectedTypeOfHome;
  int numOfRooms = 1;
  int numOfBathrooms = 1;
  int numOfHalls = 1;
  int floor = 1;
  bool hasElevator = false;
  bool hasFurnature = false;
  bool hasAC = false;
  bool hasGarage = false;
  bool closeFromMosque = false;
  bool closeFromSchool = false;
  List<String> typesOfHome = ['شقة', 'منزل', 'روف'];
  late TextEditingController description;

  List<String> directions = [
    'شمالي',
    'جنوبي',
    'شرقي',
    'غربي',
    'شمالي غربي',
    'شمالي شرقي',
    'جنوبي شرقي',
    'جنوبي غربي'
  ];

  late String selectedTimeFrame;
  late String selectedDirection;

  @override
  State<HouseDetails> createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
  @override
  void initState() {
    widget.selectedTypeOfHome = widget.typesOfHome[0];
    widget.selectedDirection = widget.directions[0];
    widget.description = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نوع البيت',
          style: GoogleFonts.tajawal(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 6),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: DropdownButton(
            alignment: Alignment.centerRight,
            elevation: 4,
            isExpanded: true,
            borderRadius: BorderRadius.circular(15),
            value: widget.selectedTypeOfHome,
            icon: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Icon(Icons.arrow_drop_down_outlined),
            ),
            onChanged: (e) => setState(() {
              widget.selectedTypeOfHome = e.toString();
            }),
            items: widget.typesOfHome
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
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 6.0,
                  spreadRadius: 3,
                ),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Text(
                'عدد الغرف',
                style: GoogleFonts.tajawal(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      widget.numOfRooms > 0
                          ? setState(() {
                              widget.numOfRooms--;
                            })
                          : null;
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 20,
                      )),
                    ),
                  ),
                  Text(
                    widget.numOfRooms.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.numOfRooms++;
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      )),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 6.0,
                  spreadRadius: 3,
                ),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Text(
                'عدد الحمامات',
                style: GoogleFonts.tajawal(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      widget.numOfBathrooms > 0
                          ? setState(() {
                              widget.numOfBathrooms--;
                            })
                          : null;
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 20,
                      )),
                    ),
                  ),
                  Text(
                    widget.numOfBathrooms.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.numOfBathrooms++;
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      )),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 6.0,
                  spreadRadius: 3,
                ),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Text(
                'عدد الصالات',
                style: GoogleFonts.tajawal(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      widget.numOfHalls > 0
                          ? setState(() {
                              widget.numOfHalls--;
                            })
                          : null;
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 20,
                      )),
                    ),
                  ),
                  Text(
                    widget.numOfHalls.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.numOfHalls++;
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      )),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 6.0,
                  spreadRadius: 3,
                ),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Text(
                'الطابق',
                style: GoogleFonts.tajawal(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      widget.floor > 0
                          ? setState(() {
                              widget.floor--;
                            })
                          : null;
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 20,
                      )),
                    ),
                  ),
                  Text(
                    widget.floor.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.floor++;
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      )),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Text(
          'المساحة بالمتر المربع',
          style: GoogleFonts.tajawal(fontSize: 18, color: Colors.black),
        ),
        SizedBox(
          width: 60,
          height: 50,
          child: TextField(
            keyboardType: TextInputType.number,
            maxLength: 3,
            style: GoogleFonts.tajawal(fontSize: 18, color: Colors.black),
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                suffixText: 'م',
                contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'وصف العقار',
          style: GoogleFonts.tajawal(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        TextField(
          controller: widget.description,
          minLines: 4,
          maxLines: 6,
          maxLength: 200,
          style: GoogleFonts.tajawal(fontSize: 16, color: Colors.black),
          decoration: InputDecoration(
            labelText: 'اوصف العقار في حدود 200 حرف',
            alignLabelWithHint: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        SizedBox(height: 15),
        Text(
          'الإتجاه',
          style: GoogleFonts.tajawal(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        DropdownButton(
          alignment: Alignment.centerRight,
          elevation: 4,
          isExpanded: true,
          borderRadius: BorderRadius.circular(15),
          value: widget.selectedDirection,
          icon: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(Icons.arrow_drop_down_outlined),
          ),
          onChanged: (e) => setState(() {
            widget.selectedDirection = e.toString();
          }),
          items: widget.directions
              .map((e) => DropdownMenuItem(
                    child: Text(
                      e,
                      style: GoogleFonts.tajawal(),
                    ),
                    value: e,
                  ))
              .toList(),
        ),
        SizedBox(height: 12),
        Text(
          'المزايا',
          style: GoogleFonts.tajawal(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        Chips(
          choices: [
            Choice(
                label: 'مصعد',
                iconData: Icons.elevator,
                onTap: () {
                  setState(() {
                    widget.hasElevator = !widget.hasElevator;
                  });
                }),
            Choice(
                label: 'جراج',
                iconData: Icons.garage,
                onTap: () {
                  setState(() {
                    widget.hasGarage = !widget.hasGarage;
                  });
                }),
            Choice(
                label: 'قريب من مسجد',
                iconData: Icons.home_work,
                onTap: () {
                  setState(() {
                    widget.closeFromMosque = !widget.closeFromMosque;
                  });
                }),
            Choice(
                label: 'قريب من مدرسة',
                iconData: Icons.school,
                onTap: () {
                  setState(() {
                    widget.closeFromSchool = !widget.closeFromSchool;
                  });
                }),
            Choice(
                label: 'خط ماتور',
                iconData: Icons.power,
                onTap: () {
                  setState(() {
                    widget.hasAC = !widget.hasElevator;
                  });
                }),
            Choice(
                label: 'معفشة',
                iconData: Icons.elevator,
                onTap: () {
                  setState(() {
                    widget.hasFurnature = !widget.hasFurnature;
                  });
                })
          ],
        ),
      ],
    );
  }
}

class Choice {
  final String label;
  final IconData iconData;
  Function? onTap = () {};

  Choice({required this.label, required this.iconData, this.onTap});
}

class Chips extends StatelessWidget {
  const Chips({
    Key? key,
    required this.choices,
  }) : super(key: key);

  final List<Choice> choices;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Wrap(
        spacing: 8,
        children: choices
            .map(
              (e) => CustomChoice(label: e.label, iconData: e.iconData),
            )
            .toList(),
      ),
    );
  }
}

class CustomChoice extends StatefulWidget {
  final String label;
  final IconData iconData;

  // ignore: use_key_in_widget_constructors
  const CustomChoice({required this.label, required this.iconData});

  @override
  State<CustomChoice> createState() => _CustomChoiceState();
}

class _CustomChoiceState extends State<CustomChoice> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected ^= true;
        });
      },
      child: Chip(
        label: Text(
          widget.label,
          style: GoogleFonts.tajawal(
              color: isSelected ? Colors.white : Colors.black),
        ),
        backgroundColor:
            isSelected ? Color(0xFF14688C).withOpacity(0.5) : Colors.black12,
        avatar: Icon(widget.iconData),
      ),
    );
  }
}

class LandlordMap extends StatefulWidget {
  @override
  State<LandlordMap> createState() => _LandlordMapState();
}

class _LandlordMapState extends State<LandlordMap> {
  var myMarkers = HashSet<Marker>();
  late Position currentPosition;
  late GoogleMapController newGoogleMapController;
  Completer<GoogleMapController> _controllerGoogleMap = Completer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controllerGoogleMap.complete(controller);
          newGoogleMapController = controller;
        },
        onTap: (locatePosition){

        },
        markers: myMarkers,
      ),
    );
  }
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.466154, 34.423684),
    zoom: 10.4746,
  );

  locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: geolocator.LocationAccuracy.high);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
    new CameraPosition(target: latLngPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    return latLngPosition;
  }
}
