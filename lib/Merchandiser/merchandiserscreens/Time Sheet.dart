import 'package:flutter/material.dart';
import 'package:merchandising/clients/clientoutlet_details.dart';
import '../../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/api/timesheetapi.dart';
import 'timesheetmonthly.dart';
import 'package:merchandising/main.dart';
import 'package:merchandising/api/timesheetmonthly.dart';
import'package:merchandising/Fieldmanager/FMdashboard.dart';
import 'package:merchandising/Fieldmanager/merchandiserslist.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/TS_split.dart';

bool isApiCallProcess = false;

class TimeSheetList extends StatefulWidget {
  @override
  _TimeSheetListState createState() => _TimeSheetListState();
}

class _TimeSheetListState extends State<TimeSheetList> {
  bool pressAttentionMTB = false;
  bool pressAttentionTODAY = true;

  bool splitshit = false;
  bool normal = true;
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        opacity: 0.3,
        inAsyncCall: isApiCallProcess,
        child:Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Time Sheet',
                  style: TextStyle(color: orange),
                ),
                Spacer(),
              ],
            ),
            EmpInfo()
          ],
        ),
      ),
      // drawer: Drawer(
      //   child: Menu(),
      // ),
      body: Stack(
        children: [
          BackGround(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Display TimeSheet For',
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
                Container(
                  margin: EdgeInsets.all(10.00),
                  padding: EdgeInsets.all(10.00),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.00),
                    color:containerscolor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(currentuser.roleid == 5 ? timesheet.empname : DBrequestdata.empname,
                          style: TextStyle(fontSize: 16,)),
                      Row(
                        children: [
                          Text(
                            "Merchandiser ID :",
                            style: TextStyle(fontSize: 16,),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(currentuser.roleid == 5 ? timesheet.empid :DBrequestdata.receivedempid,
                              style: TextStyle(fontSize: 16,))
                        ],
                      ),
                      //Text(currentuser.roleid==5?"Total TimeSheet Monthly:${tts}":" ",style: TextStyle(fontSize: 16,))
                    ],
                  ),
                ),
                pressAttentionMTB == true ? Timesheetmonthly() : TimeSheetdaily(),

                // Container(
                //   margin: EdgeInsets.only(bottom:10.0,right: 10.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           setState(() {
                //             normal = true;
                //             splitshit = false;
                //           });
                //         },
                //         child: Container(
                //           height: 40,
                //           width: 100,
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               Center(
                //                 child: Text(
                //                   'Normal',
                //                   style: TextStyle(
                //                     color: normal == true
                //                         ? Colors.white
                //                         : Colors.black,
                //                   ),
                //                 ),
                //               ),
                //               Icon(CupertinoIcons.triangle_fill,size: 12,color: Colors.white,),
                //             ],
                //           ),
                //           decoration: BoxDecoration(
                //             border: Border.all(color: Colors.white,width: 1.0),
                //             borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(10),
                //                 bottomLeft: Radius.circular(10)),
                //             color: normal == true
                //                 ? orange
                //                 : Colors.white,
                //           ),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           setState(() {
                //             splitshit = true;
                //             normal = false;
                //           });
                //         },
                //         child: Container(
                //           height: 40,
                //           width: 100,
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               Center(
                //                 child: Text(
                //                   'Split Shit',
                //                   style: TextStyle(
                //                     color: splitshit == false
                //                         ? Colors.black
                //                         : Colors.white,
                //                   ),
                //                 ),
                //               ),
                //               Icon(CupertinoIcons.triangle_fill,size: 12,color: Colors.white,),
                //             ],
                //           ),
                //           decoration: BoxDecoration(
                //             border: Border.all(color: Colors.white,width: 1.0),
                //             borderRadius: BorderRadius.only(
                //                 topRight: Radius.circular(10),
                //                 bottomRight: Radius.circular(10)),
                //             color: splitshit == true
                //                 ? orange
                //                 : Colors.white,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // pressAttentionMTB == true ? Timesheetmonthly() : TimeSheetdaily()
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
int outletindex;
List<String>outletnameSS=[];
class TimeSheetdaily extends StatefulWidget {
  @override
  _TimeSheetdailyState createState() => _TimeSheetdailyState();
}

class _TimeSheetdailyState extends State<TimeSheetdaily> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/1.43,
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: false,
          itemCount: TimeSheetdatadaily.checkintime.length,
          itemBuilder: (BuildContext context, int index) {
            outletindex=index;

            return GestureDetector(
              onTap: ()async{

                for(int i=0;i<TimeSheetdatadaily.checkintime.length;i++){
                  outletnameSS.add("");
                }
                outletnameSS[outletindex]=TimeSheetdatadaily.outletname[index];
                currenttimesheetid=TimeSheetdatadaily.tsid[index];

                print("TS is for SS:${currenttimesheetid}");

                setState(() {
                  isApiCallProcess=true;
                });

                await getTotalJnyTime();

                setState(() {
                  isApiCallProcess=false;
                });

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => TimeSheetListSS()));


              },
              child: Container(
                  height: 100,
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.00)),
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(children: [
                          Text('Outlet Name : ',
                              style: TextStyle(
                                fontSize: 16.0,
                              )),
                           Text('${TimeSheetdatadaily.outletname[index]}', style: TextStyle(color: orange,fontSize: 16.0)),
                        ]),
                        Row(
                            children: [
                              Text('CheckIn Time : ',style: TextStyle(fontSize: 16.0,)),
                              Text('${TimeSheetdatadaily.checkintime[index]}',style: TextStyle(fontSize: 16.0,))
                            ]),
                        /*Row(children: [
                          Text('Check In Location:',
                              style: TextStyle(
                                fontSize: 13.0,
                              )),
                          SizedBox(width: 10),
                          Text(${TimeSheetdata.[index]}),
                        ]),*/
                        Row(children: [
                          Text('CheckOut Time : ',style: TextStyle(fontSize: 16.0,)),
                          Text('${TimeSheetdatadaily.checkouttime[index]}',style: TextStyle(fontSize: 16.0,))
                        ]),
                        /* Row(children: [
                          Text('Check Out Location:',
                              style: TextStyle(
                                fontSize: 13.0,
                              )),
                          SizedBox(width: 10),
                          Text('${checkoutlocation[index]}',
                          ),
                        ]),*/
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}




