import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/api/timesheetapi.dart';

class TimeSheetList extends StatefulWidget {
  @override
  _TimeSheetListState createState() => _TimeSheetListState();
}

class _TimeSheetListState extends State<TimeSheetList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Row(
          children: [
            Text(
              'Time Sheet',
              style: TextStyle(color: orange),
            ),
            Spacer(),
          ],
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Text(
                        "Merchandiser Name:",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(DBrequestdata.empname,
                          style: TextStyle(fontSize: 18, color: Colors.white))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Text(
                        "Merchandiser ID :",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(DBrequestdata.receivedempid,
                          style: TextStyle(fontSize: 18, color: Colors.white))
                    ],
                  ),
                ),
                /*Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Feild Manager :",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Client :",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),*/
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                      height: MediaQuery.of(context).size.height / 1.4,
                      width: double.infinity,
                      child: TimeSheetListBuilder()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TimeSheetListBuilder extends StatefulWidget {
  @override
  _TimeSheetListBuilderState createState() => _TimeSheetListBuilderState();
}

class _TimeSheetListBuilderState extends State<TimeSheetListBuilder> {
  @override
  static final List<String> dates = <String>[
    TimeSheetdata.date,
  ];
  bool pressed = false;
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dates.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          pressed == false ? pressed = true : pressed = false;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            pressed == false
                                ? CupertinoIcons.arrowtriangle_right_fill
                                : CupertinoIcons.arrowtriangle_down_fill,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${dates[index]}',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    pressed == true
                        ? Column(
                            children: [
                              Table(
                                columnWidths: {
                                  0: FractionColumnWidth(0.4),
                                  1: FractionColumnWidth(0.3),
                                  2: FractionColumnWidth(0.3),
                                },
                                children: [
                                  TableRow(children: [
                                    Center(
                                      child: Text(
                                        'Outlet Name',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Center(
                                      child: Text('checkin time',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Center(
                                      child: Text('checkout time',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ]),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              daytimesheet(),
                            ],
                          )
                        : SizedBox()
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          );
        });
  }
}

class daytimesheet extends StatefulWidget {
  @override
  _daytimesheetState createState() => _daytimesheetState();
}

class _daytimesheetState extends State<daytimesheet> {
  static final List<String> outlet = <String>[
    TimeSheetdata.outletname,
    TimeSheetdata.outletname2,
    TimeSheetdata.outletname3,
    TimeSheetdata.outletname4,
    TimeSheetdata.outletname5,
    TimeSheetdata.outletname6,
    TimeSheetdata.outletname7,
    TimeSheetdata.outletname8,
    TimeSheetdata.outletname9,
    TimeSheetdata.outletname10
  ];
  static final List<String> checkin = <String>[
    TimeSheetdata.checkintime,
    TimeSheetdata.checkintime2,
    TimeSheetdata.checkintime3,
    TimeSheetdata.checkintime4,
    TimeSheetdata.checkintime5,
    TimeSheetdata.checkintime6,
    TimeSheetdata.checkintime7,
    TimeSheetdata.checkintime8,
    TimeSheetdata.checkintime9,
    TimeSheetdata.checkintime10,

  ];
  static final List<String> checkout = <String>[
    TimeSheetdata.checkouttime,
    TimeSheetdata.checkouttime2,
    TimeSheetdata.checkouttime3,
    TimeSheetdata.checkouttime4,
    TimeSheetdata.checkouttime5,
    TimeSheetdata.checkouttime6,
    TimeSheetdata.checkouttime7,
    TimeSheetdata.checkouttime8,
    TimeSheetdata.checkouttime9,
    TimeSheetdata.checkouttime10,
  ];
  int itemsno() {
    outlet.forEach((elements) => (null));
    int countOutlet = 0;
    for (final outletids in outlet) {
      if (outletids != null) {
        countOutlet++;
      }
    }
    return countOutlet;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          itemCount: itemsno(),
          itemBuilder: (BuildContext context, int index) {
            return Table(
              columnWidths: {
                0: FractionColumnWidth(0.4),
                1: FractionColumnWidth(0.3),
                2: FractionColumnWidth(0.3),
              },
              children: [
                TableRow(children: [
                  Center(
                    child: Text(
                      '${outlet[index]}',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  Center(
                    child: Text('${checkin[index]}',
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                  ),
                  Center(
                    child: Text('${checkout[index]}',
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                  ),
                ]),
              ],
            );
          }),
    );
  }
}
