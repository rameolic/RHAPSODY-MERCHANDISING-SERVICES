import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Customers Activities.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:merchandising/api/timesheetapi.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/model/rememberme.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import 'package:merchandising/model/chatscreen.dart';

import 'package:merchandising/api/customer_activites_api/visibilityapi.dart';
import 'package:merchandising/api/customer_activites_api/share_of_shelf_detailsapi.dart';
import'package:merchandising/api/customer_activites_api/competition_details.dart';
import'package:merchandising/api/customer_activites_api/promotion_detailsapi.dart';
import 'package:merchandising/api/avaiablityapi.dart';
import 'package:merchandising/api/customer_activites_api/Competitioncheckapi.dart';
import 'package:merchandising/api/customer_activites_api/planogramdetailsapi.dart';


import 'package:location_permissions/location_permissions.dart';
import 'package:merchandising/model/Location_service.dart';
import'package:merchandising/Fieldmanager/ViewPDF.dart';
import'package:merchandising/api/FMapi/nbl_detailsapi.dart';
import 'package:merchandising/api/FMapi/nbl_detailsapi.dart';

Future callfrequently()async{
   getJourneyPlan();
   getskippedJourneyPlan();
   getvisitedJourneyPlan();
    getSkipJourneyPlanweekly();
    getVisitJourneyPlanweekly();
   await getJourneyPlanweekly();
   PermissionStatus permission = await LocationPermissions().checkPermissionStatus();
   if(permission.toString() == 'PermissionStatus.granted'){
     await distinmeters();
   }
}
int workingid;
class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}
class _DashBoardState extends State<DashBoard> {


