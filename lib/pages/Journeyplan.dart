
import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'package:merchandising/model/distanceinmeters.dart';
import 'outletdetailes.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/api/jprequest.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/pages/jppages/jpskiped.dart';
import 'package:merchandising/pages/jppages/jpvisited.dart';

class JourneyPlan extends StatefulWidget {
  @override
  _JourneyPlanState createState() => _JourneyPlanState();
}

class _JourneyPlanState extends State<JourneyPlan> {
  bool isApiCallProcess = false;
  int index;
  bool pressWeek = false;
  bool pressTODAY = true;
  bool pressCustomers = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Text(
          'Journey Plan',
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
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        pressTODAY = true;
                        pressCustomers = false;
                        pressWeek = false;
                      });
                    },
                    child: JourneyPlanHeader(
                      icon: Icons.calendar_today,
                      chartext: "Today's\nJourney Plan",
                      textcolor:
                      pressTODAY == true ? Colors.white : Colors.black,
                      containercolor: pressTODAY == true ? orange : pink,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        pressTODAY = false;
                        pressCustomers = false;
                        pressWeek = true;
                      });
                    },
                    child: JourneyPlanHeader(
                      icon: Icons.calendar_today_outlined,
                      chartext: " This Week's\nJounery Plan",
                      textcolor:
                      pressWeek == true ? Colors.white : Colors.black,
                      containercolor: pressWeek == true ? orange : pink,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        pressTODAY = false;
                        pressCustomers = true;
                        pressWeek = false;
                      });
                    },
                    child: JourneyPlanHeader(
                      icon: Icons.group,
                      chartext: "My\nCustomers",
                      textcolor:
                      pressCustomers == true ? Colors.white : Colors.black,
                      containercolor: pressCustomers == true ? orange : pink,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: DefaultTabController(
                  length: 3, // length of tabs
                  initialIndex: 0,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(kToolbarHeight),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: TabBar(
                          labelColor: orange,
                          unselectedLabelColor: Colors.black,
                          indicatorColor: orange,
                          tabs: [
                            Tab(text: 'PLANNED'),
                            Tab(text: 'VISITED'),
                            Tab(text: 'SKIPPED'),
                          ],
                        ),
                      ),
                    ),
                    body: TabBarView(children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                         /* Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              color: pink,
                            ),
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                 Expanded(
                                  child: Theme(
                                    data: ThemeData(primaryColor: orange),
                                    child: TextField(
                                      cursorColor: orange,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusColor: Colors.black,
                                        hintText:
                                        'Search by Customer Code/Name',
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.0,
                                        ),
                                        suffixIcon: Icon(
                                          CupertinoIcons.search,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {/*
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                MapVeiw())); */
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.location_solid,
                                        size: 15,
                                      ),
                                      Text("MAP VIEW"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ), */
                          Expanded(child: pressTODAY == true ? JourneyListBuilder() : Center(child: Text("we have journey plan only for today",)))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(child: pressTODAY == true ? visitedJourneyListBuilder() : Center(child: Text("we have journey plan only for today",)))
                        ],
                         ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(child: pressTODAY == true ? SkipedJourneyListBuilder() : Center(child: Text("we have journey plan only for today",)))
                        ],
                      ),
                          ]),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

