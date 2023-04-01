import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

final places = GoogleMapsPlaces(apiKey: "AIzaSyDWiFu9s5jkaasiw3ER6gwohs84MYDMB0E");

class RestStopScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RestStopScreenState();
  }
}

class _RestStopScreenState extends State<RestStopScreen> {
  late Future<Position> _currentLocation;
  Set<Marker> _markers = {};

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

  Future<void> _retrieveNearbyRestStops(LatLng _userLocation) async {
    PlacesSearchResponse _response = await places.searchNearbyWithRadius(
        Location(_userLocation.latitude, _userLocation.longitude), 5000,
        type: "cafe");

    Set<Marker> _restStopMarkers = _response.results
        .map((result) => Marker(
        markerId: MarkerId(result.name),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: InfoWindow(
            title: result.name,
            snippet: "Star Rating: " + (result.rating?.toString() ?? "Not Rated")),
        position: LatLng(
            result.geometry.location.lat, result.geometry.location.lng)))
        .toSet();

    setState(() {
      _markers.addAll(_restStopMarkers);
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
            Position? snapshotData = snapshot.data as Position?;
            if (snapshotData != null) {
              LatLng _userLocation =
              LatLng(snapshotData.latitude, snapshotData.longitude);

              if (_markers.isEmpty) {
                _retrieveNearbyRestStops(_userLocation);
              }

              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _userLocation,
                  zoom: 16,
                ),
                markers: _markers
                  ..add(Marker(
                      markerId: MarkerId("User Location"),
                      infoWindow: InfoWindow(title: "User Location"),
                      position: _userLocation)),
              );
            } else {
              return Center(child: Text("Failed to get user location."));
            }
          } else {
            return Center(child: Text("Failed to get user location."));
          }
        }
        // While the connection is not in the done state yet
        return Center(child: CircularProgressIndicator());
      },
    );
  }

}