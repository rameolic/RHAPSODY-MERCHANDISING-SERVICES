import 'package:flutter/material.dart';
import 'package:merchandising/api/api_service.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'checkin.dart';
import 'package:merchandising/model/OutLet_BarChart.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OutLet extends StatefulWidget {
  double currentdist;
  @override
  _OutLetState createState() => _OutLetState();
}

class _OutLetState extends State<OutLet> {
  List<Marker> _markers = <Marker>[
    Marker(markerId: MarkerId("outletpoint"),
        position: LatLng(double.tryParse(chekinoutlet.checkinlat),double.tryParse(chekinoutlet.checkinlong),
        ))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Text(
          'Outlet Details',
          style: TextStyle(color: orange),
        ),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: Stack(
        children: [
          BackGround(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                OutLetContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height/6,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: GoogleMap(
                            zoomControlsEnabled: false,
                            zoomGesturesEnabled: true,
                            markers:Set<Marker>.of(_markers),
                            initialCameraPosition: CameraPosition(target: LatLng(double.tryParse(chekinoutlet.checkinlat),double.tryParse(chekinoutlet.checkinlong)), zoom: 15),
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),
                      OutLetContent(
                        ooutletid: chekinoutlet.checkinoutletid,
                        omarketname: chekinoutlet.checkinoutletname,
                        oarea: chekinoutlet.checkinarea,
                        ocity: chekinoutlet.checkincity,
                        ostate: chekinoutlet.checkinstate,
                        ocountry: chekinoutlet.checkincountry,
                        onumber: "+91 9775411055",
                        odistance: (chekinoutlet.currentdistance/1000).toStringAsFixed(2),
                        olastvisit: "today",
                        oproductivity: "50%",
                        oprogramname: "Tang 2019",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                OutLetContainer(
                  child: BarChatData(),
                ),
                SizedBox(height: 30,),
                CheckIn(),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class OutLetContent extends StatelessWidget {
  OutLetContent({
    this.omarketname,
    this.oarea,
    this.olastvisit,
    this.onumber,
    this.oproductivity,
    this.oprogramname,
    this.odistance,
    this.ooutletid,
    this.ocity,
    this.ocountry,
    this.ostate,
  });
  final ooutletid;
  final omarketname;
  final oarea;
  final ocity;
  final ostate;
  final ocountry;
  final onumber;
  final odistance;
  final oproductivity;
  final oprogramname;
  final olastvisit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Text(
              '[$ooutletid]',
              style: TextStyle( fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5,),
            Text(
              omarketname,
              style: TextStyle( fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Text(oarea),SizedBox(width: 5,),Text(ocity),SizedBox(width: 5,),Text(ostate),SizedBox(width: 5,),Text(ocountry),
          ],
        ),
        SizedBox(height: 5,),
        Table(
          columnWidths: {
            0: FlexColumnWidth(2.5),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(2),
          },
          children: [
            TableRow(children: [
              Text('Contact Number',
                  ),
              Text(":"),
              Text(onumber, style: TextStyle(color: orange)),
            ]),
            TableRow(children: [
              Text('Programme Name',
                  ),
              Text(":"),
              Text(oprogramname, style: TextStyle(color: orange)),
            ]),
            TableRow(children: [
              Text('Distance',
                  ),
              Text(":"),
              Row(
                children: [
                  Text(odistance.toString(), style: TextStyle(color: orange)),
                  Text("KM",style: TextStyle(color: orange))
                ],
              ),
            ]),
            TableRow(children: [
              Text('Coverage Productivity %',),
              Text(":"),
              Text(oproductivity, style: TextStyle(color: orange)),
            ]),
            TableRow(children: [
              Text('Last Visit',),
              Text(":"),
              Text(olastvisit, style: TextStyle(color: orange)),
            ]),
          ],
        ),
      ],
    );
  }
}

class OutLetContainer extends StatelessWidget {
  OutLetContainer({
    this.child,this.height
  });
  final child;
  final height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: height,
        width: MediaQuery.of(context).size.width / 1.05,
        decoration: BoxDecoration(
          color: pink,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
