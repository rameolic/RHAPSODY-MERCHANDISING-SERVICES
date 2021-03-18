import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:merchandising/api/timesheetapi.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Leave Request.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Time Sheet.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:merchandising/api/timesheetmonthly.dart';
import 'package:merchandising/api/Journeyplansapi/weekly/jpskipped.dart';
import 'package:merchandising/api/Journeyplansapi/weekly/jpvisited.dart';
import 'package:merchandising/api/Journeyplansapi/weekly/jpplanned.dart';
import 'package:merchandising/api/Journeyplansapi/todayplan/journeyplanapi.dart';
import 'package:merchandising/api/Journeyplansapi/todayplan/jpskippedapi.dart';
import 'package:merchandising/api/Journeyplansapi/todayplan/JPvisitedapi.dart';
import 'Journeyplan.dart';
import 'package:merchandising/model/distanceinmeters.dart';
import 'package:merchandising/api/leavestakenapi.dart';
import 'package:merchandising/chatscreen.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}
@override
class _DashBoardState extends State<DashBoard> {
  bool isApiCallProcess = false;
  bool pressAttentionMTB = false;
  bool pressAttentionTODAY = true;
  bool uniform = false;
  bool unit = false;
  bool transport = false;
  bool posm = false;
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
      appBar: AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              height: 30,
              image: AssetImage('images/rmsLogo.png'),
            ),
            GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => StatefulBuilder(
                          builder: (context, setState) {
                            return ProgressHUD(
                              inAsyncCall: isApiCallProcess,
                              opacity: 0.3,
                              child: AlertDialog(
                                  backgroundColor: alertboxcolor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(
                                          Radius.circular(10.0))),
                                  content: Builder(
                                    builder: (context) {
                                      // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('Roll Call',style: TextStyle(color: orange,fontSize: 20),),
                                          Divider(color: Colors.black,thickness: 0.8,),
                                          GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                uniform == false ? uniform = true : uniform = false;
                                              });
                                            },
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text('Uniform and Hygiene',style: TextStyle(fontSize: 16),),
                                                    Spacer(),
                                                    Icon(
                                                        uniform == true ? CupertinoIcons.check_mark_circled_solid :CupertinoIcons.xmark_circle_fill,
                                                        color: uniform == true ? orange : Colors.grey,size:30 , ),
                                                  ],
                                                ),
                                                SizedBox(height: 5,),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                unit == false ? unit = true : unit = false;
                                              });
                                            },
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text('Hand Held Unit Charge',style: TextStyle(fontSize: 16)),
                                                    Spacer(),
                                                    Icon(
                                                        unit == true ? CupertinoIcons.check_mark_circled_solid :CupertinoIcons.xmark_circle_fill,
                                                        color: unit == true ? orange : Colors.grey ,size:30 ),
                                                  ],
                                                ),
                                                SizedBox(height: 5,),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                transport == false ? transport = true : transport = false;
                                              });
                                            },
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text('Transportation',style: TextStyle(fontSize: 16)),
                                                    Spacer(),
                                                    Icon(
                                                        transport == true ? CupertinoIcons.check_mark_circled_solid :CupertinoIcons.xmark_circle_fill,
                                                        color: transport == true ? orange : Colors.grey ,size:30 ),
                                                  ],
                                                ),
                                                SizedBox(height: 5,),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                posm == false ? posm = true : posm = false;
                                              });
                                            },
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text('POSM',style: TextStyle(fontSize: 16)),
                                                    Spacer(),
                                                    Icon(
                                                        posm == true ? CupertinoIcons.check_mark_circled_solid :CupertinoIcons.xmark_circle_fill,
                                                        color: posm == true ? orange : Colors.grey,size:30  ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () async{
                                                  print( isApiCallProcess);
                                                  setState(() {
                                                    isApiCallProcess = true;
                                                  });
                                                  print(isApiCallProcess);
                                                  await getJourneyPlan();
                                                  await getskippedJourneyPlan();
                                                  await getvisitedJourneyPlan();
                                                  await getJourneyPlanweekly();
                                                  await getSkipJourneyPlanweekly();
                                                  await getVisitJourneyPlanweekly();
                                                  await distinmeters();
                                                  await Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => JourneyPlan()));
                                                  setState(() {
                                                    isApiCallProcess = false;
                                                  });
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                    color: orange,borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  child: Center(child: Text('ok',style: TextStyle(color: Colors.white))),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.pop(context, MaterialPageRoute(builder: (BuildContext context) => DashBoard()));},
                                                child: Container(
                                                  height: 30,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  child: Center(child: Text('Cancel',style: TextStyle(color: Colors.white))),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                            );
                          })
                  );
                  setState(() {
                    isApiCallProcess = false;
                  });
          },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: orange,
                      borderRadius: BorderRadius.circular(10.00),
                    ),
                    child: Text(
                      'Start Day',
                      style: TextStyle(color: Colors.white,fontSize: 15),
                    ),
                  ),
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
                SingleChildScrollView(
                  child: Row(
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
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Containerblock(
                      width: MediaQuery.of(context).size.width / 4.3,
                      numbertext: pressAttentionMTB == true ?  '${DBResponsedatamonthly.shedulevisits}' : '${DBResponsedatadaily.shedulevisits}',
                      chartext: 'Scheduled Visits',
                      icon: CupertinoIcons.phone_circle_fill,
                      color: Colors.green,
                    ),
                    Containerblock(
                      width: MediaQuery.of(context).size.width / 4.3,
                      numbertext: pressAttentionMTB == true ?  '${DBResponsedatamonthly.unshedulevisits}' :'${DBResponsedatadaily.unshedulevisits}',
                      chartext: 'UnScheduled\nVisits',
                      icon: CupertinoIcons.exclamationmark_circle_fill,
                      color: Colors.red,
                    ),
                    Containerblock(
                      width: MediaQuery.of(context).size.width / 4.3,
                      numbertext: pressAttentionMTB == true ?  '${DBResponsedatamonthly.ShedulevisitssDone}' : '${DBResponsedatadaily.ShedulevisitssDone}',
                      chartext: 'Scheduled\nVisits Done',
                      icon:CupertinoIcons.check_mark_circled_solid,
                      color: Colors.green,
                    ),
                    Containerblock(
                      width: MediaQuery.of(context).size.width / 4.3,
                      numbertext: pressAttentionMTB == true ?  '${DBResponsedatamonthly.UnShedulevisitsDone}': '${DBResponsedatadaily.UnShedulevisitsDone}',
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
                      onTap: ()async{
                        setState(() {
                          isApiCallProcess = true;
                        });
                          await getTimeSheetdaily();
                         await gettimesheetmonthly();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContextcontext) => TimeSheetList()));
                        setState(() {
                          isApiCallProcess = false;
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
                              Text('Time Sheet'),
                              WorkingRow(
                                icon: CupertinoIcons.calendar,

                                chartext: "Attendence",
                                numtext: pressAttentionMTB == true ? '${DBResponsedatamonthly.Attendance}'  : '${DBResponsedatadaily.Attendance}',
                              ),
                              WorkingRow(
                                icon: CupertinoIcons.clock,

                                chartext: "Effective Time",
                                numtext: pressAttentionMTB == true ? '${DBResponsedatamonthly.EffectiveTime}' : '${DBResponsedatadaily.EffectiveTime}',
                              ),
                              WorkingRow(
                                icon: CupertinoIcons.clock_fill,
                                chartext: "Working Time",
                                numtext: pressAttentionMTB == true ?"${DBResponsedatamonthly.WorkingTime}" :"${DBResponsedatadaily.WorkingTime}",
                              ),
                              WorkingRow(
                                icon: CupertinoIcons.time,

                                chartext: "Travel Time",
                                numtext: pressAttentionMTB == true ?  "${DBResponsedatamonthly.TravelTime}": "${DBResponsedatadaily.TravelTime}",
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
                                    percent: pressAttentionMTB == true ? (DBResponsedatamonthly.monthPlanpercentage/100): (DBResponsedatadaily.todayPlanpercentage/100),
                                    textpercent: pressAttentionMTB == true ? DBResponsedatamonthly.monthPlanpercentage.toString() :DBResponsedatadaily.todayPlanpercentage.toString(),
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
                          onTap: ()async{
                            setState(() {
                              isApiCallProcess = true;
                            });
                            await leaveData();
                            await Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) => leavestatusPage()));
                            setState(() {
                              isApiCallProcess = false;
                            });
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
                                Text(DBResponsedatamonthly.leavebalance.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
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
                      onTap: () {
                        setState(() {
                          chat.receiver = "Emp5906";
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ChatScreen()));
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
                SizedBox(height: 10,),
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
                        'Welcome to the new merchendiser\ninterface of RMS. '
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



class WorkingRow extends StatelessWidget {
  WorkingRow({this.icon, this.chartext, this.numtext});
  final icon;
  final chartext;
  final numtext;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                chartext,
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
      ),
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
    return SingleChildScrollView(
      child: Column(
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
      ),
    );
  }
}

