import 'package:flutter/material.dart';
import '../../../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/api/Journeyplansapi/weekly/jpskipped.dart';

class WeeklySkipJourneyListBuilder extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<WeeklySkipJourneyListBuilder> {
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
                            print(getweeklyskipjp.sundaystorenames);
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
                      itemCount: getweeklyskipjp.sundayaddress.length,
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
                                      '[${getweeklyskipjp.sundaystorecodes[index]}]',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${getweeklyskipjp.sundaystorenames[index]}',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${getweeklyskipjp.sundayaddress[index]}',
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
                                        '${getweeklyskipjp.sundaycontactnumbers[index]}',
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
                      itemCount: getweeklyskipjp.mondayaddress.length,
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
                                      '[${getweeklyskipjp.mondaystorecodes[index]}]',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${getweeklyskipjp.mondaystorenames[index]}',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${getweeklyskipjp.mondayaddress[index]}',
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
                                        '${getweeklyskipjp.mondaycontactnumbers[index]}',
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
                      itemCount: getweeklyskipjp.tuesdayaddress.length,
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
                                      '[${getweeklyskipjp.tuesdaystorecodes[index]}]',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${getweeklyskipjp.tuesdaystorenames[index]}',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${getweeklyskipjp.tuesdayaddress[index]}',
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
                                        '${getweeklyskipjp.tuesdaycontactnumbers[index]}',
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
                      itemCount: getweeklyskipjp.wednesdayaddress.length,
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
                                      '[${getweeklyskipjp.wednesdaystorecodes[index]}]',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${getweeklyskipjp.wednesdaystorenames[index]}',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${getweeklyskipjp.wednesdayaddress[index]}',
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
                                        '${getweeklyskipjp.wednesdaycontactnumbers[index]}',
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
                      itemCount: getweeklyskipjp.thrusdayaddress.length,
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
                                      '[${getweeklyskipjp.thrusdaystorecodes[index]}]',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${getweeklyskipjp.thrusdaystorenames[index]}',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${getweeklyskipjp.thrusdayaddress[index]}',
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
                                        '${getweeklyskipjp.thrusdaycontactnumbers[index]}',
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
                      itemCount: getweeklyskipjp.fridayaddress.length,
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
                                      '[${getweeklyskipjp.fridaystorecodes[index]}]',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${getweeklyskipjp.fridaystorenames[index]}',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${getweeklyskipjp.fridayaddress[index]}',
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
                                        '${getweeklyskipjp.fridaycontactnumbers[index]}',
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
                      itemCount: getweeklyskipjp.saturdaystorenames.length,
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
                                      '[${getweeklyskipjp.saturdaystorecodes[index]}]',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${getweeklyskipjp.saturdaystorenames[index]}',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text('${getweeklyskipjp.saturdayaddress[index]}',
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
                                        '${getweeklyskipjp.saturdaycontactnumbers[index]}',
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
