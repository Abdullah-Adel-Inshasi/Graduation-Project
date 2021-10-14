import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/landlord/my_apartments/private_apartments.dart';
import 'public_apartments.dart';
class MyApartments extends StatefulWidget {
  const MyApartments({Key? key}) : super(key: key);

  @override
  State<MyApartments> createState() => _MyApartmentsState();
}

class _MyApartmentsState extends State<MyApartments>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<Widget> tabScreens = [PrivateApartments(), PublicApartments()];
  int selected_index = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: TabBar(

            controller: tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'طلبات خاصة'),
              Tab(text: 'طلبات عامة'),
            ],
            onTap: (int index) {
              setState(() {
                selected_index = index;
              });
            },
          ),
          title: Text(
            'عقاراتي',
            style: GoogleFonts.tajawal(
                color: Colors.black, fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.menu), onPressed: () {}, color: Colors.black),
          ],
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {},
              color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: tabScreens[selected_index]);
  }
}
