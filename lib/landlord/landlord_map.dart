import 'dart:async';
import 'dart:collection';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LandlordMap extends StatefulWidget {
  @override
  State<LandlordMap> createState() => _LandlordMapState();
}

class _LandlordMapState extends State<LandlordMap> {
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
          },
          onTap: (locatePosition){

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

  locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: geolocator.LocationAccuracy.high);
    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
    new CameraPosition(target: latLngPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    return latLngPosition;
  }
}