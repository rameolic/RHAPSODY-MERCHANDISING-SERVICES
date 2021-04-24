import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:merchandising/Fieldmanager/product_details.dart';
import 'package:merchandising/model/Location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'MenuContent.dart';
import '../../Constants.dart';
import 'package:merchandising/model/googledirections.dart';
import 'package:merchandising/api/Journeyplansapi/todayplan/journeyplanapi.dart';
class markers{static Set<Marker> outlets={};}
class polyline{static Set<Polyline> route={};}
var points;
var destinationpoints;

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

class _MapVeiwState extends State<MapVeiw>{
  @override
  void initState() {
    super.initState();
    addmarker();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: containerscolor,
            iconTheme: IconThemeData(color: orange),
            title: Text(
              'Journey Plan Map Veiw',
              style: TextStyle(color: orange),
            ),
          ),
          // drawer: Drawer(
          //   child: Menu(),
          // ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(10)),
              color: pink,
            ),
            child: GoogleMap(
              initialCameraPosition: CameraPosition(target: LatLng(lat, long), zoom: 13.5,),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              markers:Set<Marker>.of(markers.outlets),
              polylines:polyline.route,
            ),
          ),
        ),
      ],
    );
  }
  addmarker(){
    for(int u=0;u<gettodayjp.outletlat.length;u++){
      markers.outlets.add(
          Marker(markerId: MarkerId("Markers$u"),
              position: LatLng(double.parse(gettodayjp.outletlat[u]),
                  double.parse(gettodayjp.outletlong[u])),
              infoWindow: InfoWindow(title: gettodayjp.storenames[u],
                  snippet: 'Distance: ${gettodayjp.distanceinmeters[u].toStringAsFixed(2)} KM'),
              onTap: () async{
            print('${gettodayjp.outletlat[u]},${gettodayjp.outletlong[u]}');
                var points = await DirectionsRepository().getDirections(
                    origin: LatLng(lat,long),
                    destination: LatLng(double.parse(gettodayjp.outletlat[u]),
                        double.parse(gettodayjp.outletlong[u])),
                );
                polyline.route={};
                setState(() {
                  polyline.route.add(
                      Polyline(
                        polylineId: PolylineId('routes'),
                        visible: true,
                        points: points.polylinePoints.map((e) => LatLng(e.latitude,e.longitude)).toList(),
                        color: orange,
                        width: 2,
                      ));
                });

              },
          ));

    }
  }
}
