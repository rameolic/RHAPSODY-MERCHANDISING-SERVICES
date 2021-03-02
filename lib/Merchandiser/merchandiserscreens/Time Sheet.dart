import 'package:flutter/material.dart';
import '../../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/api/timesheetapi.dart';

class TimeSheetList extends StatefulWidget {
  @override
  _TimeSheetListState createState() => _TimeSheetListState();
}

class _TimeSheetListState extends State<TimeSheetList> {
  bool pressAttentionMTB = false;
  bool pressAttentionTODAY = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Row(
          children: [
            Text(
              'Time Sheet',
              style: TextStyle(color: orange),
            ),
            Spacer(),
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    children: [
                      Row(
                        children: [
                          Text(
                            "Merchandiser Name:",
                            style: TextStyle(fontSize: 16,),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(DBrequestdata.empname,
                              style: TextStyle(fontSize: 16,))
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Merchandiser ID :",
                            style: TextStyle(fontSize: 16,),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(DBrequestdata.receivedempid,
                              style: TextStyle(fontSize: 16,))
                        ],
                      ),
                    ],
                  ),
                ),

                pressAttentionMTB == true ? Timesheetmonthly() : TimeSheetdaily()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class Timesheetmonthly extends StatelessWidget {
  List<String> outletname = <String>["Outletname","Outletname","Outletname","Outletname","Outletname","Outletname"];
  List<String> checkintime = <String>["checkintime","Outletname","Outletname","Outletname","Outletname","Outletname"];
  List<String> days = <String>["today","today","today","today","tomorrow","tomorrow"];
  List<String> checkouttime = <String>["Outletname","Outletname","Outletname","Outletname","Outletname","Outletname"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/1.43,
      width: double.infinity,
      child: ListView.builder(
          itemCount: outletname.length,//TimeSheetdata.checkintime.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 100,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.00)),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    index == 0 ?Text('${days[index]}',style: TextStyle(color: orange,fontSize: 17.0,fontWeight: FontWeight.bold)):
                    days[index]!= days[index-1]?
                    Text('${days[index]}',style: TextStyle(color: orange,fontSize: 17.0,fontWeight: FontWeight.bold)):SizedBox(),
                   // Text('${TimeSheetdata.days[index]}',style: TextStyle(color: orange,fontSize: 16.0)),
                    Row(children: [
                      Text('Outlet name : ',
                          style: TextStyle(
                            fontSize: 16.0,
                          )),
                      Text('${outletname[index]}', style: TextStyle(color: orange,fontSize: 16.0)),
                     // Text('${TimeSheetdata.outletname[index]}', style: TextStyle(color: orange,fontSize: 16.0)),
                    ]),
                    Row(
                        children: [
                          Text('Checkin time : ',style: TextStyle(fontSize: 16.0,)),
                          Text('${checkintime[index]}',style: TextStyle(fontSize: 16.0,))
                         // Text('${TimeSheetdata.checkintime[index]}',style: TextStyle(fontSize: 16.0,))
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
                      Text('Checkout time : ',style: TextStyle(fontSize: 16.0,)),
                      Text('${checkouttime[index]}',style: TextStyle(fontSize: 16.0,))
                      //Text('${TimeSheetdata.checkouttime[index]}',style: TextStyle(fontSize: 16.0,))
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
                ));
          }),
    );
  }
}

class TimeSheetdaily extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/1.43,
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: false,
          itemCount: TimeSheetdatadaily.checkintime.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 100,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.00)),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(children: [
                      Text('Outlet name : ',
                          style: TextStyle(
                            fontSize: 16.0,
                          )),
                       Text('${TimeSheetdatadaily.outletname[index]}', style: TextStyle(color: orange,fontSize: 16.0)),
                    ]),
                    Row(
                        children: [
                          Text('Checkin time : ',style: TextStyle(fontSize: 16.0,)),
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
                      Text('Checkout time : ',style: TextStyle(fontSize: 16.0,)),
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
                ));
          }),
    );
  }
}

