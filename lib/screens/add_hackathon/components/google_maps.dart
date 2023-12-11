import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:team_hack/bloc/add_hackathon_bloc/add_hackathon_cubit.dart';
import 'package:team_hack/bloc/map_bloc/map_bloc.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GoogleMapController? googleMapController;

    List<Marker> userMarker = [];
    LatLng userLocation = const LatLng(0, 0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Hackathon Location"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            googleMapController?.dispose();
            Navigator.pop(context);
          },
        ),
        actions: [
          BlocBuilder<MapBloc, MapState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    userMarker = [];
                    context.read<MapBloc>().add(MapResetMarkersEvent());
                  },
                  icon: const Icon(Icons.delete_forever,
                      semanticLabel: "Delete Marker"));
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: BlocConsumer<MapBloc, MapState>(
              builder: (context, state) {
                return GoogleMap(
                  compassEnabled: true,
                  mapToolbarEnabled: true,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  mapType: MapType.satellite,
                  onLongPress: (onPressedDestination) {
                    context.read<MapBloc>().add(
                        MapGetLocationEvent(location: onPressedDestination));
                  },
                  markers: state is MapSetMarkersState
                      ? Set.from(state.userMarker)
                      : Set.from(userMarker),
                  initialCameraPosition: CameraPosition(
                      target: state is MapGetCurrentLocationState
                          ? userLocation = state.userLocation
                          : userLocation),
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController = controller;
                  },
                );
              },
              listener: (BuildContext context, MapState state) {
                state is MapSetMarkersState
                    ? userMarker.add(state.userMarker.first)
                    : const SizedBox();
                state is MapGetCurrentLocationState
                    ? userLocation = state.userLocation
                    : const SizedBox();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BlocBuilder<MapBloc, MapState>(
                builder: (context, state) {
                  return PrimaryButton(
                    width: context.getWidth(factor: .5),
                    height: context.getHeight(factor: 0.065),
                    onPressed: () async {
                      if (userMarker.isNotEmpty) {
                        context.read<MapBloc>().add(MapGetMarkerLocationEvent(
                            marker: userMarker.first));
                      } else {
                        userMarker = [];
                        context.read<MapBloc>().add(MapResetMarkersEvent());
                      }
                      googleMapController?.dispose();
                      Navigator.pop(context);
                    },
                    title: "Confirm",
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
