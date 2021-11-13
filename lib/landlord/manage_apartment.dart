import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/models/apartment.dart';

class ApartmentPage_Landlord extends StatefulWidget {
  const ApartmentPage_Landlord({Key? key, required this.home})
      : super(key: key);
  final Home home;

  @override
  State<ApartmentPage_Landlord> createState() => _ApartmentPage_LandlordState();
}

class _ApartmentPage_LandlordState extends State<ApartmentPage_Landlord> {
  bool canEdit = false;
  bool isRented = false;
  late TextEditingController addressTEC;
  late PageController _pageController;
  late TextEditingController titleTEC;
  late TextEditingController aboutTEC;
  late TextEditingController rentTEC;
  late String about;
  late String address;
  late String rent;
  late List<String> image;
  late String title;

  @override
  void initState() {
    about = widget.home.aboutEstate;
    address =
        '${widget.home.address.city} - ${widget.home.address.street} - ${widget.home.address.street}';
    title = widget.home.name;
    image = widget.home.imgUrl;
    rent = widget.home.monthlyRent.toString();
    addressTEC = TextEditingController(text: address);
    rentTEC = TextEditingController(text: rent.toString());
    titleTEC = TextEditingController(text: title);
    aboutTEC = TextEditingController(text: about);
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Text(title),
              backgroundColor: Color(0xFF14688C),
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
                      child: Image.asset(
                        image[0],
                        fit: BoxFit.cover,
                      ),
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
                    canEdit ? Text('') : SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.home),
                        SizedBox(width: 5),
                        Text(
                          'اسم الشقة',
                          style: GoogleFonts.tajawal(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    canEdit ? Text('') : SizedBox(height: 5),
                    TextField(
                      textDirection: TextDirection.rtl,
                      controller: titleTEC,
                      onChanged: (newTitle) => setState(() => title = newTitle),
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
                      children: [
                        Icon(Icons.text_snippet),
                        SizedBox(width: 5),
                        Text(
                          'وصف الشقة',
                          style: GoogleFonts.tajawal(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    canEdit ? Text('') : SizedBox(height: 5),
                    TextField(
                      textDirection: TextDirection.rtl,
                      controller: aboutTEC,
                      onChanged: (newAbout) => setState(() => about = newAbout),
                      enabled: canEdit,
                      maxLines: 5,
                      style: GoogleFonts.tajawal(
                          fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        disabledBorder: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    canEdit ? Text('') : SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 5),
                        Text(
                          'الإجار الشهري',
                          style: GoogleFonts.tajawal(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    canEdit ? Text('') : SizedBox(height: 5),
                    TextField(
                      textDirection: TextDirection.rtl,
                      controller: rentTEC,

                      onChanged: (newRent) => setState(() => rent = newRent),
                      enabled: canEdit,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.tajawal(
                          fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                        suffixText: '\$ \\ شهر',
                        contentPadding: EdgeInsets.only(right: 10),
                        disabledBorder: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    canEdit ? Text('') : SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.text_snippet),
                        SizedBox(width: 5),
                        Text(
                          'وصف الشقة',
                          style: GoogleFonts.tajawal(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
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
                    SizedBox(height: 20),
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
