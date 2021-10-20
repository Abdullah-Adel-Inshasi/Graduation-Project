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
  List<String> tab_names = ['طلبات خاصة', 'طلبات عامة'];
  int selected_index = 0;
  late TabController tabController;
  List<Widget> tabScreens = [
    PrivateApartments(),
    PublicApartments(),
  ];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF4EDEA),

        appBar: AppBar(
          title: Text(
            'الطلبات',
            style: GoogleFonts.tajawal(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
          leading: GestureDetector(
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          backgroundColor: Colors.teal,
          bottom: TabBar(
            indicatorColor: Color(0xFF12263A),
            controller: tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Color(0xFFC5D8D1),
            tabs: [
              Tab(
                icon: Icon(
                  selected_index == 0 ? Icons.lock : Icons.lock_outlined,
                  size: 32,
                ),
                child: Text('طلبات عامة', style: GoogleFonts.tajawal()),
              ),
              Tab(
                icon: Icon(
                  Icons.public,
                  size: 32,
                ),
                child: Text('طلبات خاصة', style: GoogleFonts.tajawal()),
              ),
            ],
            onTap: (int tapped_tab) {
              setState(
                () => selected_index = tapped_tab,
              );
            },
          ),
        ),
        body: tabScreens[selected_index]);
  }
}
