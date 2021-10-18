import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_explorer/models/apartment.dart';
import 'package:home_explorer/screens/search_options_screen.dart';
import 'package:home_explorer/widgets/widgets.dart';
import 'apartment_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedView = 0;

  toggleView() {
    setState(() {
      selectedView == 0 ? selectedView = 1 : selectedView = 0;
    });
  }

  final List<Widget> screens = [
    ApartmentList(),
    SliverToBoxAdapter(
      child: Text('Map'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CustomAppBar2(
            label: selectedView == 0 ? 'خريطة' : 'قائمة',
            labelOnTap: toggleView,
            iconData: Icons.tune,
            iconOnTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchOptionScreen())),
          ),
          //this is the body of the scaffold
          screens[selectedView]
        ],
      ),
    );
  }
}

class ApartmentList extends StatelessWidget {
  const ApartmentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) {
            Apartment apartment = apartments[i];
            return ApartmentCard(apartment: apartment);
          },
          childCount: apartments.length,
          addRepaintBoundaries: false,
        ),
      ),
    );
  }
}

class ApartmentCard extends StatelessWidget {
  final Apartment apartment;

  const ApartmentCard({
    required this.apartment,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          ApartmentImage(imageUrl: apartment.imageUrl),
          ApartmentDeatils(apartment: apartment),
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ApartmentScreen(
                      apartment: apartment,
                    )));
      },
    );
  }
}

class ApartmentDeatils extends StatelessWidget {
  const ApartmentDeatils({
    Key? key,
    required this.apartment,
  }) : super(key: key);

  final Apartment apartment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${apartment.price} / شهر ',
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Text(
                ' ${apartment.room_number}  غرفة | ${apartment.bathroom_number} حمام | ${apartment.size} متر',
                style: GoogleFonts.tajawal(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            '${apartment.location}',
            style: GoogleFonts.tajawal(),
          ),
          Text(
            '${apartment.ownerName}',
            style: GoogleFonts.tajawal(color: Colors.black),
          )
        ],
      ),
    );
  }
}

class ApartmentImage extends StatelessWidget {
  final String imageUrl;

  const ApartmentImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: imageUrl,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(32), topLeft: Radius.circular(32)),
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          height: 150,
          width: double.infinity,
        ),
      ),
    );
  }
}
