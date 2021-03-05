import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'package:intl/intl.dart';

int daysInMonth(DateTime date) {
  var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
  var firstDayNextMonth = new DateTime(firstDayThisMonth.year,
      firstDayThisMonth.month + 1, firstDayThisMonth.day);
  return firstDayNextMonth.difference(firstDayThisMonth).inDays;
}

class Timesheetmonthly extends StatefulWidget {
  @override
  _TimesheetmonthlyState createState() => _TimesheetmonthlyState();
}

class _TimesheetmonthlyState extends State<Timesheetmonthly> {
  var listOfDates = new List<String>.generate(
      daysInMonth(DateTime(int.parse(DateFormat('yyyy').format(DateTime.now())),
          int.parse(DateFormat('MM').format(DateTime.now())))),
      (i) =>
          "${i + 1}-${int.parse(DateFormat('MM').format(DateTime.now()))}-${int.parse(DateFormat('yyyy').format(DateTime.now()))}");

  List<String> outletname = <String>[
    "Outletname",
    "Outletname",
    "Outletname",
    "Outletname",
    "Outletname",
    "Outletname"
  ];

  List<String> checkintime = <String>[
    "checkintime",
    "Outletname",
    "Outletname",
    "Outletname",
    "Outletname",
    "Outletname"
  ];

  List<String> days = <String>[
    "today",
    "today",
    "today",
    "today",
    "tomorrow",
    "tomorrow"
  ];

  List<String> checkouttime = <String>[
    "Outletname",
    "Outletname",
    "Outletname",
    "Outletname",
    "Outletname",
    "Outletname"
  ];

  bool day1 = false;

  bool day2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.4,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
      decoration: BoxDecoration(
          color: pink, borderRadius: BorderRadius.circular(10.00)),
      child: SingleChildScrollView(
        child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            day1 == false ?
                            CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                            color: orange,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              day1==false?day1=true:day1=false;
                            });
                          }),
                      Text(
                        listOfDates[0],
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
      )

    );
  }
}
