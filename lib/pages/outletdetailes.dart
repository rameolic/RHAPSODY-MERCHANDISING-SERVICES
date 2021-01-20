import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
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
                      height: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: GoogleMapsWidget(),
                      ),
                    ),

                    SizedBox(height: 10,),
                    OutLetContent(
                      marketname: "[8045] Umm Al Sheif Market",
                      address: "10-7/207, Al Meydan Street,Dubai",
                      number: "+91 9775411055",
                      distance: "4.5kms",
                      lastvisit: "today",
                      productivity: "50%",
                      programname: "Tang 2019",
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
            ],
          ),
        ],
      ),
    );
  }
}

class OutLetContent extends StatelessWidget {
  OutLetContent({
    this.marketname,
    this.address,
    this.lastvisit,
    this.number,
    this.productivity,
    this.programname,
    this.distance,
  });
  final marketname;
  final address;
  final number;
  final distance;
  final productivity;
  final programname;
  final lastvisit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          marketname,
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        Text(address,
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
              Text(number, style: TextStyle(color: orange)),
            ]),
            TableRow(children: [
              Text('Programme Name',
                  style: TextStyle(
                    fontSize: 13.0,
                  )),
              Text(":"),
              Text(programname, style: TextStyle(color: orange)),
            ]),
            TableRow(children: [
              Text('Distance',
                  style: TextStyle(
                    fontSize: 13.0,
                  )),
              Text(":"),
              Text(distance, style: TextStyle(color: orange)),
            ]),
            TableRow(children: [
              Text('Coverage Productivity %',
                  style: TextStyle(
                    fontSize: 13.0,
                  )),
              Text(":"),
              Text(productivity, style: TextStyle(color: orange)),
            ]),
            TableRow(children: [
              Text('Last Visit',
                  style: TextStyle(
                    fontSize: 13.0,
                  )),
              Text(":"),
              Text(lastvisit, style: TextStyle(color: orange)),
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
