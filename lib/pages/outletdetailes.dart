import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'Journeyplan.dart';
import 'package:merchandising/model/OutLet_BarChart.dart';
import 'package:merchandising/model/google_maps.dart';

class OutLet extends StatefulWidget {
  @override
  _OutLetState createState() => _OutLetState();
}

class _OutLetState extends State<OutLet> {

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
          Column(
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
                      height: 170,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: GoogleMapsWidget(),
                      ),
                    ),

                    SizedBox(height: 10,),
                    OutLetContent(
                      omarketname: "[8045] Umm Al Sheif Market",
                      oaddress: "10-7/207, Al Meydan Street,Dubai",
                      onumber: "+91 9775411055",
                      odistance: "4.5kms",
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
              Container(
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.only(right: 10.0) ,
                decoration: BoxDecoration(
                  color: pink,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Check In",style: TextStyle(fontSize: 16,color: orange,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OutLetContent extends StatelessWidget {
  OutLetContent({
    this.omarketname,
    this.oaddress,
    this.olastvisit,
    this.onumber,
    this.oproductivity,
    this.oprogramname,
    this.odistance,
  });
  final omarketname;
  final oaddress;
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
        Text(
          omarketname,
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        Text(oaddress,
            style: TextStyle(
              fontSize: 15.0,
            )),
        Table(
          columnWidths: {
            0: FlexColumnWidth(2.5),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(2),
          },
          children: [
            TableRow(children: [
              Text('Contact Number',
                  style: TextStyle(
                    fontSize: 13.0,
                  )),
              Text(":"),
              Text(onumber, style: TextStyle(color: orange)),
            ]),
            TableRow(children: [
              Text('Programme Name',
                  style: TextStyle(
                    fontSize: 13.0,
                  )),
              Text(":"),
              Text(oprogramname, style: TextStyle(color: orange)),
            ]),
            TableRow(children: [
              Text('Distance',
                  style: TextStyle(
                    fontSize: 13.0,
                  )),
              Text(":"),
              Text(odistance, style: TextStyle(color: orange)),
            ]),
            TableRow(children: [
              Text('Coverage Productivity %',
                  style: TextStyle(
                    fontSize: 13.0,
                  )),
              Text(":"),
              Text(oproductivity, style: TextStyle(color: orange)),
            ]),
            TableRow(children: [
              Text('Last Visit',
                  style: TextStyle(
                    fontSize: 13.0,
                  )),
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
