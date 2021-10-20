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
  String address = '';
  late TextEditingController addressTEC ;
  @override
  void initState() {
    addressTEC = TextEditingController(text: address);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text('Apartment Name'),
            backgroundColor: Colors.teal,
            leading: BackButton(),
            actions: [
              Switch(value: canEdit, onChanged: (x)=>setState(() {
                canEdit = x;
              })),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 260,
              width: double.infinity,
              child: PageView(
                physics: BouncingScrollPhysics(),
                children: [
                  Image.asset(
                    'assets/images/fancyhouse.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/fancyhouse.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/fancyhouse.jpg',
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: SliverToBoxAdapter(
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
                   canEdit ? Text(''):SizedBox(height :5),
                    TextField(
                      textDirection: TextDirection.rtl,
                      controller: addressTEC,
                      onChanged: (newAddress)=>setState(()=> address = newAddress),
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
                    canEdit ? Text(''):SizedBox(height :5),
                    Row(
                      children: [
                        Icon(Icons.vpn_key),
                        SizedBox(width: 5),
                        Text(
                          'الحالة',
                          style: GoogleFonts.tajawal(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      'مؤجرة - 200\$ شهرياً',
                      style: GoogleFonts.tajawal(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.date_range),
                        SizedBox(width: 5),
                        Text(
                          'تاريخ استلام الايجار',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.tajawal(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      'ما بين 1 - 6 الشهر',
                      style: GoogleFonts.tajawal(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
