import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';

class TimeSheet extends StatefulWidget {
  @override
  _TimeSheetState createState() => _TimeSheetState();
}

class _TimeSheetState extends State<TimeSheet> {
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
            SubmitButton(
              onpress: () {},
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                SizedBox(
                  child:
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Text("Merchandiser Name:",style: TextStyle(fontSize: 18,color: Colors.white),
                    ),
                  )
                ),
                SizedBox(
                    child:
                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: Text("Merchandiser ID:",style: TextStyle(fontSize: 18,color: Colors.white),
                      ),
                    )
                ),
                Container(

                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Timedate(),
                      timesheetdatetwo(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Timedate extends StatefulWidget {
  @override
  _TimedateState createState() => _TimedateState();
}

class _TimedateState extends State<Timedate> {
  @override
  bool trianglevalue = false;
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: trianglevalue == false
                    ? Icon(
                        CupertinoIcons.arrowtriangle_right_fill,
                        size: 15,
                      )
                    : Icon(
                        CupertinoIcons.arrowtriangle_down_fill,
                        size: 15,
                      ),
                onPressed: () {
                  setState(() {
                    trianglevalue == false
                        ? trianglevalue = true
                        : trianglevalue = false;
                  });
                },
              ),
              Text(
                "01-JAN-2021",
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          trianglevalue == true ? DropDownOne() : SizedBox(height: 10),
        ],
      ),
    );
  }
}

class timesheetdatetwo extends StatefulWidget {
  @override
  _timesheetdatetwoState createState() => _timesheetdatetwoState();
}

class _timesheetdatetwoState extends State<timesheetdatetwo> {
  @override
  bool trianglevalue = false;
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: trianglevalue == false
                    ? Icon(
                        CupertinoIcons.arrowtriangle_right_fill,
                        size: 15,
                      )
                    : Icon(
                        CupertinoIcons.arrowtriangle_down_fill,
                        size: 15,
                      ),
                onPressed: () {
                  setState(() {
                    trianglevalue == false
                        ? trianglevalue = true
                        : trianglevalue = false;
                  });
                },
              ),
              Text(
                "02-JAN-2021",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          trianglevalue == true ? DropdownTwo() : SizedBox(height: 10),
        ],
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  SubmitButton({@required this.onpress});
  final onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.only(right: 10.00),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xffFFDBC1),
          borderRadius: BorderRadius.circular(10.00),
        ),
        child: Text(
          'Submit',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}

class DropDownOne extends StatefulWidget {
  @override
  _DropDownOneState createState() => _DropDownOneState();
}

class _DropDownOneState extends State<DropDownOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: pink, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Table(
            columnWidths: {
              0: FractionColumnWidth(0.50),
              1: FractionColumnWidth(0.3),
              2: FractionColumnWidth(0.25),
            },
            children: [
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: Text(
                      "OUTLETS",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "START TIME",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "END TIME",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    "Sheba Super Market",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "09.25 AM",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "10.10 AM",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    "Fair Mart Super Market",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "10.25 AM",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "11.10 AM",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    "Umm Al Sheif Market",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "11.25 AM",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "11.50 AM",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class DropdownTwo extends StatefulWidget {
  @override
  _DropdownTwoState createState() => _DropdownTwoState();
}

class _DropdownTwoState extends State<DropdownTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: pink, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Table(
            columnWidths: {
              0: FractionColumnWidth(0.50),
              1: FractionColumnWidth(0.3),
              2: FractionColumnWidth(0.25),
            },
            children: [
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: Text(
                      "OUTLETS",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "START TIME",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "END TIME",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    "Al Quoz Market",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "09.25 AM",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "10.10 AM",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    "Umm Al Sheif Market",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "10.25 AM",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "11.10 AM",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
