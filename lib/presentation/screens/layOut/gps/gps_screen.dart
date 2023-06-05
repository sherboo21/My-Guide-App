import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_guide/data/dataSources/local/shared_prefrences.dart';

import '../../../../utils/add_premissions.dart';
import '../../../widgets/customDrawer/custom_drawer.dart';

class GpsScreen extends StatefulWidget {
  const GpsScreen({Key? key}) : super(key: key);

  @override
  State<GpsScreen> createState() => _GpsScreenState();
}

class _GpsScreenState extends State<GpsScreen> {
  String mapTheme = '';
  late GoogleMapController googleMapController;
  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);
  Set<Marker> markers = {};

  Future<void> _setCurrentLocation() async {
    Position position = await AppPermissions.determinePosition();
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 14)));
    StartPrefs.setUserLatValue(position.latitude.toString());
    StartPrefs.setUserLongValue(position.longitude.toString());
    debugPrint(
        '--------------------${position.latitude.toString()}------------------',
        wrapWidth: 100);
    debugPrint(
        '--------------------${position.longitude.toString()}------------------',
        wrapWidth: 100);
    markers.clear();
    markers.add(
      Marker(
          markerId: const MarkerId('currentLocation'),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: const InfoWindow(title: 'My Location')),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _setCurrentLocation();
    DefaultAssetBundle.of(context)
        .loadString('assets/map/map_dark_theme.json')
        .then((value) => mapTheme = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          markers: markers,
          zoomControlsEnabled: false,
          // myLocationEnabled: true,
          myLocationButtonEnabled: true,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            StartPrefs.getThemeValue() == false
                ? null
                : controller.setMapStyle(mapTheme);
            googleMapController = controller;
          },
        ),
      ),
    );
  }
}