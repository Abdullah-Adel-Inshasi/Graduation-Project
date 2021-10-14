import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApartments extends StatefulWidget {
  const MyApartments({Key? key}) : super(key: key);

  @override
  State<MyApartments> createState() => _MyApartmentsState();
}

class _MyApartmentsState extends State<MyApartments>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'طلبات خاصة'),
            Tab(text: 'طلبات عامة'),
          ],
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
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [ApartmentCard_Owner(), ApartmentCard_Owner()],
      ),
    );
  }
}

class ApartmentCard_Owner extends StatelessWidget {
  const ApartmentCard_Owner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    /// TODO : Add the apartment details
                    Text(': اسم الشقة',
                        style: GoogleFonts.tajawal(fontSize: 16)),
                    SizedBox(height: 8),
                    Text(': المستأجر الحالي',
                        style: GoogleFonts.tajawal(fontSize: 16)),
                    SizedBox(height: 8),
                    Text(': الحالة', style: GoogleFonts.tajawal(fontSize: 16)),
                    SizedBox(height: 8),
                    Text(": الاجار الشهري",
                        style: GoogleFonts.tajawal(fontSize: 16)),
                    SizedBox(height: 8),
                    Text(': عدد الطلبات',
                        style: GoogleFonts.tajawal(fontSize: 16)),
                  ],
                ),
                SizedBox(width: 15),
                Image.asset(
                  'assets/images/house1.jpg',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                PressableChip(label: 'حجب العقار عن المنصة'),
                PressableChip(label: 'الرسائل'),
                PressableChip(label: 'اختر مستأجر')
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PressableChip extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const PressableChip({Key? key, required this.label, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
