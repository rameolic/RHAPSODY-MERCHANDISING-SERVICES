import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:merchandising/model/Location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'MenuContent.dart';
import '../Constants.dart';
import 'package:merchandising/api/jprequest.dart';

class MapVeiw extends StatefulWidget {
  @override
  _MapVeiwState createState() => _MapVeiwState();
}


class _MapVeiwState extends State<MapVeiw> {
  List<Marker> _outlets = <Marker>[
    Marker(markerId: MarkerId("outletpoint1"), position: LatLng(double.tryParse(JPResponsePlanneddata.latitudedata1),double.tryParse(JPResponsePlanneddata.latitudedata1),)),
    Marker(markerId: MarkerId("outletpoint2"), position: LatLng(double.tryParse(JPResponsePlanneddata.latitudedata2),double.tryParse(JPResponsePlanneddata.latitudedata2),)),
    Marker(markerId: MarkerId("outletpoint3"), position: LatLng(double.tryParse(JPResponsePlanneddata.latitudedata3),double.tryParse(JPResponsePlanneddata.latitudedata3),)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Stack(children: [
        BackGround(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/1.2,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(10.00),
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.all(Radius.circular(10)),
            color: pink,
          ),
          child: GoogleMap(initialCameraPosition: CameraPosition(
              target: LatLng(lat, long),
              zoom: 15,),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            markers:Set<Marker>.of(_outlets),
          ),
        )
      ],),
    );
  }
}
