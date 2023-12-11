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

class MapResetMarkersState extends MapState {
  final LatLng userLocation;

  MapResetMarkersState({required this.userLocation});
}

class MapGetMarkerLocationState extends MapState {
  final String location;

  MapGetMarkerLocationState({required this.location});
}
