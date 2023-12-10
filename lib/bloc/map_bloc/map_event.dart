part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class MapGetLocationEvent extends MapEvent {
  final LatLng location;
  List<Marker> markers = [];
  MapGetLocationEvent({required this.markers, required this.location});
}

class MapGetCurrentLocationEvent extends MapEvent {}

class MapSetMarkersEvent extends MapEvent {
  final LatLng location;
  MapSetMarkersEvent({required this.location});
}

// class MapResetMarkersEvent extends MapEvent {}
