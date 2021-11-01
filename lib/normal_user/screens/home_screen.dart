import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_explorer/models/apartment.dart';
import 'package:home_explorer/normal_user/screens/search_options_screen.dart';
import 'package:home_explorer/widgets/widgets.dart';
import 'apartment_screen.dart';

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

  final List<Widget> screens = [ApartmentList(), Map()];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        CustomAppBar2(
          label: selectedView == 0 ? 'خريطة' : 'قائمة',
          labelOnTap: toggleView,
          iconData: Icons.tune,
          iconOnTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => SearchOptionScreen())),
        ),
        screens[selectedView]
      ],
    );
  }
}

class NewlyAdded extends StatefulWidget {
  const NewlyAdded({
    Key? key,
  }) : super(key: key);

  @override
  _NewlyAddedState createState() => _NewlyAddedState();
}

class _NewlyAddedState extends State<NewlyAdded> {
  late PageController _pageController;
  late List<Apartment> apartments;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    apartments = apartments;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        controller: _pageController,
        itemCount: apartments.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Apartment apartment = apartments[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      apartment.imageUrl,
                      fit: BoxFit.cover,
                      height: 180,
                      width: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 6,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    width: 240,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 6.0,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('name: ' + (apartment.name ?? 'null')),
                        const Text('price : 120\$/month'),
                        Text('location : ${apartment.location}')
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
      ),
    );
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  List<String> cities = ['جباليا', 'بيت حانون', 'بيت لاهيا', 'الصفطاوي'];
  String currentCity = 'جباليا';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: double.infinity,
      color: Colors.teal,
      padding: EdgeInsets.fromLTRB(12, 18, 30, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox.fromSize(
                child: Text(
                  'أنا في ',
                  style: GoogleFonts.tajawal(fontSize: 32, color: Colors.white),
                  textAlign: TextAlign.start,
                ),
              ),
              DropdownButton(
                  borderRadius: BorderRadius.circular(15),
                  alignment: AlignmentDirectional.bottomStart,
                  selectedItemBuilder: (BuildContext context) {
                    return cities.map((String item) {
                      return Text(
                        item,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w600,
                          fontSize: 32,
                          color: Color(0xFFEDE9E7),
                          shadows: [
                            // Shadow(
                            //     color: Colors.black,
                            //     offset: Offset(-2, 2))
                          ],
                        ),
                      );
                    }).toList();
                  },
                  dropdownColor: Color(0xFF005792),
                  elevation: 1,
                  icon: Text(''),
                  value: currentCity,
                  onChanged: (newCity) {
                    setState(() {
                      currentCity = newCity.toString();
                    });
                  },
                  underline: Text(''),
                  items: cities
                      .map((e) => DropdownMenuItem(
                            child: Text(
                              e,
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w600,
                                fontSize: 32,
                                color: Color(0xFFEDE9E7),
                                shadows: [
                                  // Shadow(
                                  //     color: Colors.black,
                                  //     offset: Offset(-2, 2))
                                ],
                              ),
                            ),
                            value: e,
                          ))
                      .toList())
            ],
          ),
          Icon(
            Icons.apartment,
            color: Colors.white,
            size: 35,
          ),
        ],
      ),
    );
  }
}

class RealEstateList extends StatelessWidget {
  const RealEstateList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'الشقق',
                  style: GoogleFonts.tajawal(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'رؤية المزيد...',
                  style: GoogleFonts.tajawal(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(),
            child: PageView.builder(
              itemCount: apartments.length,
              itemBuilder: (context, index) {
                Apartment apartment = apartments[index];
                return Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      left: 5,
                      right: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(height: 20),
                            Text(
                              'شقة المعتز 3',
                            ),
                            Text(
                              '950\$ per month',
                              textAlign: TextAlign.end,
                            ),
                            Text('${apartment.location}'),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      right: 5,
                      bottom: 80,
                      top: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          apartment.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                );
              },
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
            ),
          ),
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
      padding: EdgeInsets.all(15),
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
            style: GoogleFonts.tajawal(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            '${apartment.ownerName}',
            style: GoogleFonts.tajawal(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
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

class CategorySelector extends StatefulWidget {
  const CategorySelector({
    Key? key,
  }) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  List<String> categories = ['منزل', 'مساحة عمل', 'متجر'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 30, right: 20, top: 20),
          child: Text(
            'أنواع العقارات',
            style: GoogleFonts.tajawal(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF305F72)),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String category = categories[index];
              bool isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  width: 100,
                  height: 35,
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Color(0xFF305F72)
                        : Color(0xFFCBE5F3).withOpacity(0.46),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    category,
                    style: GoogleFonts.tajawal(
                      color: isSelected ? Colors.white : Color(0xFF305F72),
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class Map extends StatefulWidget {
  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  var myMarkers = HashSet<Marker>();

  late GoogleMapController newGoogleMapController;

  Completer<GoogleMapController> _controllerGoogleMap = Completer();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 610,
        child: GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(31.466154, 34.423684),
            zoom: 10.4746,
          ),
          onMapCreated: (GoogleMapController controller) {
            setState(() {
              myMarkers.add(Marker(
                  markerId: MarkerId('1'),
                  position:LatLng(31.466154, 34.423684),
                  infoWindow: InfoWindow(title: "عنوان 1",snippet: "تفاصيل عن الشقة 1"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
              ),);
              myMarkers.add(Marker(
                  markerId: MarkerId('2'),
                  position:LatLng(31.448435, 34.392796),
                  infoWindow: InfoWindow(title: "عنوان 2",snippet: "تفاصيل عن الشقة 2"),
              ),);
            });
            _controllerGoogleMap.complete(controller);
            newGoogleMapController = controller;
            // locatePosition();
          },
          markers: myMarkers,
        ),
      ),
    );
  }
}
