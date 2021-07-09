import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:merchandising/HR/HRdashboard.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/api/api_service.dart';
import '../../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'checkin.dart';
import 'package:merchandising/model/OutLet_BarChart.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:merchandising/model/Location_service.dart';

// ignore: must_be_immutable
class OutLet extends StatefulWidget {
  double currentdist;
  @override
  _OutLetState createState() => _OutLetState();
}

class checkedoutlet {
  static bool checkoutlet = false;
}

class _OutLetState extends State<OutLet> {
  List<Marker> _markers = <Marker>[
    Marker(markerId: MarkerId("outletpoint"),
        position: LatLng(double.tryParse(chekinoutlet.checkinlat),double.tryParse(chekinoutlet.checkinlong),
        ))
  ];
  double distance = chekinoutlet.currentdistance/1000;
  bool isApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      opacity: 0.3,
      inAsyncCall:isApiCallProcess,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: containerscolor,
          iconTheme: IconThemeData(color: orange),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Outlet Details',
                    style: TextStyle(color: orange),
                  ),
                  EmpInfo()
                ],
              ),
              IconButton(icon: Icon(CupertinoIcons.refresh_circled_solid,color: orange,size: 30,), onPressed: ()async{
                setState(() {
                  isApiCallProcess = true;
                });
                await getLocation();
                await outletwhencheckin();
                setState((){
                  print(chekinoutlet.currentdistance/1000);
                  distance = chekinoutlet.currentdistance/1000;
                  isApiCallProcess = false;
                });
                print("distance : $distance");
                setState(() {
                  isApiCallProcess = false;
                });
              })
            ],
          ),
        ),
        // drawer: Drawer(
        //   child: Menu(),
        // ),
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
                          height: MediaQuery.of(context).size.height/5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: GoogleMap(
                              zoomControlsEnabled: false,
                              zoomGesturesEnabled: true,
                              myLocationButtonEnabled: false,
                              markers:Set<Marker>.of(_markers),
                              initialCameraPosition: CameraPosition(target: LatLng(double.tryParse(chekinoutlet.checkinlat),double.tryParse(chekinoutlet.checkinlong)), zoom: 15),
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(
                                    '[${chekinoutlet.checkinoutletid}]',
                                    style: TextStyle( fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    chekinoutlet.checkinoutletname,
                                    style: TextStyle( fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Text(chekinoutlet.checkinaddress),
                            Row(
                              children: [
                                Text(chekinoutlet.checkinarea),SizedBox(width: 5,),Text(chekinoutlet.checkincity),SizedBox(width: 5,),Text(chekinoutlet.checkinstate),SizedBox(width: 5,),Text(chekinoutlet.checkincountry),
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
                                  SelectableText(chekinoutlet.contactnumber.toString(), style: TextStyle(color: orange)),
                                ]),
                                // TableRow(children: [Text('Programme Name',Text(":"),Text(oprogramname, style: TextStyle(color: orange)),]),
                                TableRow(children: [
                                  Text('Distance',
                                  ),
                                  Text(":"),
                                  Row(
                                    children: [
                                      Text((distance).toStringAsFixed(2).toString(), style: TextStyle(color: orange)),
                                      Text("KM",style: TextStyle(color: orange))
                                    ],
                                  ),
                                ]),
                                //TableRow(children: [Text('Coverage Productivity %',),Text(":"),Text(oproductivity, style: TextStyle(color: orange)),]),
                                //TableRow(children: [Text('Last Visit',),Text(":"), Text(olastvisit, style: TextStyle(color: orange)),]),
                              ],
                            ),
                          ],
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
      ),
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
