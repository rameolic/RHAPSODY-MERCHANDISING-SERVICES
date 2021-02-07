
import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'package:merchandising/model/distanceinmeters.dart';
import 'outletdetailes.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/api/jprequest.dart';
import 'package:merchandising/ProgressHUD.dart';

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
                            height: 5,
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
                      Container(
                        child: Center(
                          child: Text('Display Tab 2',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('Display Tab 3',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
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
  static final List<int> outletids = <int>[
    JPResponsedata.outletiddata1,
    JPResponsedata.outletiddata2,
    JPResponsedata.outletiddata3,
    JPResponsedata.outletiddata4,
    JPResponsedata.outletiddata5,
    JPResponsedata.outletiddata6,
    JPResponsedata.outletiddata7,
    JPResponsedata.outletiddata8,
    JPResponsedata.outletiddata9,
    JPResponsedata.outletiddata10,
    JPResponsedata.outletiddata11,
    JPResponsedata.outletiddata12,
    JPResponsedata.outletiddata13,
    JPResponsedata.outletiddata14,
    JPResponsedata.outletiddata15,
    JPResponsedata.outletiddata16,
    JPResponsedata.outletiddata17,
    JPResponsedata.outletiddata18,
    JPResponsedata.outletiddata19,
    JPResponsedata.outletiddata20,
  ];
  final List<String> names = <String>[
    JPResponsedata.outletnamedata1,
    JPResponsedata.outletnamedata2,
    JPResponsedata.outletnamedata3,
    JPResponsedata.outletnamedata4,
    JPResponsedata.outletnamedata5,
    JPResponsedata.outletnamedata6,
    JPResponsedata.outletnamedata7,
    JPResponsedata.outletnamedata8,
    JPResponsedata.outletnamedata9,
    JPResponsedata.outletnamedata10,
    JPResponsedata.outletnamedata11,
    JPResponsedata.outletnamedata12,
    JPResponsedata.outletnamedata13,
    JPResponsedata.outletnamedata14,
    JPResponsedata.outletnamedata15,
    JPResponsedata.outletnamedata16,
    JPResponsedata.outletnamedata17,
    JPResponsedata.outletnamedata18,
    JPResponsedata.outletnamedata19,
    JPResponsedata.outletnamedata20,
  ];
  final List<String> area = <String>[
    JPResponsedata.outletareadata1,
    JPResponsedata.outletareadata2,
    JPResponsedata.outletareadata3,
    JPResponsedata.outletareadata4,
    JPResponsedata.outletareadata5,
    JPResponsedata.outletareadata6,
    JPResponsedata.outletareadata7,
    JPResponsedata.outletareadata8,
    JPResponsedata.outletareadata9,
    JPResponsedata.outletareadata10,
    JPResponsedata.outletareadata11,
    JPResponsedata.outletareadata12,
    JPResponsedata.outletareadata13,
    JPResponsedata.outletareadata14,
    JPResponsedata.outletareadata15,
    JPResponsedata.outletareadata16,
    JPResponsedata.outletareadata17,
    JPResponsedata.outletareadata18,
    JPResponsedata.outletareadata19,
    JPResponsedata.outletareadata20,
  ];
  final List<String> city = <String>[
    JPResponsedata.outletcitydata1,
    JPResponsedata.outletcitydata2,
    JPResponsedata.outletcitydata3,
    JPResponsedata.outletcitydata4,
    JPResponsedata.outletcitydata5,
    JPResponsedata.outletcitydata6,
    JPResponsedata.outletcitydata7,
    JPResponsedata.outletcitydata8,
    JPResponsedata.outletcitydata9,
    JPResponsedata.outletcitydata10,
    JPResponsedata.outletcitydata11,
    JPResponsedata.outletcitydata12,
    JPResponsedata.outletcitydata13,
    JPResponsedata.outletcitydata14,
    JPResponsedata.outletcitydata15,
    JPResponsedata.outletcitydata16,
    JPResponsedata.outletcitydata17,
    JPResponsedata.outletcitydata18,
    JPResponsedata.outletcitydata19,
    JPResponsedata.outletcitydata20,
  ];
  final List<String> country = <String>[
    JPResponsedata.outletcountrydata1,
    JPResponsedata.outletcountrydata2,
    JPResponsedata.outletcountrydata3,
    JPResponsedata.outletcountrydata4,
    JPResponsedata.outletcountrydata5,
    JPResponsedata.outletcountrydata6,
    JPResponsedata.outletcountrydata7,
    JPResponsedata.outletcountrydata8,
    JPResponsedata.outletcountrydata9,
    JPResponsedata.outletcountrydata10,
    JPResponsedata.outletcountrydata11,
    JPResponsedata.outletcountrydata12,
    JPResponsedata.outletcountrydata13,
    JPResponsedata.outletcountrydata14,
    JPResponsedata.outletcountrydata15,
    JPResponsedata.outletcountrydata16,
    JPResponsedata.outletcountrydata17,
    JPResponsedata.outletcountrydata18,
    JPResponsedata.outletcountrydata19,
    JPResponsedata.outletcountrydata20,
  ];
  final List<int> contactnumber = <int>[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20
  ];
  final List<String> distancenum = <String>[
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
    int countOutlet = 0;
    for (final outletid in outletids) {
      if (outletid != null) {
        countOutlet++;
      }
    }
    print(countOutlet);
    return countOutlet;
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
        itemCount: itemsno(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
             setState(() {
               isApiCallProcess = true;
              });
             outletrequestdata.outletidpressed = outletids[index];
             outletwhencheckin();
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