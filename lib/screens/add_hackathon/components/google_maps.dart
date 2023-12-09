import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ------------------------------
//USE THIS FOR STYLE & THEME
// https://mapstyle.withgoogle.com/
// ------------------------------
class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(24.7136, 46.6753),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Set<Marker> markers = {};
  int id = 3;
  @override
  void initState() {
    super.initState();
    _loadMapStyles();
  }

  late var _darkMapStyle;
  Future _loadMapStyles() async {
    _darkMapStyle =
        await rootBundle.loadString('assets/json/dark_mode_style.json');
    print(_darkMapStyle);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      markers.add(const Marker(
        markerId: MarkerId('1'),
        position: LatLng(13.007488, 77.598656),
        infoWindow: InfoWindow(
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
      ));
      markers.add(const Marker(
        markerId: MarkerId('2'),
        position: LatLng(13.007481, 77.598651),
        infoWindow: InfoWindow(
          title: 'Marker Title Third ',
          snippet: 'My Custom Subtitle',
        ),
      ));

      markers.add(const Marker(
        markerId: MarkerId('3'),
        position: LatLng(13.001916, 77.588849),
        infoWindow: InfoWindow(
          title: 'Marker Title Fourth ',
          snippet: 'My Custom Subtitle',
        ),
      ));
    });

    return Scaffold(
      body: GoogleMap(
        mapToolbarEnabled: true,
        indoorViewEnabled: true,
        // mapType: MapType.hybrid,
        markers: markers,
        compassEnabled: true,
        buildingsEnabled: true,
        trafficEnabled: true,
        onLongPress: (value) {
          id += 1;
          markers.add(Marker(
            markerId: MarkerId("${id}"),
            position: LatLng(value.latitude, value.longitude),
          ));
          setState(() {});
        },
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        onTap: (location) {
          print(location);
        },
        myLocationEnabled: true,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          controller.setMapStyle(_darkMapStyle);
          _controller.complete(controller);
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 40.0),
        child: FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: const Text('To Riyadh'),
          icon: const Icon(Icons.location_city),
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
