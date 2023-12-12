import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    on<MapGetLocationEvent>((event, emit) async {
      if (!event.location.toString().contains("null")) {
        List<Marker> markers = [];

        // final place = await geocoding.placemarkFromCoordinates(
        //     event.location.latitude, event.location.longitude);
        // final first = place.first;
        final userLocation = await Geolocator.getCurrentPosition();

        final selectedLatLng =
            LatLng(userLocation.latitude, userLocation.longitude);

        // emit(MapSuccessState(
        //     location: selectedLatLng,
        //     currentLocation: selectedLatLng,
        //     markers: []));

        markers.add(Marker(
            markerId: MarkerId(event.location.toString()),
            position: event.location));
        emit(MapSetMarkersState(userMarker: markers));

        // emit(MapSuccessState(
        //     location: selectedLatLng,
        //     currentLocation: selectedLatLng,
        //     markers: markers));
      }
    });

    on<MapGetCurrentLocationEvent>((event, emit) async {
      try {
        await Geolocator.getCurrentPosition().then((currLocation) {
          final currentLatLng =
              LatLng(currLocation.latitude, currLocation.longitude);
          emit(MapGetCurrentLocationState(userLocation: currentLatLng));
        });
      } catch (err) {
        print(err);
      }
    });
    on<MapResetMarkersEvent>((event, emit) async {
      final userLocation = await Geolocator.getCurrentPosition();
      emit(MapResetMarkersState(
          userLocation: LatLng(userLocation.latitude, userLocation.longitude)));
    });
    on<MapGetMarkerLocationEvent>((event, emit) async {
      final location = await geocoding.placemarkFromCoordinates(
          event.marker.position.latitude, event.marker.position.longitude);

      emit(MapGetMarkerLocationState(
          location:
              "${location.first.country},${location.first.name},${location.first.street}"));
    });
  }
  userPermission() async {
    //TODO: FIX
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      //nothing
    }
  }
}
