import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  var myMarkers = HashSet<Marker>();
  // late Position currentPosition;
  late GoogleMapController newGoogleMapController;
  Completer<GoogleMapController> _controllerGoogleMap = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('address'),
      ),
      body: GoogleMap(
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
          _controllerGoogleMap.complete(controller);
          newGoogleMapController = controller;
          // locatePosition();
        },

      ),
    );
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.466154, 34.423684),
    zoom: 10.4746,
  );

  // void locatePosition() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   currentPosition = position;
  //
  //   LatLng latLngPosition = LatLng(position.latitude, position.longitude);
  //
  //   CameraPosition cameraPosition =
  //   new CameraPosition(target: latLngPosition, zoom: 14);
  //   newGoogleMapController
  //       .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  //
  // }

}
