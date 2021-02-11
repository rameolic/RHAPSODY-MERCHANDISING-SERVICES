import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:merchandising/pages/Journeyplan.dart';
import 'package:merchandising/pages/MenuContent.dart';
import 'package:merchandising/api/jpskippedapi.dart';
import 'package:merchandising/api/JPvisitedapi.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'Startday.dart';
import 'package:merchandising/api/timesheetapi.dart';
import 'package:merchandising/pages/HQOne.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/pages/Leave Request.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/model/distanceinmeters.dart';
import 'dart:math';
import 'package:merchandising/pages/Time Sheet.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:merchandising/model/Location_service.dart';
import 'package:merchandising/api/jprequest.dart';
import 'package:merchandising/api/jpapi.dart';
import 'package:auto_size_text/auto_size_text.dart';

class leaves {
  static int remainingleaves = 1;
}
class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}
@override
class _DashBoardState extends State<DashBoard> {

  int shedulecalls = DBResponsedatadaily.shedulevisits;
  int unshedulecalls = DBResponsedatadaily.unshedulevisits;
  int shedulecallsdone = DBResponsedatadaily.ShedulevisitssDone;
  int unshedulecallsdone = DBResponsedatadaily.UnShedulevisitsDone;
  var workingtime = DBResponsedatadaily.WorkingTime;
  var Attendance =DBResponsedatadaily.Attendance;
  var EffectiveTime = DBResponsedatadaily.EffectiveTime;
  var TravelTime = DBResponsedatadaily.TravelTime;
  int todaypercentage =  DBResponsedatadaily.todayPlanpercentage;
  int monthpercentage = DBResponsedatamonthly.monthPlanpercentage;
  bool isApiCallProcess = false;
  bool pressAttentionMTB = true;
  bool pressAttentionTODAY = false;
  int Mshedulecalls = DBResponsedatamonthly.shedulevisits;
  int Munshedulecalls = DBResponsedatamonthly.unshedulevisits;
  int Mshedulecallsdone = DBResponsedatamonthly.ShedulevisitssDone;
  int Munshedulecallsdone = DBResponsedatamonthly.UnShedulevisitsDone;
  var Mworkingtime = DBResponsedatamonthly.WorkingTime;
  var MAttendance =DBResponsedatamonthly.Attendance;
  var MEffectiveTime = DBResponsedatamonthly.EffectiveTime;
  var MTravelTime = DBResponsedatamonthly.TravelTime;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        home: ProgressHUD(
          child: _uiSetup(context),
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
        ),
      ),
    );
  }
  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              height: 30,
              image: AssetImage('images/rmsLogo.png'),
            ),
            Row(
              children: [
                IconButton(icon:Icon(CupertinoIcons.refresh_bold),onPressed: (){
                  setState(() {
                    isApiCallProcess = true;
                    DBRequestdaily();
                    DBRequestmonthly();
                    getJourneyPlan();
                    getskippedJourneyPlan();
                    getvisitedJourneyPlan();
                    getLocation();
                  });

                  Future.delayed(const Duration(seconds: 5), () {
                    setState(() {
                      JourneyPlan();
                      isApiCallProcess = false;
                      distinmeters();
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContextcontext) => DashBoard()));
                  });

                },),
                SizedBox(width: 10,),
                StartDay(),
              ],
            ),
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
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Key Performance Indicators',
                      style: TextStyle(fontSize: 17,color: Colors.white),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              pressAttentionMTB = true;
                              pressAttentionTODAY = false;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Center(
                                  child: Text(
                                    'MTB',
                                    style: TextStyle(
                                      color: pressAttentionMTB == true
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                                Icon(CupertinoIcons.triangle_fill,size: 12,color: Colors.white,),
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,width: 1.0),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              color: pressAttentionMTB == true
                                  ? Colors.transparent
                                  : Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              pressAttentionTODAY = true;
                              pressAttentionMTB = false;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Center(
                                  child: Text(
                                    'Today',
                                    style: TextStyle(
                                      color: pressAttentionTODAY == false
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                Icon(CupertinoIcons.triangle_fill,size: 12,color: Colors.white,),
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,width: 1.0),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: pressAttentionTODAY == true
                                  ? Colors.transparent
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Containerblock(
                      numbertext: pressAttentionMTB == true ?  '$Mshedulecalls' : '$shedulecalls',
                      chartext: 'Scheduled Visits',
                      icon: CupertinoIcons.phone_circle_fill,
                      color: Colors.green,
                    ),
                    Containerblock(
                      numbertext: pressAttentionMTB == true ?  '$Munshedulecalls' :'$unshedulecalls',
                      chartext: 'UnScheduled\nVisits',
                      icon: CupertinoIcons.exclamationmark_circle_fill,
                      color: Colors.red,
                      space: 10.0,
                    ),
                    Containerblock(
                      numbertext: pressAttentionMTB == true ?  '$Mshedulecallsdone' : '$shedulecallsdone',
                      chartext: 'Scheduled\nVisits Done',
                      icon:CupertinoIcons.check_mark_circled_solid,
                      color: Colors.green,
                    ),
                    Containerblock(
                      numbertext: pressAttentionMTB == true ?  '$Munshedulecallsdone': '$unshedulecallsdone',
                      chartext: 'unScheduled Visits Done',
                      icon: CupertinoIcons.checkmark_seal_fill,
                      color: Colors.red,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isApiCallProcess = true;
                        });
                        getTimeSheet();
                        Future.delayed(const Duration(seconds: 5), () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContextcontext) => TimeSheetList()));
                          setState(() {
                            isApiCallProcess = false;
                          });
                        });
                      },
                      child: Container(
                        height: 265,
                        width: MediaQuery.of(context).size.width/2.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: containerscolor,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Working Time'),
                              WorkingRow(
                                icon: CupertinoIcons.calendar,

                                chartext: "Attendence",
                                numtext: pressAttentionMTB == true ? '$MAttendance'  : '$Attendance',
                              ),
                              WorkingRow(
                                icon: CupertinoIcons.clock,

                                chartext: "Effective Time",
                                numtext: pressAttentionMTB == true ? '$MEffectiveTime' : '$EffectiveTime',
                              ),
                              WorkingRow(
                                icon: CupertinoIcons.clock_fill,
                                chartext: "Working Time",
                                numtext: pressAttentionMTB == true ?"$Mworkingtime" :"$workingtime",
                              ),
                              WorkingRow(
                                icon: CupertinoIcons.time,

                                chartext: "Travel Time",
                                numtext: pressAttentionMTB == true ?  "$MTravelTime": "$TravelTime",
                              ),
                            ]),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 140,
                          width: MediaQuery.of(context).size.width/1.75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: containerscolor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Journey Plan",),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  JourneryPlan(
                                    color: Colors.orange,
                                    percent: pressAttentionMTB == true ?  (monthpercentage/100): (todaypercentage/100),
                                    textpercent: pressAttentionMTB == true ? monthpercentage.toString() :todaypercentage.toString(),
                                    title: "Journey Plan\nCompletion",
                                  ),
                                  JourneryPlan(
                                    color: Colors.grey[600],
                                    percent: pressAttentionMTB == true ? 0.5 : 0.1,
                                    textpercent: pressAttentionMTB == true ? '50' : '10',
                                    title: "Process\nCompliance",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) => LeaveRequest()));
                          },
                          child: Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width/1.75,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: containerscolor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Leave "),
                                Text(leaves.remainingleaves.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                                Text("Total available Leave's"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width/1.55,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: containerscolor,
                      ),
                      child: ActivityPerformance(
                        pprimary:pressAttentionMTB == true ? '37' : '14',
                        psecondary: pressAttentionMTB == true ? '38' : '18',
                        ptotal: pressAttentionMTB == true ? '26' : '08',
                        aprimary: pressAttentionMTB == true ? '48' : '34',
                        asecondary: pressAttentionMTB == true ? '37' : '22',
                        atotal: pressAttentionMTB == true ? '28' : '19',
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HQOne()));
                        },
                      child: Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width/3.25,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: containerscolor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.mark_chat_unread_rounded,size: 40,color: iconscolor,),
                            Text("HQ Communication",textAlign: TextAlign.center,),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 125,
                  width: MediaQuery.of(context).size.width / 1.03,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: containerscolor,
                  ),
                  child: Row(
                    children: [
                      Spacer(
                        flex: 2,
                      ),
                      Icon(
                        CupertinoIcons.sun_max,
                        color: Colors.black,
                        size: 50,
                      ),
                      Spacer(flex: 2),
                      Text(
                        'Welcome to the new merchendiser\ninterface of RMS.'
                            'Hope to have a\ngreat day ahead!',
                        style: new TextStyle(fontSize: 15
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Containerblock extends StatelessWidget {
  Containerblock({this.numbertext, this.chartext,
    this.color, this.icon,this.space});
  final icon;
  final color;
  final numbertext;
  final chartext;
  final space;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width / 4.3,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: containerscolor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35,
              color: color,
            ),
            SizedBox(height: 5),
            Text(
              numbertext,style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            AutoSizeText(
              chartext,
              maxLines: 2,
              textAlign: TextAlign.center,style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkingRow extends StatelessWidget {
  WorkingRow({this.icon, this.chartext, this.numtext});
  final icon;
  final chartext;
  final numtext;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeText(
              chartext,
              maxLines: 1,
            ),
            Container(
              height: 1,
              width: 95,
              color: Colors.black,
            ),
            Text(
              numtext,
            ),
          ],
        )
      ],
    );
  }
}

class JourneryPlan extends StatelessWidget {
  JourneryPlan({this.color, this.percent, this.textpercent, this.title});
  final color;
  final percent;
  final textpercent;
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircularPercentIndicator(
            radius: 50,
            percent: percent,
            lineWidth: 2.0,
            backgroundColor: Colors.grey[350],
            progressColor: color,
            center: Text(textpercent),
          ),
          SizedBox(height: 10,),
          AutoSizeText(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}


class ActivityPerformance extends StatelessWidget {
  ActivityPerformance({this.aprimary,this.asecondary,this.atotal,this.pprimary,this.psecondary,this.ptotal,});
  final ptotal;
  final atotal;
  final pprimary;
  final psecondary;
  final aprimary;
  final asecondary;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
            "Activity Performance"
        ),
        SizedBox(height: 10,),
        SizedBox(
          child: Table(
            border: TableBorder.symmetric(
              inside: BorderSide(color: Colors.grey),
            ),
            columnWidths: {
              0: FractionColumnWidth(.23),
              1: FractionColumnWidth(.235),
              2: FractionColumnWidth(.242),
            },
            children: [
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0,top: 8.0,),
                    child: Text(
                      "Planned",style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          ptotal,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Total",style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          pprimary,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Primary",style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          psecondary,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Secondary",style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14.0,right: 8.0,),
                      child: Text(
                        "Actual",style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                    child: Column(
                      children: [
                        Text(
                          atotal,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Total",style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                    child: Column(
                      children: [
                        Text(
                          aprimary,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Primary",style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                    child: Column(
                      children: [
                          Text(
                            asecondary,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                          ),
                         Text(
                            "Secondary",style: TextStyle(fontSize: 10),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