class JourneyPlanHeader extends StatelessWidget {
  JourneyPlanHeader(
      {this.chartext, this.icon, this.textcolor, this.containercolor});
  final chartext;
  final icon;
  final textcolor;
  final containercolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 115,
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: containercolor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, color: textcolor),
          SizedBox(
            width: 2,
          ),
          Text(
            chartext,
            style: TextStyle(
              fontSize: 12,
              color: textcolor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class JourneyListBuilder extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<JourneyListBuilder> {
    List<int> ids = <int>[
    JPResponsePlanneddata.id1,
    JPResponsePlanneddata.id2,
    JPResponsePlanneddata.id3,
    JPResponsePlanneddata.id4,
    JPResponsePlanneddata.id5,
    JPResponsePlanneddata.id6,
    JPResponsePlanneddata.id7,
    JPResponsePlanneddata.id8,
    JPResponsePlanneddata.id9,
    JPResponsePlanneddata.id10,
    JPResponsePlanneddata.id11,
    JPResponsePlanneddata.id12,
    JPResponsePlanneddata.id13,
    JPResponsePlanneddata.id14,
    JPResponsePlanneddata.id15,
    JPResponsePlanneddata.id16,
    JPResponsePlanneddata.id17,
    JPResponsePlanneddata.id18,
    JPResponsePlanneddata.id19,
    JPResponsePlanneddata.id20,
  ];
    List<int> outletids = <int>[
    JPResponsePlanneddata.outletiddata1,
    JPResponsePlanneddata.outletiddata2,
    JPResponsePlanneddata.outletiddata3,
    JPResponsePlanneddata.outletiddata4,
    JPResponsePlanneddata.outletiddata5,
    JPResponsePlanneddata.outletiddata6,
    JPResponsePlanneddata.outletiddata7,
    JPResponsePlanneddata.outletiddata8,
    JPResponsePlanneddata.outletiddata9,
    JPResponsePlanneddata.outletiddata10,
    JPResponsePlanneddata.outletiddata11,
    JPResponsePlanneddata.outletiddata12,
    JPResponsePlanneddata.outletiddata13,
    JPResponsePlanneddata.outletiddata14,
    JPResponsePlanneddata.outletiddata15,
    JPResponsePlanneddata.outletiddata16,
    JPResponsePlanneddata.outletiddata17,
    JPResponsePlanneddata.outletiddata18,
    JPResponsePlanneddata.outletiddata19,
    JPResponsePlanneddata.outletiddata20,
  ];
   List<String> names = <String>[
    JPResponsePlanneddata.outletnamedata1,
    JPResponsePlanneddata.outletnamedata2,
    JPResponsePlanneddata.outletnamedata3,
    JPResponsePlanneddata.outletnamedata4,
    JPResponsePlanneddata.outletnamedata5,
    JPResponsePlanneddata.outletnamedata6,
    JPResponsePlanneddata.outletnamedata7,
    JPResponsePlanneddata.outletnamedata8,
    JPResponsePlanneddata.outletnamedata9,
    JPResponsePlanneddata.outletnamedata10,
    JPResponsePlanneddata.outletnamedata11,
    JPResponsePlanneddata.outletnamedata12,
    JPResponsePlanneddata.outletnamedata13,
    JPResponsePlanneddata.outletnamedata14,
    JPResponsePlanneddata.outletnamedata15,
    JPResponsePlanneddata.outletnamedata16,
    JPResponsePlanneddata.outletnamedata17,
    JPResponsePlanneddata.outletnamedata18,
    JPResponsePlanneddata.outletnamedata19,
    JPResponsePlanneddata.outletnamedata20,
  ];
   List<String> area = <String>[
    JPResponsePlanneddata.outletareadata1,
    JPResponsePlanneddata.outletareadata2,
    JPResponsePlanneddata.outletareadata3,
    JPResponsePlanneddata.outletareadata4,
    JPResponsePlanneddata.outletareadata5,
    JPResponsePlanneddata.outletareadata6,
    JPResponsePlanneddata.outletareadata7,
    JPResponsePlanneddata.outletareadata8,
    JPResponsePlanneddata.outletareadata9,
    JPResponsePlanneddata.outletareadata10,
    JPResponsePlanneddata.outletareadata11,
    JPResponsePlanneddata.outletareadata12,
    JPResponsePlanneddata.outletareadata13,
    JPResponsePlanneddata.outletareadata14,
    JPResponsePlanneddata.outletareadata15,
    JPResponsePlanneddata.outletareadata16,
    JPResponsePlanneddata.outletareadata17,
    JPResponsePlanneddata.outletareadata18,
    JPResponsePlanneddata.outletareadata19,
    JPResponsePlanneddata.outletareadata20,
  ];
   List<String> city = <String>[
    JPResponsePlanneddata.outletcitydata1,
    JPResponsePlanneddata.outletcitydata2,
    JPResponsePlanneddata.outletcitydata3,
    JPResponsePlanneddata.outletcitydata4,
    JPResponsePlanneddata.outletcitydata5,
    JPResponsePlanneddata.outletcitydata6,
    JPResponsePlanneddata.outletcitydata7,
    JPResponsePlanneddata.outletcitydata8,
    JPResponsePlanneddata.outletcitydata9,
    JPResponsePlanneddata.outletcitydata10,
    JPResponsePlanneddata.outletcitydata11,
    JPResponsePlanneddata.outletcitydata12,
    JPResponsePlanneddata.outletcitydata13,
    JPResponsePlanneddata.outletcitydata14,
    JPResponsePlanneddata.outletcitydata15,
    JPResponsePlanneddata.outletcitydata16,
    JPResponsePlanneddata.outletcitydata17,
    JPResponsePlanneddata.outletcitydata18,
    JPResponsePlanneddata.outletcitydata19,
    JPResponsePlanneddata.outletcitydata20,
  ];
   List<String> country = <String>[
    JPResponsePlanneddata.outletcountrydata1,
    JPResponsePlanneddata.outletcountrydata2,
    JPResponsePlanneddata.outletcountrydata3,
    JPResponsePlanneddata.outletcountrydata4,
    JPResponsePlanneddata.outletcountrydata5,
    JPResponsePlanneddata.outletcountrydata6,
    JPResponsePlanneddata.outletcountrydata7,
    JPResponsePlanneddata.outletcountrydata8,
    JPResponsePlanneddata.outletcountrydata9,
    JPResponsePlanneddata.outletcountrydata10,
    JPResponsePlanneddata.outletcountrydata11,
    JPResponsePlanneddata.outletcountrydata12,
    JPResponsePlanneddata.outletcountrydata13,
    JPResponsePlanneddata.outletcountrydata14,
    JPResponsePlanneddata.outletcountrydata15,
    JPResponsePlanneddata.outletcountrydata16,
    JPResponsePlanneddata.outletcountrydata17,
    JPResponsePlanneddata.outletcountrydata18,
    JPResponsePlanneddata.outletcountrydata19,
    JPResponsePlanneddata.outletcountrydata20,
  ];
   List<String> contactnumber = <String>[
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480'
  ];
   List<String> distancenum = <String>[
    distinkm.distancetooutlet1 != null
        ? distinkm.distancetooutlet1.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet2 != null
        ? distinkm.distancetooutlet2.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet3 != null
        ? distinkm.distancetooutlet3.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet4 != null
        ? distinkm.distancetooutlet4.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet5 != null
        ? distinkm.distancetooutlet5.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet6 != null
        ? distinkm.distancetooutlet6.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet7 != null
        ? distinkm.distancetooutlet7.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet8 != null
        ? distinkm.distancetooutlet8.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet9 != null
        ? distinkm.distancetooutlet9.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet10 != null
        ? distinkm.distancetooutlet10.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet11 != null
        ? distinkm.distancetooutlet11.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet12 != null
        ? distinkm.distancetooutlet12.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet13 != null
        ? distinkm.distancetooutlet13.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet14 != null
        ? distinkm.distancetooutlet14.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet15 != null
        ? distinkm.distancetooutlet15.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet16 != null
        ? distinkm.distancetooutlet16.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet17 != null
        ? distinkm.distancetooutlet17.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet18 != null
        ? distinkm.distancetooutlet18.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet19 != null
        ? distinkm.distancetooutlet19.toStringAsFixed(2)
        : null,
    distinkm.distancetooutlet20 != null
        ? distinkm.distancetooutlet20.toStringAsFixed(2)
        : null,
  ];

  int itemsno() {
    outletids.forEach((elements) => (null));
    countoutlets.outletscount = 0;
    for (final outletid in names) {
      if (outletid != null) {
        countoutlets.outletscount++;
      }
    }
    print(countoutlets.outletscount);
    return countoutlets.outletscount;
  }

  bool isApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    return  ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.1,
    );
  }
  Widget _uiSetup(BuildContext context) {
    return itemsno() == 0 ? Center(child: Text("you dont have any active journey plan\ncontact your manager for more info",textAlign: TextAlign.center,)) :
    ListView.builder(
        itemCount: countoutlets.outletscount,//itemsno(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
             setState(() {
               isApiCallProcess = true;
              });
             outletrequestdata.outletidpressed = outletids[index];
             outletwhencheckin();
             checkinoutdata.checkid = ids[index];
             print(checkinoutdata.checkid);
              Future.delayed(const Duration(seconds: 3), () {
                if (chekinoutlet.checkinlat != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContextcontext) => OutLet()));
                  setState(() {
                    isApiCallProcess = false;
                  });
                } else if (chekinoutlet.checkinlat != null) {
                  Future.delayed(const Duration(seconds: 5), () {
                    setState(() {
                      isApiCallProcess = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContextcontext) => OutLet()));
                  });
                }
                else{
                  setState(() {
                    isApiCallProcess = false;
                  });
                }
              });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '[${outletids[index]}]',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${names[index]}',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text('${area[index]}',
                          style: TextStyle(
                            fontSize: 15.0,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${city[index]}',
                          style: TextStyle(
                            fontSize: 15.0,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${country[index]}',
                          style: TextStyle(
                            fontSize: 15.0,
                          )),
                    ],
                  ),
                  Spacer(),
                  Table(
                    children: [
                      TableRow(children: [
                        Text('Contact Number',
                            style: TextStyle(
                              fontSize: 13.0,
                            )),
                        Text(":"),
                        Text('${contactnumber[index]}',
                            style: TextStyle(color: orange)),
                      ]),
                      TableRow(children: [
                        Text('Distance',
                            style: TextStyle(
                              fontSize: 13.0,
                            )),
                        Text(":"),
                        Row(
                          children: [
                            Text('${distancenum[index]}',
                                style: TextStyle(color: orange)),
                            Text("KM", style: TextStyle(color: orange))
                          ],
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class countoutlets {
  static int outletscount;
}