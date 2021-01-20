import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsWidget extends StatefulWidget {
  @override
  _GoogleMapsWidgetState createState() => _GoogleMapsWidgetState();
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
          target: LatLng(25.13751228749827, 55.20760560669246),
          zoom: 12
      ),
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomGesturesEnabled: true,

    );
  }
}
