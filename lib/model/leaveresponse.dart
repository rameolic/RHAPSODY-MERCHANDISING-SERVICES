import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ResponsetoLeave extends StatefulWidget {
  @override
  _ResponsetoLeaveState createState() => _ResponsetoLeaveState();
}

class _ResponsetoLeaveState extends State<ResponsetoLeave> {
  static final List<String> leavereason = <String>["Outletname","Outletname",];
  static final List<String> startdate = <String>["checkintime","Outletname",];
  static final List<String> enddate = <String>["Outletname","Outletname",];
  static final List<String> type = <String>["Outletname","Outletname",];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: containerscolor,
          iconTheme: IconThemeData(color: orange),
          title: Row(
            children: [
              Text(
                'Leave Response',
                style: TextStyle(color: orange),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Menu(),
        ),
        body: Stack(children: [
          BackGround(),
          ListView.builder(
              itemCount: leavereason.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap:(){
                    
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Reason :',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: AutoSizeText(
                                '${leavereason[leavereason.length - 1 -index]}',
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Leave Type:',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${type[type.length - 1 -index]}',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('total number of days',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text('2',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Employee name :',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text("ram"),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Employee ID :',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text("EMP55266"),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        ]));
  }
}


