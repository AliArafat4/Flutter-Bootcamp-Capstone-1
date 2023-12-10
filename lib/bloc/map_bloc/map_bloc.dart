import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:meta/meta.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    on<MapGetLocationEvent>((event, emit) async {
      if (!event.location.toString().contains("null")) {
        // final place = await geocoding.placemarkFromCoordinates(
        //     event.location.latitude, event.location.longitude);
        // final first = place.first;
        final selectedLatLng =
            LatLng(event.location.latitude, event.location.longitude);

        emit(MapSuccessState(
            location: selectedLatLng,
            currentLocation: selectedLatLng,
            markers: []));

        event.markers.add(Marker(
            markerId: MarkerId(event.location.toString()),
            position: event.location));

        emit(MapSuccessState(
            location: selectedLatLng,
            currentLocation: selectedLatLng,
            markers: event.markers));
      }
    });

    on<MapGetCurrentLocationEvent>((event, emit) async {
      try {
        LocationPermission permission;
        permission = await Geolocator.checkPermission();
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          //nothing
        }
        // Position position = await Geolocator.getCurrentPosition(
        //     desiredAccuracy: LocationAccuracy.low);
        await Geolocator.getCurrentPosition().then((currLocation) {
          final currentLatLng =
              LatLng(currLocation.latitude, currLocation.longitude);
          emit(MapGetCurrentLocationState(userLocation: currentLatLng));
        });
      } catch (err) {
        print(err);
      }
    });
  }
}
