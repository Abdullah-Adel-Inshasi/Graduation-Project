import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/landlord/profile/Aqarati.dart';
import 'package:home_explorer/landlord/profile/settings.dart';

class HomeScreen_Landlord extends StatefulWidget {
  const HomeScreen_Landlord({Key? key}) : super(key: key);

  @override
  _HomeScreen_LandlordState createState() => _HomeScreen_LandlordState();
}

class _HomeScreen_LandlordState extends State<HomeScreen_Landlord>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int index = 0;
  List<Widget> tabScreens = [Aqarati(), LandLordSettings()];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text('Hi Ahmad'),
            backgroundColor: Colors.teal,
            forceElevated: true,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                SizedBox(height: 15),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/girl.jpg'),
                    radius: 30,
                  ),
                  title: Text('Ahmad Ahmad Ahmad '),
                  subtitle: Text('ahmaed@gmail.com'),
                ),
                SizedBox(height: 16),
                TabBar(
                  onTap: (int x) {
                    setState(() {
                      index = x;
                    });
                  },
                  controller: tabController,
                  labelStyle: GoogleFonts.tajawal(
                    fontSize: 16,
                  ),
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: 'عقاراتي (3)',
                    ),
                    Tab(
                      text: 'الاعدادات',
                    )
                  ],
                ),
                tabScreens[index],
              ],
            ),
          )
        ],
      ),
    );
  }
}
