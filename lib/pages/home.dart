

import 'package:flutter/widgets.dart';
import 'file:///C:/Users/ramkumar/StudioProjects/RHAPSODY-MERCHANDISING-SERVICES/lib/pages/MenuContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'Startday.dart';
import 'package:merchandising/Constants.dart';


class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}
@override
class _DashBoardState extends State<DashBoard> {
  bool pressAttentionMTB = false;
  bool pressAttentionTODAY = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: containerscolor,
            iconTheme: IconThemeData(color: orange),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage('images/ttflogo.png'),
                  height: 30,
                ),
                StartDay(),
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
                          numbertext: pressAttentionMTB == true ? '240' : '25',
                          chartext: 'Total Scheduled \nCalls',
                          icon: CupertinoIcons.phone_circle_fill,
                          color: Colors.green,
                        ),
                        Containerblock(
                          numbertext: pressAttentionMTB == true ? '10' : '5',
                          chartext: 'Total unScheduled \nCalls Touched',
                          icon: CupertinoIcons.exclamationmark_circle_fill,
                          color: Colors.red,
                        ),
                        Containerblock(
                          numbertext: pressAttentionMTB == true ? '124' : '10',
                          chartext: 'Total Scheduled \nCalls Done',
                          icon:CupertinoIcons.check_mark_circled_solid,
                          color: Colors.green,
                        ),
                        Containerblock(
                          numbertext: pressAttentionMTB == true ? '83' : '60',
                          chartext: 'Total Scheduled Calls Completed',
                          icon: CupertinoIcons.checkmark_seal_fill,
                          color: Colors.green,
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
                                  numtext: pressAttentionMTB == true ? '15' : '00',
                                ),
                                WorkingRow(
                                  icon: CupertinoIcons.clock,
                                  chartext: "Effective Time",
                                  numtext: pressAttentionMTB == true ? '103.5 Hrs' : '4.2 Hrs',
                                ),
                                WorkingRow(
                                  icon: CupertinoIcons.clock_fill,
                                  chartext: "Total Working Time",
                                  numtext: pressAttentionMTB == true ? '8.5 Hrs' : '0.3Hrs',
                                ),
                                WorkingRow(
                                  icon: CupertinoIcons.time,
                                  chartext: "Wasted Time",
                                  numtext: pressAttentionMTB == true ? '0.59 Hrs' : '0.048 Hrs',
                                ),
                              ]),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 130,
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
                                        percent: pressAttentionMTB == true ? 0.78 : 0.33,
                                        textpercent: pressAttentionMTB == true ? '78' : '33',
                                        title: "Journey Plan\nCompletion Percentage",
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
                            Container(
                              height:130,
                              width: MediaQuery.of(context).size.width/1.75,
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
                          ],
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
                          Spacer(),
                          Text(
                            'Welcome to the new merchendiser\ninterface of Alseer.'
                                'Hope to have a\ngreat day ahead!',
                            style: new TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Containerblock extends StatelessWidget {
  Containerblock({this.numbertext, this.chartext, this.color, this.icon});
  final icon;
  final color;
  final numbertext;
  final chartext;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width / 4.3,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: containerscolor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: color,
            ),
            SizedBox(height: 10),
            Text(
              numbertext,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              chartext,
              style: TextStyle(fontSize: 8),
              textAlign: TextAlign.center,
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
            Text(
              chartext,
              style: TextStyle(fontSize: 10),
            ),
            Container(
              height: 1,
              width: 95,
              color: Colors.black,
            ),
            Text(
              numtext,
              style: TextStyle(fontSize: 10),
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
            radius: 40,
            percent: percent,
            lineWidth: 2.0,
            backgroundColor: Colors.grey[350],
            progressColor: color,
            center: Text(textpercent),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
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
        Center(
          child: Table(
            border: TableBorder.symmetric(
              inside: BorderSide(color: Colors.grey),
            ),
            columnWidths: {
              0: FractionColumnWidth(.25),
              1: FractionColumnWidth(.22),
              2: FractionColumnWidth(.22),
            },
            children: [
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Planned Access Points",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          ptotal,
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "Total",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          pprimary,
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "Primary",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          psecondary,
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "Secondary",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Actual Access Points",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          atotal,
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "Total",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          aprimary,
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "Primary",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          asecondary,
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "Secondary",
                          style: TextStyle(fontSize: 10),
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

