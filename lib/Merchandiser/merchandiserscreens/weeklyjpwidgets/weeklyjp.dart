import 'package:flutter/material.dart';
import '../../../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/api/Journeyplansapi/weekly/jpplanned.dart';
import 'package:merchandising/api/FMapi/timesheetdelete.dart';
import 'package:merchandising/Fieldmanager/addoutlets.dart';


class WeeklyJourneyListBuilder extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<WeeklyJourneyListBuilder> {
  bool isApiCallProcess = false;
  bool sundaytapped = false;
  bool mondaytapped = false;
  bool tuesdaytapped = false;
  bool wednesdaytapped = false;
  bool thursdaytapped = false;
  bool fridaytapped = false;
  bool saturdaytapped = false;
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5.0,right: 5.0),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.00),
            color:containerscolor,
          ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            sundaytapped == true
                                ? CupertinoIcons.arrowtriangle_down_fill
                                : CupertinoIcons.arrowtriangle_right_fill,
                            color: orange,
                            size: 20,
                          ),
                          onPressed: () {
                            print(getweeklyjp.sundaystorenames);
                            setState(() {
                              sundaytapped == true ? sundaytapped = false : sundaytapped = true;
                            });
                          }),
                      Text(
                        "Sunday",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  sundaytapped == true
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: getweeklyjp.sundayaddress.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onLongPress: (){
                                print(getweeklyjp.sundayid[index]);
                                showDialog(
                                    context: context,
                                    builder: (_) =>StatefulBuilder(
                                        builder: (context, setState) {
                                          return ProgressHUD(
                                              inAsyncCall: isApiCallProcess,
                                              opacity: 0.3,
                                              child: AlertDialog(
                                                backgroundColor: alertboxcolor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(10.0))),
                                                content: Builder(
                                                  builder: (context) {
                                                    // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                                    return Container(
                                                      child: SizedBox(
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          crossAxisAlignment: CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Text(
                                                              "Alert",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.bold),
                                                            ),
                                                            SizedBox(
                                                              height: 15.00,
                                                            ),
                                                            Text(
                                                                "Are you sure do you want to Delete this TimeSheet?",
                                                                style: TextStyle(fontSize: 14)),
                                                            SizedBox(
                                                              height: 25.00,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment
                                                                  .center,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () async {
                                                                    setState(() {
                                                                      isApiCallProcess = true;
                                                                    });
                                                                    timesheetiddel = getweeklyjp.sundayid[index];
                                                                    await deletetimesheet();
                                                                    //updateoutlet.outletedit = true;
                                                                    setState(() {
                                                                      isApiCallProcess = false;
                                                                    });
                                                                    Navigator.push(context,
                                                                        MaterialPageRoute(builder: (
                                                                            BuildContext context) =>
                                                                            AddOutlets()));
                                                                  },
                                                                  child: Container(
                                                                    height: 40,
                                                                    width: 70,
                                                                    decoration: BoxDecoration(
                                                                      color: orange,
                                                                      borderRadius: BorderRadius
                                                                          .circular(5),
                                                                    ),
                                                                    margin: EdgeInsets.only(
                                                                        right: 10.00),
                                                                    child: Center(child: Text("yes")),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ));
                                        }));
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                height: 80,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Text(
                                            '[${getweeklyjp.sundaystorecodes[index]}]',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${getweeklyjp.sundaystorenames[index]}',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text('${getweeklyjp.sundayaddress[index]}',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        )),
                                    Spacer(),
                                    Table(
                                      children: [
                                        TableRow(children: [
                                          Text('Contact Number :',
                                              style: TextStyle(
                                                fontSize: 13.0,
                                              )),
                                          Text(
                                              '${getweeklyjp.sundaycontactnumbers[index]}',
                                              style: TextStyle(color: orange)),
                                        ]),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                      : SizedBox()
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            mondaytapped == true
                                ? CupertinoIcons.arrowtriangle_down_fill
                                : CupertinoIcons.arrowtriangle_right_fill,
                            color: orange,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              mondaytapped == true ? mondaytapped = false : mondaytapped = true;
                            });
                          }),
                      Text(
                        "Monday",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  mondaytapped == true
                      ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getweeklyjp.mondayaddress.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          height: 80,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Text(
                                      '[${getweeklyjp.mondaystorecodes[index]}]',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${getweeklyjp.mondaystorenames[index]}',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${getweeklyjp.mondayaddress[index]}',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  )),
                              Spacer(),
                              Table(
                                children: [
                                  TableRow(children: [
                                    Text('Contact Number :',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                        )),
                                    Text(
                                        '${getweeklyjp.mondaycontactnumbers[index]}',
                                        style: TextStyle(color: orange)),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        );
                      })
                      : SizedBox()
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            tuesdaytapped == true
                                ? CupertinoIcons.arrowtriangle_down_fill
                                : CupertinoIcons.arrowtriangle_right_fill,
                            color: orange,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              tuesdaytapped == true ? tuesdaytapped = false : tuesdaytapped = true;
                            });
                          }),
                      Text(
                        "Tuesday",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  tuesdaytapped == true
                      ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getweeklyjp.tuesdayaddress.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          height: 80,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Text(
                                      '[${getweeklyjp.tuesdaystorecodes[index]}]',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${getweeklyjp.tuesdaystorenames[index]}',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${getweeklyjp.tuesdayaddress[index]}',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  )),
                              Spacer(),
                              Table(
                                children: [
                                  TableRow(children: [
                                    Text('Contact Number :',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                        )),
                                    Text(
                                        '${getweeklyjp.tuesdaycontactnumbers[index]}',
                                        style: TextStyle(color: orange)),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        );
                      })
                      : SizedBox()
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            wednesdaytapped == true
                                ? CupertinoIcons.arrowtriangle_down_fill
                                : CupertinoIcons.arrowtriangle_right_fill,
                            color: orange,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              wednesdaytapped == true ? wednesdaytapped = false : wednesdaytapped = true;
                            });
                          }),
                      Text(
                        "Wednesday",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  wednesdaytapped == true
                      ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getweeklyjp.wednesdayaddress.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          height: 80,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Text(
                                      '[${getweeklyjp.wednesdaystorecodes[index]}]',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${getweeklyjp.wednesdaystorenames[index]}',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${getweeklyjp.wednesdayaddress[index]}',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  )),
                              Spacer(),
                              Table(
                                children: [
                                  TableRow(children: [
                                    Text('Contact Number :',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                        )),
                                    Text(
                                        '${getweeklyjp.wednesdaycontactnumbers[index]}',
                                        style: TextStyle(color: orange)),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        );
                      })
                      : SizedBox()
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            thursdaytapped == true
                                ? CupertinoIcons.arrowtriangle_down_fill
                                : CupertinoIcons.arrowtriangle_right_fill,
                            color: orange,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              thursdaytapped == true ? thursdaytapped = false : thursdaytapped = true;
                            });
                          }),
                      Text(
                        "Thursday",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  thursdaytapped == true
                      ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getweeklyjp.thrusdayaddress.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          height: 80,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Text(
                                      '[${getweeklyjp.thrusdaystorecodes[index]}]',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${getweeklyjp.thrusdaystorenames[index]}',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${getweeklyjp.thrusdayaddress[index]}',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  )),
                              Spacer(),
                              Table(
                                children: [
                                  TableRow(children: [
                                    Text('Contact Number :',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                        )),
                                    Text(
                                        '${getweeklyjp.thrusdaycontactnumbers[index]}',
                                        style: TextStyle(color: orange)),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        );
                      })
                      : SizedBox()
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            fridaytapped == true
                                ? CupertinoIcons.arrowtriangle_down_fill
                                : CupertinoIcons.arrowtriangle_right_fill,
                            color: orange,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              fridaytapped == true ? fridaytapped = false : fridaytapped = true;
                            });
                          }),
                      Text(
                        "Friday",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  fridaytapped == true
                      ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getweeklyjp.fridayaddress.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          height: 80,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Text(
                                      '[${getweeklyjp.fridaystorecodes[index]}]',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${getweeklyjp.fridaystorenames[index]}',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${getweeklyjp.fridayaddress[index]}',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  )),
                              Spacer(),
                              Table(
                                children: [
                                  TableRow(children: [
                                    Text('Contact Number :',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                        )),
                                    Text(
                                        '${getweeklyjp.fridaycontactnumbers[index]}',
                                        style: TextStyle(color: orange)),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        );
                      })
                      : SizedBox()
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            saturdaytapped == true
                                ? CupertinoIcons.arrowtriangle_down_fill
                                : CupertinoIcons.arrowtriangle_right_fill,
                            color: orange,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              saturdaytapped == true ? saturdaytapped = false : saturdaytapped = true;
                            });
                          }),
                      Text(
                        "Saturday",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  saturdaytapped == true
                      ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getweeklyjp.saturdaystorenames.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          height: 80,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Text(
                                      '[${getweeklyjp.saturdaystorecodes[index]}]',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${getweeklyjp.saturdaystorenames[index]}',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${getweeklyjp.saturdayaddress[index]}',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  )),
                              Spacer(),
                              Table(
                                children: [
                                  TableRow(children: [
                                    Text('Contact Number :',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                        )),
                                    Text(
                                        '${getweeklyjp.saturdaycontactnumbers[index]}',
                                        style: TextStyle(color: orange)),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        );
                      })
                      : SizedBox()
                ],
              ),
            ]),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
