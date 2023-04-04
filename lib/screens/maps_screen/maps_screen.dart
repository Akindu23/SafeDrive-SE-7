import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:safedrive/screens/home_page_screens/home_Page.dart';
import 'package:safedrive/utils/util_functions.dart';

final places = GoogleMapsPlaces(apiKey: "AIzaSyDWiFu9s5jkaasiw3ER6gwohs84MYDMB0E");

class RestStopScreen extends StatefulWidget {
  const RestStopScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RestStopScreenState();
  }
}

class _RestStopScreenState extends State<RestStopScreen> {
  late Future<Position> _currentLocation;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _currentLocation = _determinePosition();
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> _retrieveNearbyRestStops(LatLng userLocation) async {
    PlacesSearchResponse response = await places.searchNearbyWithRadius(
        Location(userLocation.latitude, userLocation.longitude), 5000,
        type: "cafe");

    Set<Marker> restStopMarkers = response.results
        .map((result) => Marker(
        markerId: MarkerId(result.name),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: InfoWindow(
            title: result.name,
            snippet: "Star Rating: ${result.rating?.toString() ?? "Not Rated"}"),
        position: LatLng(
            result.geometry.location.lat, result.geometry.location.lng)))
        .toSet();

    setState(() {
      _markers.addAll(restStopMarkers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _currentLocation,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            // The user location returned from the snapshot
            Position? snapshotData = snapshot.data;
            if (snapshotData != null) {
              LatLng userLocation =
              LatLng(snapshotData.latitude, snapshotData.longitude);

              if (_markers.isEmpty) {
                _retrieveNearbyRestStops(userLocation);
              }

              return Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: userLocation,
                      zoom: 16,
                    ),
                    markers: _markers
                      ..add(Marker(
                          markerId: const MarkerId("User Location"),
                          infoWindow: const InfoWindow(title: "User Location"),
                          position: userLocation)),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 16,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: ElevatedButton(
                        onPressed: () {
                          UtilFunction.navigateTo(context, const HomePage());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color(0xFF000730), // Set the background color
                          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                        ),
                        child: const Text(
                          'Back to Home Page',
                          style: TextStyle(
                            color: Colors.white, // Set the text color
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text("Failed to get user location."));
            }
          } else {
            return const Center(child: Text("Failed to get user location."));
          }
        }
        // While the connection is not in the done state yet
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

}