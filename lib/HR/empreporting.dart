import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/availabitiy.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Leave Request.dart';
import 'package:merchandising/model/leaveresponse.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:merchandising/HR/addreport.dart';


class Reportingemp extends StatelessWidget {
  static final List<String> empname = <String>["Outletname","Outletname",];
  static final List<String> reportingto = <String>["checkintime","Outletname",];
  static final List<String> startdate = <String>["Outletname","Outletname",];
  static final List<String> enddate = <String>["Outletname","Outletname",];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Text("Reporting",style: TextStyle(color: orange),),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: Stack(
        children: [
          BackGround(),
          ListView.builder(
              itemCount: empname.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 120,
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
                            'merchandiser name :',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: AutoSizeText(
                              '${empname[empname.length - 1 -index]}',
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
                          Text('reporting to:',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text('${reportingto[reportingto.length - 1 -index]}',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text('Start Date :',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text('${startdate[reportingto.length - 1 -index]}',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text('End Date :',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text('${enddate[reportingto.length - 1 -index]}',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                        ],
                      ),
                    ],
                  ),
                );
              }
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(15.0),
              child: FloatingActionButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext
                          context) =>
                              addreporting()));
                },
                backgroundColor: pink,
                elevation: 8.0,
                child: Icon(Icons.add,color: orange,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


