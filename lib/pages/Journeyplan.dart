import 'package:flutter/material.dart';
import 'package:merchandising/model/Location_service.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'Maps_Veiw.dart';
import 'outletdetailes.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:geolocator/geolocator.dart';

class JourneyPlan extends StatefulWidget {
  @override
  _JourneyPlanState createState() => _JourneyPlanState();
}

class _JourneyPlanState extends State<JourneyPlan> {
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
                          Container(
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
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                MapVeiw()));
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
                            height: 5,
                          ),
                          Expanded(child : JourneyListBuilder()),
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
  final List<int> outletid = <int>[
    JPResponsedata.outletiddata,
  ];
  final List<String> names = <String>[
    JPResponsedata.outletnamedata,
  ];
  final List<String> area = <String>[
    JPResponsedata.outletareadata,
  ];
  final List<String> city = <String>[
    JPResponsedata.outletcitydata,
  ];
  final List<String> country = <String>[
    JPResponsedata.outletcountrydata,
  ];
  final List<int> contactnumber = <int>[1];
  final List<String> distancenum = <String>[
    '5.33',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: names.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => OutLet()));
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
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
                        '[${outletid[index]}]',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5,),
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
                      SizedBox(width: 5,),
                      Text('${city[index]}',
                          style: TextStyle(
                            fontSize: 15.0,
                          )),
                      SizedBox(width: 5,),
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
                        Text('${distancenum[index]}',
                            style: TextStyle(color: orange)),
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

