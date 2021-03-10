import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:flutter/cupertino.dart';
import 'Outlets.dart';
import 'journeyplan.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Leave Request.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/Fieldmanager/Store Details.dart';


class FieldManagerDashBoard extends StatefulWidget {
  @override
  _FieldManagerDashBoardState createState() => _FieldManagerDashBoardState();
}

class _FieldManagerDashBoardState extends State<FieldManagerDashBoard> {
  bool isApiCallProcess = false;
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
}
Widget _uiSetup(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: pink,
      iconTheme: IconThemeData(color: orange),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("FM DashBoard",style: TextStyle(color:orange),),
          /* Image(
              height: 30,
              image: AssetImage('images/rmsLogo.png'),
            ),*/
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
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.all(7.0),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: containerscolor,
                ),
                height: 181,
                width: double.infinity,
                child: Column(
                  children: [
                    Text("Performance Indicators", style: TextStyle(
                        fontSize: 16),),
                    SizedBox(height: 10,),
                    Table(
                      border: TableBorder.symmetric(
                        inside: BorderSide(color: Colors.grey),
                      ),
                      columnWidths: {
                        0: FractionColumnWidth(.35),

                      },
                      children: [
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: Center(
                                child: Text(
                                  "Merchandisers",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Text(
                                    '50', style: TextStyle(fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Total",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Text(
                                    '50', style: TextStyle(fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Present",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Text(
                                    '50', style: TextStyle(fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Absent",
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
                              padding: const EdgeInsets.all(14.0),
                              child: Center(
                                child: Text(
                                  "Total Outlets",
                                  style: TextStyle(fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Text(
                                    '50', style: TextStyle(fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Total",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Text(
                                    '50', style: TextStyle(fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Completed",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Text(
                                    '50', style: TextStyle(fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Pending",
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
                              padding: const EdgeInsets.only(top: 14.0),
                              child: Center(
                                child: Text(
                                  "Today Outlets",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Text(
                                    '50', style: TextStyle(fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Total",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Text(
                                    '50', style: TextStyle(fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Completed",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Text(
                                    '50', style: TextStyle(fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Pending",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  StoreDetails()));
                    },
                    child: Container(
                      height: 120,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3.2,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: containerscolor,
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.cart_fill,
                                size: 35,
                                color: iconscolor,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Stores',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15,),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Oulets()));
                    },
                    child: Container(
                      height: 120,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3.2,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: containerscolor,
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.store_mall_directory,
                                size: 35,
                                color: iconscolor,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Outlets',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15,),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  FMJouneyplan()));
                    },
                    child: Container(
                      height: 120,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3.2,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: containerscolor,
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.bus,
                                size: 35,
                                color: iconscolor,
                              ),

                              SizedBox(height: 10),
                              Text(
                                'Journey Plan',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Oulets()));
                    },
                    child: Container(
                      height: 120,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3.2,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: containerscolor,
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.building_2_fill,
                                size: 35,
                                color: iconscolor,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Working Days',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15,),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  FMJouneyplan()));
                    },
                    child: Container(
                      height: 120,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3.2,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: containerscolor,
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.clock_fill,
                                size: 35,
                                color: iconscolor,
                              ),

                              SizedBox(height: 10),
                              Text(
                                'Holidays',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Oulets()));
                    },
                    child: Container(
                      height: 120,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3.2,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: containerscolor,
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                             Text("2",style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text(
                                'Total\nLeave Requests',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15,),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10,),
              Text("My Activity", style: TextStyle(color: containerscolor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      height: 120,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 2.6,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: containerscolor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("My Attendance",style: TextStyle(fontSize: 15.0),),
                          Text("14", style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext
                              context) =>
                                  leavestatusPage()));
                    },
                    child: Container(
                      height: 120,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.75,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: containerscolor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Apply Leave"),
                          Text("34", style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),),
                          Text("Total available Leave's",style: TextStyle(fontSize: 15),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 125,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.03,
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
            ],
          ),
        )
      ],
    ),
  );
}



