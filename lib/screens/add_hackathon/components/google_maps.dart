import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_maps_webservices/directions.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';

// ------------------------------
//USE THIS FOR STYLE & THEME
// https://mapstyle.withgoogle.com/
// ------------------------------

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  LatLng? currentLatLng;
  GoogleMapController? googleMapController;
  LatLng? eventDestination;
  Location? destination;
  List<Marker> userMarker = [];
  var place, first;

  @override
  void initState() {
    super.initState();

    Geolocator.getCurrentPosition().then((currLocation) {
      setState(() {
        currentLatLng = LatLng(currLocation.latitude, currLocation.longitude);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            getDestination();
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                try {
                  setState(() async {
                    destination = await mapSearch(context);
                    //TODO the marker should be removed when the search is used
                    userMarker = [];
                    ("$eventDestination".contains("null"))
                        ? SizedBox()
                        : eventDestination = null;

                    userMarker.add(Marker(
                        markerId: MarkerId(
                          destination.toString(),
                        ),
                        position: LatLng(destination!.lat, destination!.lng)));
                  });
                } catch (err) {}
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                setState(() {
                  userMarker = [];
                });
              },
              icon: const Icon(
                Icons.delete_forever,
                semanticLabel: "Delete Marker",
              )),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: "${currentLatLng}".contains("null")
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
                    compassEnabled: true,
                    mapToolbarEnabled: true,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    mapType: MapType.normal,
                    onLongPress: (onPressedDestination) {
                      setState(() {
                        userMarker = [];
                        ("$destination".contains("null"))
                            ? const SizedBox()
                            : destination = null;
                        userMarker.add(Marker(
                            markerId: MarkerId(
                              onPressedDestination.toString(),
                            ),
                            position: onPressedDestination));
                        eventDestination = onPressedDestination;
                      });
                    },
                    markers: Set.from(userMarker),
                    initialCameraPosition:
                        CameraPosition(target: currentLatLng!),
                    onMapCreated: (GoogleMapController controller) {
                      googleMapController = controller;
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 58),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: PrimaryButton(
                  height: context.getHeight(factor: 0.2),
                  width: context.getWidth(factor: 0.2),
                  onPressed: () {
                    getDestination();
                    Navigator.pop(context);
                  },
                  title: "Confirm",
                  color: Colors.lightBlue,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  getDestination() async {
    //from onPressed marker
    if (!"${eventDestination}".contains("null")) {
      place = await geocoding.placemarkFromCoordinates(
          eventDestination!.latitude, eventDestination!.longitude);
      first = place.first;
      final selectedLatLng =
          LatLng(eventDestination!.latitude, eventDestination!.longitude);
    }
    //from search
    else if (!"${destination}".contains("null")) {
      place = await geocoding.placemarkFromCoordinates(
          destination!.lat, destination!.lng);
      first = place.first;
      final selectedLatLng = LatLng(destination!.lat, destination!.lng);
    }
    // locationControler.text =
    //     ' ${first.locality}, ${first.subLocality},\n${first.street}';
  }
}

Future<String> getPermission() async {
  try {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      //nothing
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    return "True";
  } catch (err) {
    return "False";
  }
}

// Future<Location> mapSearch(context) async {
Future<dynamic> mapSearch(context) async {
  // const kGoogleApiKey = "API_KEY";
  {
    // const kGoogleApiKey = "AIzaSyApKjzpz3t8DL9nYdTdMGzYphz4DLN1OcY";

    // Prediction? p = await PlacesAutocomplete.show(
    //   context: context,
    //   radius: 100000000,
    //   types: [],
    //   logo: const SizedBox.shrink(),
    //   strictbounds: false,
    //   mode: Mode.overlay,
    //   language: "en",
    //   components: [
    //     Component(Component.country, "SA"),
    //     // Component(Component.country, "BH"),
    //     // Component(Component.country, "UK")
    //   ],
    //   apiKey: kGoogleApiKey,
    // );

    // GoogleMapsPlaces places =
    //     GoogleMapsPlaces(apiKey: kGoogleApiKey); //Same API_KEY as above
    // PlacesDetailsResponse detail =
    //     await places.getDetailsByPlaceId("${p?.placeId}");
    // double latitude = detail.result.geometry!.location.lat;
    // double longitude = detail.result.geometry!.location.lng;
    // String address = "${p?.description}";

    // return detail.result.geometry!.location;
    return "";
  }
}