  @override
  void initState() {
    ischatscreen = 0;
    print("chatscreen from dshbrd: $ischatscreen");
    if(fromloginscreen){
      Future.delayed(
          const Duration(seconds: 2), (){
        showDialog(
            context: context,
            builder: (_) => StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    backgroundColor: pink,//alertboxcolor,
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
                            Text(greetingMessage(),style: TextStyle(color: orange,fontSize: 20),),
                            Divider(color: Colors.black,),
                            Text("Wish you have a great day ahead 😀",textAlign: TextAlign.center,),
                            SizedBox(height: 5,),
                            Text(DBrequestdata.empname,textAlign: TextAlign.center,style: TextStyle(color: orange,fontSize: 14),),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Spacer(),
                                Image(
                                  height: 30,
                                  image: AssetImage('images/rmsLogo.png'),
                                ),
                              ],
                            )

                          ],
                        );
                      },
                    ),
                  );
                }));
      });
      fromloginscreen = false;
    }
    //super.initState();
  }
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  height: 30,
                  image: AssetImage('images/rmsLogo.png'),
                ),
                EmpInfo()
              ],
            ),
            GestureDetector(
                onTap: () async{
                  PermissionStatus permission = await LocationPermissions().checkPermissionStatus();
                  print(permission);
                  if(permission.toString() == 'PermissionStatus.granted'){
                     getLocation();
                    print(gettodayjp.checkintime);
                    print(gettodayjp.checkouttime);
                    print(gettodayjp.status);
                    workingid=null;
                    for(int u =0;u<gettodayjp.status.length;u++){
                      if(gettodayjp.status[u]=="working"){
                        workingid = gettodayjp.id[u];
                        currentoutletid = gettodayjp.outletids[u];
                        print(workingid);
                        print(gettodayjp.id[u]);
                        chekinoutlet.checkinoutletid = gettodayjp.storecodes[u];
                        chekinoutlet.checkinoutletname = gettodayjp.storenames[u];
                        chekinoutlet.checkinarea = gettodayjp.outletarea[u];
                        chekinoutlet.checkincity = gettodayjp.outletcity[u];
                        chekinoutlet.checkinstate = gettodayjp.outletcountry[u];
                        chekinoutlet.checkincountry = gettodayjp.outletcountry[u];
                      }
                    }
                    workingid==null? showDialog(
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
                                                  if(uniform && unit && transport && posm){
                                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                                    String checkintime = prefs.getString('checkintime');
                                                    print('checkintime : $checkintime');
                                                    // ignore: unrelated_type_equality_checks
                                                    if(checkintime !=  DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()){
                                                      addcheckintime();
                                                      // addattendence();
                                                    }else{
                                                      print('checkintime already added');
                                                    }
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => JourneyPlan()));
                                                  }
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
                    ):showDialog(
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
                                          Text('Alert',style: TextStyle(color: orange,fontSize: 20),),
                                          Divider(color: Colors.black,thickness: 0.8,),
                                          Text("you have unfinished outlet!",textAlign: TextAlign.center,),
                                          SizedBox(height: 10,),
                                          Text("Note* if you recently checked out please wait 2 minutes minimum to get the updated data",textAlign: TextAlign.center,style: TextStyle(color: orange,fontSize:10),),
                                          SizedBox(height: 5,),
                                          Center(
                                            child: GestureDetector(
                                              onTap: () async{
                                                setState(() {
                                                  isApiCallProcess = true;
                                                });
                                                print("current outlet id: $currentoutletid");
                                                outletrequestdata.outletidpressed = currentoutletid;
                                                checkinoutdata.checkid = workingid;
                                                currenttimesheetid = workingid;
                                                getTaskList();
                                                getVisibility();
                                                getcompinfo();
                                                getPlanogram();
                                                getCompetition();
                                                getNBLdetails();
                                                getPromotionDetails();
                                                await getAvaiablitity();
                                                await getShareofshelf();
                                                setState(() {
                                                  isApiCallProcess = false;
                                                });
                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => CustomerActivities()));
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
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              );
                            }));
                  }else{
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
                                          Text('Alert',style: TextStyle(color: orange,fontSize: 20),),
                                          Divider(color: Colors.black,thickness: 0.8,),
                                          Text("Location permissions need to be granted to proceed further.",textAlign: TextAlign.center,),
                                          SizedBox(height: 10,),
                                          Center(
                                            child: GestureDetector(
                                              onTap: () async{
                                                bool permission = await LocationPermissions().openAppSettings();
                                                print(permission);
                                                },
                                              child: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: orange,borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: Center(child: Text('Open Settings',style: TextStyle(color: Colors.white))),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              );
                            }));
                  }

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
                      chartext: ' Scheduled \nVisits',
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
                      chartext: ' Scheduled \nVisits Done',
                      icon:CupertinoIcons.check_mark_circled_solid,
                      color: Colors.green,
                    ),
                    Containerblock(
                      width: MediaQuery.of(context).size.width / 4.3,
                      numbertext: pressAttentionMTB == true ?  '${DBResponsedatamonthly.UnShedulevisitsDone}': '${DBResponsedatadaily.UnShedulevisitsDone}',
                      chartext: 'UnScheduled\nVisits Done',
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
                        timesheet.empid = DBrequestdata.receivedempid;
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
                                    percent: pressAttentionMTB == true ? (int.parse('${DBResponsedatamonthly.ShedulevisitssDone + DBResponsedatamonthly.UnShedulevisitsDone}')/int.parse('${DBResponsedatamonthly.shedulevisits + DBResponsedatamonthly.unshedulevisits}')) < 101 ?(int.parse('${DBResponsedatamonthly.ShedulevisitssDone + DBResponsedatamonthly.UnShedulevisitsDone}'))/(int.parse('${DBResponsedatamonthly.shedulevisits + DBResponsedatamonthly.unshedulevisits}')) :0.0: (int.parse('${DBResponsedatadaily.ShedulevisitssDone+DBResponsedatadaily.UnShedulevisitsDone}')/int.parse('${DBResponsedatadaily.shedulevisits+DBResponsedatadaily.unshedulevisits}'))<101? (int.parse('${DBResponsedatadaily.ShedulevisitssDone+DBResponsedatadaily.UnShedulevisitsDone}')/int.parse('${DBResponsedatadaily.shedulevisits+DBResponsedatadaily.unshedulevisits}')):0.0,
                                    textpercent: pressAttentionMTB == true ? (int.parse('${DBResponsedatamonthly.ShedulevisitssDone + DBResponsedatamonthly.UnShedulevisitsDone}')/int.parse('${DBResponsedatamonthly.shedulevisits + DBResponsedatamonthly.unshedulevisits}')*100).toStringAsFixed(0) :(int.parse('${DBResponsedatadaily.ShedulevisitssDone+DBResponsedatadaily.UnShedulevisitsDone}')/int.parse('${DBResponsedatadaily.shedulevisits+DBResponsedatadaily.unshedulevisits}')*100).toStringAsFixed(0),
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
                        pprimary:pressAttentionMTB == true ? '${DBResponsedatamonthly.shedulevisits}' : '${DBResponsedatadaily.shedulevisits}',
                        psecondary: pressAttentionMTB == true ? '${DBResponsedatamonthly.unshedulevisits}' : '${DBResponsedatadaily.unshedulevisits}',
                        ptotal: pressAttentionMTB == true ? '${DBResponsedatamonthly.shedulevisits + DBResponsedatamonthly.unshedulevisits}' : '${DBResponsedatadaily.shedulevisits+DBResponsedatadaily.unshedulevisits}',
                        aprimary: pressAttentionMTB == true ? '${DBResponsedatamonthly.ShedulevisitssDone}' : '${DBResponsedatadaily.ShedulevisitssDone}',
                        asecondary: pressAttentionMTB == true ?  '${DBResponsedatamonthly.UnShedulevisitsDone}' : '${DBResponsedatadaily.UnShedulevisitsDone}',
                        atotal: pressAttentionMTB == true ? '${DBResponsedatamonthly.ShedulevisitssDone + DBResponsedatamonthly.UnShedulevisitsDone}' : '${DBResponsedatadaily.ShedulevisitssDone+DBResponsedatadaily.UnShedulevisitsDone}',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          ischatscreen =1;
                          newmsgavaiable = false;
                          chat.receiver = fieldmanagerofcurrentmerch;
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
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.mark_chat_unread_rounded,size: 40,color: iconscolor,),
                                  FittedBox(
                                      fit:BoxFit.fitWidth,
                                      child: Text("HQ\nCommunication",textAlign: TextAlign.center,maxLines: 2,)),
                                ],
                              ),
                              newmsgavaiable ? Align(
                                alignment: Alignment.topRight,
                                child: Icon(CupertinoIcons.bell_solid,color: Colors.red,size: 20,),
                              ) : SizedBox(),
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
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "Planned",style: TextStyle(fontSize: 12),
                        ),
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
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "  Total  ",style: TextStyle(fontSize: 10),
                            ),
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
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              " Primary ",style: TextStyle(fontSize: 10),
                            ),
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
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Secondary",style: TextStyle(fontSize: 10),
                            ),
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
                          "Actual ",style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                      child: Column(
                        children: [
                          Text(
                            atotal,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "  Total  ",style: TextStyle(fontSize: 10),
                            ),
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
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              " Primary ",style: TextStyle(fontSize: 10),
                            ),
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
                           FittedBox(
                             fit: BoxFit.fitWidth,
                             child: Text(
                                "Secondary",style: TextStyle(fontSize: 10),
                              ),
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

