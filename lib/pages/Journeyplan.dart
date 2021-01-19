import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/ramkumar/StudioProjects/RHAPSODY-MERCHANDISING-SERVICES/lib/pages/MenuContent.dart';
import 'outletdetailes.dart';
class JourneyPlan extends StatefulWidget {
  @override
  _JourneyPlanState createState() => _JourneyPlanState();
}

class _JourneyPlanState extends State<JourneyPlan> {
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
                      TextColor:
                          pressTODAY == true ? Colors.white : Colors.black,
                      Containercolor:
                          pressTODAY == true ? orange : Colors.white,
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
                      TextColor:
                          pressWeek == true ? Colors.white : Colors.black,
                      Containercolor: pressWeek == true ? orange : Colors.white,
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
                      TextColor:
                          pressCustomers == true ? Colors.white : Colors.black,
                      Containercolor:
                          pressCustomers == true ? orange : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              DefaultTabController(
                  length: 3, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TabBar(
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          indicatorColor: orange,
                          tabs: [
                            Tab(text: 'PLANNED'),
                            Tab(text: 'VISITED'),
                            Tab(text: 'SKIPPED'),
                          ],
                        ),
                        Container(
                          height: 500,
                          child: TabBarView(
                              children: <Widget>[
                            Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                  ),
                                  height: 40,
                                  width: 380,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 250,
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
                                                color: grey,
                                                fontSize: 13.0,
                                              ),
                                              suffixIcon:
                                                  Icon(CupertinoIcons.search),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 40,
                                        color: Colors.black,
                                        thickness: 2.00,
                                      ),
                                      Icon(
                                        CupertinoIcons.location_solid,
                                        size: 15,
                                      ),
                                      Text("MAP VIEW"),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    JurnyplanContent(
                                      MarketName: "[5478] Sheba Super Market",
                                      address: "9-5/65,Nad Al Sheba,Dubai",
                                      Number: "+918974581263",
                                      Distance: "1.1kms",
                                      onpress: (){
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => OutLet()));
                                      },
                                    ),
                                    JurnyplanContent(
                                      MarketName: "[7085]Fair Mart Super Market",
                                      address: "5-2/47,Al Tayar Building ,Dubai",
                                      Number: "+919885100237",
                                      Distance: "2.1kms",
                                      onpress: (){},
                                    ),
                                    JurnyplanContent(
                                      MarketName: "[1045] Al Quoz Market",
                                      address: "8-14/207,Al Meydan Road,Dubai",
                                      Number: "+9188561149100",
                                      Distance: "3.8Kms",
                                      onpress: (){},
                                    ),
                                    JurnyplanContent(
                                      MarketName: "[8045] Umm Al Sheif Market",
                                      address:
                                          "10-7/207, Al Meydan Street,Dubai",
                                      Number: "+91 9775411055",
                                      Distance: "4.5kms",
                                      onpress: (){},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              child: Center(
                                child: Text('Display Tab 2',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('Display Tab 3',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ]),
                        )
                      ])),
            ],
          ),
        ],
      ),
    );
  }
}

class JourneyPlanHeader extends StatelessWidget {
  JourneyPlanHeader(
      {this.chartext, this.icon, this.TextColor, this.Containercolor});
  final chartext;
  final icon;
  final TextColor;
  final Containercolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 115,
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Containercolor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, color: TextColor),
          SizedBox(
            width: 2,
          ),
          Text(
            chartext,
            style: TextStyle(
              fontSize: 12,
              color: TextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class JurnyplanContent extends StatelessWidget {
  JurnyplanContent({this.MarketName, this.address, this.Number, this.Distance,@required this.onpress});
  final MarketName;
  final address;
  final Number;
  final Distance;
  final onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: 100,
        width: 382,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              MarketName,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            Text(address,
                style: TextStyle(
                  fontSize: 15.0,
                )),
            Spacer(),
            Table(
              children: [
                TableRow(children: [
                  Text('Contact Number',
                      style: TextStyle(
                        fontSize: 13.0,
                      )),
                  Text(":"),
                  Text(Number, style: TextStyle(color: orange)),
                ]),
                TableRow(children: [
                  Text('Distance',
                      style: TextStyle(
                        fontSize: 13.0,
                      )),
                  Text(":"),
                  Text(Distance, style: TextStyle(color: orange)),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
