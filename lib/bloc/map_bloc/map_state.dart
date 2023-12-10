part of 'map_bloc.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

class MapGetCurrentLocationState extends MapState {
  final LatLng userLocation;

  MapGetCurrentLocationState({required this.userLocation});
}

class MapSetMarkersState extends MapState {
  final List<Marker> userMarker;

  MapSetMarkersState({required this.userMarker});
}

class MapSuccessState extends MapState {
  final LatLng location;
  final LatLng currentLocation;
  final List<Marker> markers;

  MapSuccessState(
      {required this.location,
      required this.currentLocation,
      required this.markers});
}
