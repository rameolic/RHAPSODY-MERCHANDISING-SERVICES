import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:merchandising/model/Location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'MenuContent.dart';
import '../Constants.dart';
import 'package:merchandising/api/journeyplanapi.dart';
class markers{
  static List<Marker> outlets=[];
}
marker(){
  for(int u=0;u<gettodayjp.outletlat.length;u++){
    markers.outlets.add(
          Marker(markerId: MarkerId("Markers"),
              position: LatLng(double.parse(gettodayjp.outletlat[u]),
                  double.parse(gettodayjp.outletlong[u])),
            infoWindow: InfoWindow(title: gettodayjp.storenames[u],
                snippet: 'Distance: ${gettodayjp.distanceinmeters[u].toStringAsFixed(2)} KM')
  ));

  }

}
class mapmarkersinfo{
  static var int = "id";
  static var name = 'storename';
  static var area = 'area';
  static var country = 'country';
  static var number = 'number';
  static var distance = 'distance';
  static var city = 'city';
}


class MapVeiw extends StatefulWidget {
  @override
  _MapVeiwState createState() => _MapVeiwState();
}

class _MapVeiwState extends State<MapVeiw> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: containerscolor,
            iconTheme: IconThemeData(color: orange),
            title: Text(
              'Map Veiw',
              style: TextStyle(color: orange),
            ),
          ),
          drawer: Drawer(
            child: Menu(),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(10)),
              color: pink,
            ),
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(lat, long),
                zoom: 13,),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              markers:Set<Marker>.of(markers.outlets),
            ),
          ),
        ),
      ],
    );
  }
}
