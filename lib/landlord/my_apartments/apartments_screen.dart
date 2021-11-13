import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/landlord/my_apartments/private_apartments.dart';
import 'package:home_explorer/models/user.dart';
import 'public_apartments.dart';

class MyApartments extends StatefulWidget {
  final User? user;

  MyApartments({required this.user});

  @override
  State<MyApartments> createState() => _MyApartmentsState();
}

class _MyApartmentsState extends State<MyApartments>
    with SingleTickerProviderStateMixin {
  List<String> tab_names = ['طلبات خاصة', 'طلبات عامة'];
  int selected_index = 0;
  late TabController tabController;
  late List<Widget> tabScreens = [
    PrivateApartments(user: widget.user,),
    PublicApartments(user: widget.user,),
  ];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'العقارات',
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
        backgroundColor: Color(0xFF14688C),
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: [
            Tab(
              icon: Icon(
                Icons.public,
                size: 32,
              ),
              child: Text('عقارات عامة', style: GoogleFonts.tajawal()),
            ),
            Tab(
              icon: Icon(
                selected_index == 0 ? Icons.lock : Icons.lock_outlined,
                size: 32,
              ),
              child: Text('عقارات خاصة', style: GoogleFonts.tajawal()),
            ),
          ],
          onTap: (int tappedTab) => setState(
            () => selected_index = tappedTab,
          ),
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverToBoxAdapter(
            child: tabScreens[selected_index],
          )
        ],
      ),
    );
  }
}
