import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:merchandising/Constants.dart';
import 'Location_service.dart';
import 'package:google_map_polyline/google_map_polyline.dart';

class GoogleMapsWidget extends StatefulWidget {
  @override
  _GoogleMapsWidgetState createState() => _GoogleMapsWidgetState();
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  final Set<Polyline> polyline = {};

  GoogleMapController _controller;
  List<LatLng> routeCoords;
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: "AIzaSyDKEaHXFJX0ZZ0zlCII7lG4vL9F0NlTqQE");

  getsomePoints() async {
    routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
        origin: LatLng(lat, long),
        destination: LatLng(12.951767, 79.146734),
        mode: RouteMode.driving);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsomePoints();
  }


  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition:
          CameraPosition(target: LatLng(lat, long), zoom: 15),
      onMapCreated: onMapCreated,
      polylines: polyline,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: true,
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      print(routeCoords);
      _controller = controller;

      polyline.add(Polyline(
          polylineId: PolylineId('route to work'),
          visible: true,
          points: routeCoords,
          width: 4,
          color: orange,
          startCap: Cap.roundCap,
          endCap: Cap.buttCap));
    });
  }
}
