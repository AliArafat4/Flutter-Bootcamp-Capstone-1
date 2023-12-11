part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class MapGetLocationEvent extends MapEvent {
  final LatLng location;
  MapGetLocationEvent({required this.location});
}

class MapGetCurrentLocationEvent extends MapEvent {}

class MapGetMarkerLocationEvent extends MapEvent {
  final Marker marker;

  MapGetMarkerLocationEvent({required this.marker});
}

class MapResetMarkersEvent extends MapEvent {}
