// ignore_for_file: unnecessary_statements

import 'dart:ui';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRealEstate extends StatefulWidget {
  const AddRealEstate({Key? key}) : super(key: key);

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

  int selectedTypeOfAd = 1;
  late String selectedTypeOfRealEstate;

  int currentStep = 0;
  List<Widget> detailsStep = [
    HouseDetails(),
    StoreDetails(),
    WorkspaceDetails(),
  ];

  @override
  void initState() {
    selected_city = cities[0];
    selected_timeframe = rental_timeframe[0];
    selectedTypeOfRealEstate = typeOfRealEstate[0];
    super.initState();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('تم إرسال طلبك'),
                Text('سيتم مراجعة طلبك و التأكد أنه يتوافق مع المتطلبات '
                    'سيتم إشعارك بحالة الطلب '),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('الرجوع'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: Theme(
        data: ThemeData(
            colorScheme: ColorScheme.light(
                primary: Color(0xFF14688C),
            )
        ),
        child: Stepper(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          type: StepperType.vertical,
          currentStep: currentStep,
          onStepTapped: (x) {
            setState(() => currentStep = x);
          },
          onStepCancel: () {
            currentStep == 0 ? null : setState(() => currentStep--);
          },
          onStepContinue: () {
            currentStep < 5 ? setState(() => currentStep++) : _showMyDialog();
          },
          steps: [
            Step(
              state: currentStep > 0 ? StepState.complete : StepState.indexed,
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
              state: currentStep > 1 ? StepState.complete : StepState.indexed,
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
                    decoration: InputDecoration(
                      icon: Icon(Icons.location_on_rounded),
                      label: Text(
                        'عنوان تفصيلي',
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
                  SizedBox(height: 15),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/map.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 170,
                      alignment: Alignment(0, 0.5),
                    ),
                  ),
                ],
              ),
            ),
            Step(
              state: currentStep > 2 ? StepState.complete : StepState.indexed,
              isActive: currentStep > 2,
              title: Text('تفاصيل إضافية',
                  style: GoogleFonts.tajawal(
                      color: Colors.black, fontWeight: FontWeight.w600)),
              content:
                  detailsStep[typeOfRealEstate.indexOf(selectedTypeOfRealEstate)],
            ),
            Step(
              state: currentStep > 3 ? StepState.complete : StepState.indexed,
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
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      style:
                          GoogleFonts.tajawal(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          suffixText: 'شيكل',
                          contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
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
                state: currentStep > 4 ? StepState.complete : StepState.indexed,
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
                              color: Colors.black, fontWeight: FontWeight.w600)),
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
                              color: Colors.black, fontWeight: FontWeight.w600)),
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
              state: currentStep > 5 ? StepState.complete : StepState.indexed,
              isActive: currentStep > 5,
              title: Text(
                'رفع الصور',
                style: GoogleFonts.tajawal(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              content: GestureDetector(
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
            ),
          ],
        ),
      ),
    );
  }
}

class StoreDetails extends StatefulWidget {
  const StoreDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  List<String> typesOfStore = ['معرض', 'مخزن', 'حاصل'];

  late String selectedTypeOfStore;

  @override
  void initState() {
    selectedTypeOfStore = typesOfStore[0];
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
            value: selectedTypeOfStore,
            icon: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Icon(Icons.arrow_drop_down_outlined),
            ),
            onChanged: (e) => setState(() {
              selectedTypeOfStore = e.toString();
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
            ),
            Choice(
              label: 'مهيئ',
              iconData: Icons.snowshoeing_sharp,
            ),
            Choice(
              label: 'شارع حيوي',
              iconData: Icons.people,
            ),
            Choice(
              label: 'خط ماتور',
              iconData: Icons.power,
            ),
            Choice(
              label: 'جيران مناح',
              iconData: Icons.fmd_good,
            )
          ],
        )
      ],
    );
  }
}

class WorkspaceDetails extends StatelessWidget {
  const WorkspaceDetails({
    Key? key,
  }) : super(key: key);

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
            Choice(
              label: 'جيران مناح',
              iconData: Icons.fmd_good,
            )
          ],
        )
      ],
    );
  }
}

class HouseDetails extends StatefulWidget {
  @override
  State<HouseDetails> createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
  List<String> typesOfHome = ['شقة', 'منزل', 'روف'];
  late String selectedTypeOfHome;
  int numOfRooms = 1;
  int numOfBathrooms = 1;
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
  void initState() {
    selectedTypeOfHome = typesOfHome[0];
    selectedDirection = directions[0];
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
            value: selectedTypeOfHome,
            icon: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Icon(Icons.arrow_drop_down_outlined),
            ),
            onChanged: (e) => setState(() {
              selectedTypeOfHome = e.toString();
            }),
            items: typesOfHome
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
                numOfRooms > 0
                    ? setState(() {
                        numOfRooms--;
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
              numOfRooms.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  numOfRooms++;
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
        SizedBox(height: 8),
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
                numOfBathrooms > 0
                    ? setState(() {
                        numOfBathrooms--;
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
              numOfBathrooms.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  numOfBathrooms++;
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
          value: selectedDirection,
          icon: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(Icons.arrow_drop_down_outlined),
          ),
          onChanged: (e) => setState(() {
            selectedDirection = e.toString();
          }),
          items: directions
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
            ),
            Choice(
              label: 'جراج',
              iconData: Icons.garage,
            ),
            Choice(
              label: 'قريب من مسجد',
              iconData: Icons.home_work,
            ),
            Choice(
              label: 'قريب من مدرسة',
              iconData: Icons.school,
            ),
            Choice(
              label: 'خط ماتور',
              iconData: Icons.power,
            ),
            Choice(
              label: 'مصعد',
              iconData: Icons.elevator,
            )
          ],
        ),
      ],
    );
  }
}

class Choice {
  final String label;
  final IconData iconData;

  Choice({required this.label, required this.iconData});
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
        label: Text(widget.label,style: GoogleFonts.tajawal(color: isSelected ? Colors.white:Colors.black),),
        backgroundColor: isSelected ?Color(0xFF14688C).withOpacity(0.5) : Colors.black12,
        avatar: Icon(widget.iconData),
      ),
    );
  }
}
