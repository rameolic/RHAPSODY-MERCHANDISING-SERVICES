import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:merchandising/model/Location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'MenuContent.dart';
import '../Constants.dart';

class MapVeiw extends StatefulWidget {
  @override
  _MapVeiwState createState() => _MapVeiwState();
}

class _MapVeiwState extends State<MapVeiw> {
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
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.3,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(10.00),
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.all(Radius.circular(10)),
                color: pink,
              ),
              child: GoogleMap(initialCameraPosition: CameraPosition(
                  target: LatLng(lat, long),
                  zoom: 15
              ),),
            ),
            Text("Tap on the nearest supermarket\nthat you would like to go",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.white),),
          ],
        )
      ],),
    );
  }
}
