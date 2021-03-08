import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'package:intl/intl.dart';
import 'package:merchandising/api/timesheetmonthly.dart';
class month{
  static List<String>dates;
}
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
          int.parse(DateFormat('MM').format(DateTime.now()))
      )),
      (i) => "${DateFormat('MMM').format(DateTime.now())} ${'${i + 1}'}");
  static   bool day1 = false;
  static   bool day2 = false;
  static   bool day3 = false;
  static   bool day4 = false;
  static   bool day5 = false;
  static   bool day6 = false;
  static   bool day7 = false;
  static   bool day8 = false;
  static   bool day9 = false;
  static   bool day10 = false;
  static   bool day11 = false;
  static   bool day12 = false;
  static   bool day13 = false;
  static   bool day14 = false;
  static   bool day15 = false;
  static   bool day16 = false;
  static   bool day17 = false;
  static   bool day18 = false;
  static   bool day19 = false;
  static   bool day20 = false;
  static   bool day21 = false;
  static   bool day22 = false;
  static   bool day23 = false;
  static   bool day24 = false;
  static   bool day25 = false;
  static   bool day26 = false;
  static   bool day27 = false;
  static   bool day28 = false;
  static   bool day29 = false;
  static   bool day30 = false;
  static   bool day31 = false;

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
                  listOfDates[1-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day1 == true ? day1list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day2 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day2==false?day2=true:day2=false;
                      });
                    }),
                Text(
                  listOfDates[2-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day2 == true ? day2list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day3 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day3==false?day3=true:day3=false;
                      });
                    }),
                Text(
                  listOfDates[3-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day3 == true ? day3list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day4 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day4==false?day4=true:day4=false;
                      });
                    }),
                Text(
                  listOfDates[4-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day4 == true ? day4list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day5 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day5==false?day5=true:day5=false;
                      });
                    }),
                Text(
                  listOfDates[5-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day5 == true ? day5list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day6 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day6==false?day6=true:day6=false;
                      });
                    }),
                Text(
                  listOfDates[6-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day6 == true ? day6list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day7 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day7==false?day7=true:day7=false;
                      });
                    }),
                Text(
                  listOfDates[7-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day7 == true ? day7list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day8 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day8==false?day8=true:day8=false;
                      });
                    }),
                Text(
                  listOfDates[8-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day8 == true ? day8list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day9 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day9==false?day9=true:day9=false;
                      });
                    }),
                Text(
                  listOfDates[9-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day9 == true ? day9list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day10 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day10==false?day10=true:day10=false;
                      });
                    }),
                Text(
                  listOfDates[10-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day10 == true ? day10list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day11 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day11==false?day11=true:day11=false;
                      });
                    }),
                Text(
                  listOfDates[11-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day11 == true ? day11list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day12 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day12==false?day12=true:day12=false;
                      });
                    }),
                Text(
                  listOfDates[12-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day12 == true ? day12list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day13 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day13==false?day13=true:day13=false;
                      });
                    }),
                Text(
                  listOfDates[13-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day13 == true ? day13list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day14 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day14==false?day14=true:day14=false;
                      });
                    }),
                Text(
                  listOfDates[14-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day14 == true ? day14list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day15 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day15==false?day15=true:day15=false;
                      });
                    }),
                Text(
                  listOfDates[15-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day15 == true ? day15list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day16 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day16==false?day16=true:day16=false;
                      });
                    }),
                Text(
                  listOfDates[16-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day16 == true ? day16list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day17 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day17==false?day17=true:day17=false;
                      });
                    }),
                Text(
                  listOfDates[17-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day17 == true ? day17list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day18 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day18==false?day18=true:day18=false;
                      });
                    }),
                Text(
                  listOfDates[18-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day18 == true ? day18list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day19 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day19==false?day19=true:day19=false;
                      });
                    }),
                Text(
                  listOfDates[19-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day19 == true ? day19list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day20 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day20==false?day20=true:day20=false;
                      });
                    }),
                Text(
                  listOfDates[20-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day20 == true ? day20list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day21 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day21==false?day21=true:day21=false;
                      });
                    }),
                Text(
                  listOfDates[21-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day21 == true ? day21list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day22 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day22==false?day22=true:day22=false;
                      });
                    }),
                Text(
                  listOfDates[22-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day22 == true ? day22list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day23 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day23==false?day23=true:day23=false;
                      });
                    }),
                Text(
                  listOfDates[23-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day23 == true ? day23list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day24 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day24==false?day24=true:day24=false;
                      });
                    }),
                Text(
                  listOfDates[24-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day24 == true ? day24list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day25 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day25==false?day25=true:day25=false;
                      });
                    }),
                Text(
                  listOfDates[25-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day25 == true ? day25list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day26 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day26==false?day26=true:day26=false;
                      });
                    }),
                Text(
                  listOfDates[26-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day26 == true ? day26list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day27 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day27==false?day27=true:day27=false;
                      });
                    }),
                Text(
                  listOfDates[27-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day27 == true ? day27list() : SizedBox(),
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      day28 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day28==false?day28=true:day28=false;
                      });
                    }),
                Text(
                  listOfDates[28-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            day28 == true ? day28list() : SizedBox(),
            listOfDates.length > 28 ? Row(
              children: [
                IconButton(
                    icon: Icon(
                      day29 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day29==false?day29=true:day29=false;
                      });
                    }),
                Text(
                  listOfDates[29-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ) :SizedBox(),
            listOfDates.length > 28 ? day29 == true ? day29list() : SizedBox() :SizedBox(),
            listOfDates.length > 29 ?Row(
              children: [
                IconButton(
                    icon: Icon(
                      day30 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day30==false?day30=true:day30=false;
                      });
                    }),
                Text(
                  listOfDates[30-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ) :SizedBox(),
            listOfDates.length > 29 ?day30 == true ? day30list() : SizedBox() :SizedBox(),
            listOfDates.length > 30 ?Row(
              children: [
                IconButton(
                    icon: Icon(
                      day31 == false ?
                      CupertinoIcons.arrowtriangle_right_fill: CupertinoIcons.arrowtriangle_down_fill,
                      color: orange,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        day31==false?day31=true:day31=false;
                      });
                    }),
                Text(
                  listOfDates[31-1],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ) :SizedBox(),
            listOfDates.length > 30 ?day31 == true ? day31list() : SizedBox() :SizedBox(),

          ],
        ),
      )

    );
  }
}


class day1list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day1.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day1[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day2list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day2.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day2[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day3list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day3.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day3[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day4list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day4.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day4[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day5list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day5.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day5[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day6list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day6.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day6[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day7list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day7.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day7[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day8list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day8.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day8[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day9list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day9.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day9[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day10list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day10.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day10[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day11list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day11.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day11[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day12list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day12.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day12[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day13list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day13.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day13[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day14list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day14.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day14[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day15list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day15.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day15[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day16list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day16.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day16[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day17list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day17.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day17[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day18list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day18.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day18[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day19list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day19.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day19[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day20list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day20.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day20[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day21list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day21.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day21[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day22list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day22.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day22[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day23list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day23.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day23[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day24list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day24.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day24[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day25list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day25.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day25[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day26list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day26.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day26[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day27list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day27.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day27[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day28list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day28.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day28[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day29list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day29.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day29[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day30list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day30.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day30[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
class day31list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: TMmonthly.day31.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.fromLTRB(10.0,0,10.0,10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.00)),
            width: MediaQuery.of(context).size.width,
            child: Text(
              TMmonthly.day31[index],
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
































