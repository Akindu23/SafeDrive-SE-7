//@dart=2.9
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  group('Google Maps Flutter', () {
    test('Test camera position', () {
      // Create an initial camera position with specified latitude and longitude
      const initialCameraPosition = CameraPosition(
        target: LatLng(6.896083190562848, 79.85539088471504),
        zoom: 12,
      );

      // Create a GoogleMap widget with the initial camera position
      const googleMap = GoogleMap(
        initialCameraPosition: initialCameraPosition,
      );

      // Expect the GoogleMap's initial camera position to match the one we specified
      expect(googleMap.initialCameraPosition, initialCameraPosition);
    });

    test('Test markers', () {
      // Create a marker with specified ID, position, and info
      const marker = Marker(
        markerId: MarkerId('marker_1'),
        position: LatLng(6.896083190562848, 79.85539088471504),
        infoWindow: InfoWindow(
          title: 'IIT',
          snippet: 'School of Computing',
        ),
      );

      // Expect the marker's ID to match the one we specified
      expect(marker.markerId.value, 'marker_1');

      // Expect the marker's position to match the one we specified
      expect(marker.position.latitude, 6.896083190562848);
      expect(marker.position.longitude, 79.85539088471504);

      // Expect the marker's info to match the one we specified
      expect(marker.infoWindow.title, 'IIT');
      expect(marker.infoWindow.snippet, 'School of Computing');
    });
  });
}
