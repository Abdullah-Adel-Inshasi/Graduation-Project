import 'dart:async';
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_explorer/models/apartment.dart';
import 'package:home_explorer/models/user.dart';
import 'package:home_explorer/normal_user/screens/search_options_screen.dart';
import 'package:home_explorer/normal_user/screens/store_screen.dart';
import 'package:home_explorer/normal_user/screens/workspace_screen.dart';
import 'package:home_explorer/widgets/widgets.dart';
// import 'package:location/location.dart';
import 'apartment_screen.dart';



class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedView = 0;
  int selectedRealEstateType = 0;

  toggleView() {
    setState(() {
      selectedView == 0 ? selectedView = 1 : selectedView = 0;
    });
  }

  List<Widget> realEstates = [
    ApartmentList(),
    StoreList(),
    WorkSpaceList(),
  ];

  late List<Widget> screens;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, vsync: this, length: 3);
    screens = [realEstates[selectedRealEstateType], Map()];
    super.initState();
  }

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
        selectedView == 0
            ? SliverToBoxAdapter(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: TabBar(
                    labelColor: Colors.black,
                    controller: tabController,
                    onTap: (x) {
                      setState(() {
                        selectedRealEstateType = x;
                      });
                      print(x.toString());
                    },
                    tabs: [
                      Tab(
                        text: 'منازل',
                      ),
                      Tab(
                        text: 'متاجر',
                      ),
                      Tab(
                        text: 'مساحة عمل',
                      )
                    ],
                  ),
                ),
              )
            : SliverToBoxAdapter(
                child: SizedBox.shrink(),
              ),
        selectedView == 0 ? realEstates[selectedRealEstateType] : Map(),
      ],
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
      color: Color(0xFF14688C),
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

// Apartment **************************************
class ApartmentList extends StatelessWidget {
  const ApartmentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(15),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) {
            Home _home = home[i];
            return ApartmentCard(home: _home);
          },
          childCount: home.length,
          addRepaintBoundaries: false,
        ),
      ),
    );
  }
}

class ApartmentCard extends StatelessWidget {
  final Home home;

  const ApartmentCard({
    required this.home,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          ApartmentImage(imageUrl: home.coverImg),
          ApartmentDeatils(home: home),
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ApartmentScreen(
                      home: home,
                    )));
      },
    );
  }
}

class ApartmentDeatils extends StatelessWidget {
  const ApartmentDeatils({
    Key? key,
    required this.home,
  }) : super(key: key);

  final Home home;

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
                '\$${home.monthlyRent} / شهر ',
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Text(
                ' ${home.numOfRoom}  غرفة | ${home.numOfBathroom} حمام | ${home.size} متر',
                style: GoogleFonts.tajawal(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            '${home.address.toString()}',
            style: GoogleFonts.tajawal(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            '${home.user.fullName}',
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

// store **************************************
class StoreList extends StatelessWidget {
  const StoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(15),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, i) {
            Store _store = store[i];
            return StoreCard(store: _store);
          },
          childCount: store.length,
          addRepaintBoundaries: false,
        ),
      ),
    );
  }
}

class StoreCard extends StatelessWidget {
  final Store store;

  const StoreCard({
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          StoreImage(imageUrl: store.coverImg),
          StoreDeatils(stor : store),
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StoreScreen(
                  store: store,
                )));
      },
    );
  }
}

class StoreDeatils extends StatelessWidget {
  const StoreDeatils({
    Key? key,
    required this.stor,
  }) : super(key: key);

  final Store stor;

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
                '\$${stor.monthlyRent} / شهر ',
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              // Text(
              //   ' ${stor.}  غرفة | ${home.numOfBathroom} حمام | ${home.size} متر',
              //   style: GoogleFonts.tajawal(
              //       fontSize: 16, fontWeight: FontWeight.w500),
              // ),
            ],
          ),
          Text(
            '${stor.address.toString()}',
            style: GoogleFonts.tajawal(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            '${stor.user.fullName}',
            style: GoogleFonts.tajawal(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class StoreImage extends StatelessWidget {
  final String imageUrl;

  const StoreImage({Key? key, required this.imageUrl}) : super(key: key);

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

// workSpace **************************************
class WorkSpaceList extends StatelessWidget {
  const WorkSpaceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(15),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, i) {
            WorkSpace  _workSpace= workSpace[i];
            return WorkSpaceCard(workSpace: _workSpace);
          },
          childCount: workSpace.length,
          addRepaintBoundaries: false,
        ),
      ),
    );
  }
}

class WorkSpaceCard extends StatelessWidget {
  final WorkSpace workSpace;

