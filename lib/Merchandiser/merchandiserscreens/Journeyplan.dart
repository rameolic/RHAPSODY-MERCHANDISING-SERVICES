
import 'package:flutter/material.dart';
import '../../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Maps_Veiw.dart';
import 'outletdetailes.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/jpskiped.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/jpvisited.dart';
import 'package:merchandising/api/Journeyplansapi/todayplan/journeyplanapi.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/weeklyjpwidgets/weeklyjp.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/weeklyjpwidgets/weeklyskipjp.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/weeklyjpwidgets/weeklyvisitjp.dart';


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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Journey Plan',
              style: TextStyle(color: orange),
            ),
            GestureDetector(
                onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MapVeiw()));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10.00),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.circular(10.00),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.location_solid,
                        size: 15,color: Colors.white,
                      ),
                      SizedBox(width: 5,),
                      Text("Map",style: TextStyle(fontSize: 15,color: Colors.white),),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
      // drawer: Drawer(
      //   child: Menu(),
      // ),
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
                            Tab(text: 'YET TO VISIT'),
                            Tab(text: 'VISITED'),
                          ],
                        ),
                      ),
                    ),
                    body: TabBarView(children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          /*
                          SizedBox(
                            height: 10,
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
                                        'Search by Store Code/Name',
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.0,
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
                          ), */
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(child: pressTODAY == true ? JourneyListBuilder() : pressWeek == true ? WeeklyJourneyListBuilder() : Center(child: Text("we have journey plan only for today and monthly only",)))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(child: pressTODAY == true ? SkipedJourneyListBuilder() : pressWeek == true ? WeeklySkipJourneyListBuilder() : Center(child: Text("we have journey plan only for today",)))
                        ],
                         ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(child: pressTODAY == true ? visitedJourneyListBuilder() : pressWeek == true ? WeeklyVisitJourneyListBuilder() : Center(child: Text("we have journey plan only for today",)))
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
      width: MediaQuery.of(context).size.width/3.5,
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
          SizedBox(
            width: MediaQuery.of(context).size.width/6,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                chartext,
                style: TextStyle(
                  color: textcolor,
                ),
                textAlign: TextAlign.center,maxLines: 2,
              ),
            ),
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
  bool isApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    return  ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }
  Widget _uiSetup(BuildContext context) {
    return gettodayjp.storenames.length == 0 ? Center(child: Text("you dont have any active journey plan\ncontact your manager for more info",textAlign: TextAlign.center,)) :
    ListView.builder(
        itemCount:gettodayjp.storenames.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async{
             setState(() {
               isApiCallProcess = true;
              });
             Currenttimesheetid =
             outletrequestdata.outletidpressed = gettodayjp.outletids[index];
             checkinoutdata.checkid = gettodayjp.id[index];
             var data = await outletwhencheckin();
             if(data != null ){
              await Navigator.push(
                   context,
                   MaterialPageRoute(
                       // ignore: non_constant_identifier_names
                       builder: (BuildContextcontext) => OutLet()));

               setState(() {
                 isApiCallProcess = false;
               });
             }else{
               setState(() {
                 isApiCallProcess = false;
               });
             }
             print(checkinoutdata.checkid);
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '[${gettodayjp.storecodes[index]}]',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${gettodayjp.storenames[index]}',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      gettodayjp.isscheduled[index] == 0 ? Text(
                        '(unscheduled)',
                        style: TextStyle(
                            fontSize: 13.0,color: orange),
                      ) :SizedBox(),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text('${gettodayjp.outletarea[index]}',
                          style: TextStyle(
                            fontSize: 15.0,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${gettodayjp.outletcity[index]}',
                          style: TextStyle(
                            fontSize: 15.0,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${gettodayjp.outletcountry[index]}',
                          style: TextStyle(
                            fontSize: 15.0,
                          )),
                    ],
                  ),
                  Spacer(),
                  Table(
                    children: [
                      TableRow(children: [
                        Text('Contact Number :',
                            style: TextStyle(
                              fontSize: 13.0,
                            )),
                        Text('${gettodayjp.contactnumbers[index]}',
                            style: TextStyle(color: orange)),
                      ]),
                      TableRow(children: [
                        Text('Distance :',
                            style: TextStyle(
                              fontSize: 13.0,
                            )),
                        Row(
                          children: [
                            Text('${gettodayjp.distanceinmeters[index].toStringAsFixed(2)}',
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

