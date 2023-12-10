import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:team_hack/bloc/bloc_search/search_bloc.dart';
import 'package:team_hack/bloc/map_bloc/map_bloc.dart';
import 'package:team_hack/extentions/size_extention.dart';
import 'package:team_hack/screens/auth/components/auth_button.dart';
import 'package:team_hack/screens/hackathon_detail_screen/widgets/primary_button.dart';

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

  @override
  Widget build(BuildContext context) {
    final bloc = context
        .read<MapBloc>()
        .add(MapGetLocationEvent(markers: [], location: LatLng(0, 0)));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Hackathon Location"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                userMarker = [];
                setState(() {});
              },
              icon: const Icon(Icons.delete_forever,
                  semanticLabel: "Delete Marker")),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: BlocBuilder<MapBloc, MapState>(
              builder: (context, state) {
                return state is MapSuccessState
                    ? GoogleMap(
                        compassEnabled: true,
                        mapToolbarEnabled: true,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        mapType: MapType.satellite,
                        onLongPress: (onPressedDestination) {
                          print(onPressedDestination);
                          context.read<MapBloc>().add(
                                MapGetLocationEvent(
                                  markers: const [],
                                  location: onPressedDestination,
                                ),
                              );
                        },
                        markers: Set.from(userMarker),
                        initialCameraPosition:
                            CameraPosition(target: state.currentLocation),
                        onMapCreated: (GoogleMapController controller) {
                          googleMapController = controller;
                        },
                      )
                    : SizedBox();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                width: context.getWidth(factor: .5),
                height: context.getHeight(factor: 0.065),
                onPressed: () {
                  Navigator.pop(context);
                },
                title: "Confirm",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