  const WorkSpaceCard({
    required this.workSpace,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          WorkSpaceImage(imageUrl: workSpace.coverImg),
          WorkSpaceDeatils(workSpace: workSpace,),
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WorkSpaceScreen(
                  workSpace: workSpace,
                )));
      },
    );
  }
}

class WorkSpaceDeatils extends StatelessWidget {
  const WorkSpaceDeatils({
    Key? key,
    required this.workSpace, stor,
  }) : super(key: key);

  final WorkSpace workSpace;

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
                '\$${workSpace.monthlyRent} / شهر ',
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              // Text(
              //   ' ${stor.}  غرفة | ${home.numOfBathroom} حمام | ${home.size} متر',
              //   style: GoogleFonts.tajawal(
              //       fontSize: 16, fontWeight: FontWeight.w500),
              // ),
            ],
          ),
          Text(
            '${workSpace.address.toString()}',
            style: GoogleFonts.tajawal(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            '${workSpace.user.fullName}',
            style: GoogleFonts.tajawal(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class WorkSpaceImage extends StatelessWidget {
  final String imageUrl;

  const WorkSpaceImage({Key? key, required this.imageUrl}) : super(key: key);

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
  late Position currentPosition;
  late GoogleMapController newGoogleMapController;
  Completer<GoogleMapController> _controllerGoogleMap = Completer();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 615,
        child: GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controllerGoogleMap.complete(controller);
            newGoogleMapController = controller;
            setState(() {
              myMarkers.add(Marker(
                onTap: (){
                  _modalBottomSheetMenu();
                },
                markerId: MarkerId('1'),
                position:LatLng(31.466154, 34.423684),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
              ),);
              myMarkers.add(Marker(
                onTap: (){
                  _modalBottomSheetMenu();
                },
                markerId: MarkerId('2'),
                position:LatLng(31.448435, 34.392796),
              ),);
              myMarkers.add(Marker(
                onTap: (){
                  _modalBottomSheetMenu();
                },
                markerId: MarkerId('3'),
                position:LatLng(31.448440, 34.392780),
              ),);
            });
          },
          markers: myMarkers,
        ),
      ),
    );
  }
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.466154, 34.423684),
    zoom: 10.4746,
  );

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: geolocator.LocationAccuracy.high);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
    new CameraPosition(target: latLngPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void _modalBottomSheetMenu(){
    int x = 5;
    int y = 2;
    int z = 300;
    int m = 120;

    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder){
          return  Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20),
                        topRight: const Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\$120',
                              style: GoogleFonts.tajawal(
                                  color: Colors.green, fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '/شهريا',
                              style: GoogleFonts.tajawal(
                                  color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ApartmentDetail(
                                label: 'غرف النوم',
                                iconData: Icons.bed,
                                value: '4',
                              ),
                              SizedBox(height: 5),
                              ApartmentDetail(
                                label: 'الصالات', iconData: Icons.chair, value: '2',),
                              SizedBox(height: 5),
                              ApartmentDetail(
                                label: 'دورات المياه',
                                iconData: Icons.bathtub_outlined,
                                value: '1',)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ApartmentDetail(
                                label: 'مساحة الشقة',
                                iconData: Icons.format_size,
                                value: '170',
                              ),
                              SizedBox(height: 5),
                              ApartmentDetail(
                                label: 'الطابق', iconData: Icons.menu, value: '${2}',),
                              SizedBox(height: 5),
                              ApartmentDetail(
                                label: 'رقم الشقة',
                                iconData: Icons.format_list_numbered,
                                value: '24'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ApartmentScreen(
                                    home: Home(
                                        numOfBathroom: 1,
                                        numOfRoom: 4,
                                        direction: 'شمالي غربي',
                                        numOfHalls: 2,
                                        floor: 5,
                                        typeOfHome: HomeType.house,
                                        user: landLord[0],
                                        downpayment: 300,
                                        apartmentNumber: 23,
                                        monthlyRent: 250,
                                        name: 'no.1',
                                        address: address1,
                                        size: 170,
                                        imgUrl: ['assets/images/house1.jpg'],
                                        coverImg: 'assets/images/house1.jpg',
                                        aboutEstate: 'تفاصيل الوحدة السكنية ....',
                                        beginObservation: startDate1,
                                        endObservation: EndDate1,
                                        isAvailable: true,
                                        hasFurnature: true,
                                        closeFromMosque: true,
                                        isPrivat: false,
                                        hasGarage: true),
                                  )));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: double.infinity,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Color(0xff14688C),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('عرض المزيد', style: TextStyle(fontSize: 18,color: Color(0xffF6F6F6))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}


