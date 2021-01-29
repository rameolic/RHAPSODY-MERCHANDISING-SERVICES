import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'availabitiy.dart';
import 'shareofshelf.dart';
import 'PlanogramcheckPhase1.dart';
import 'NPD Check.dart';
import 'CompetitionCheckOne.dart';
import 'Visibility.dart';



class CustomerActivities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Text(
          'Customer Activities',
          style: TextStyle(color: orange),
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
                OutletDetails(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Activities(
                      icon: CupertinoIcons.chart_bar_alt_fill,
                      chartext: 'Availability',
                      tap: Availability(),
                    ),
                    Activities(
                      icon: CupertinoIcons.eye_solid,
                      chartext: 'Visibility',
                      tap: VisibilityOne(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Activities(
                      icon: Icons.table_chart_sharp,
                      chartext: 'Share of Shelf',
                      tap: ShareShelf(),
                    ),
                    Activities(
                      icon: Icons.table_rows,
                      chartext: 'Share of Assortment',
                      tap: ShareShelf(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Activities(
                      icon: CupertinoIcons.checkmark_seal_fill,
                      chartext: 'Promotion Check',
                      tap: Availability(),
                    ),
                    Activities(
                      icon: CupertinoIcons.doc_checkmark_fill,
                      chartext: 'Planogram Check',
                      tap: PlanogramCheckPhase1(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Activities(
                      icon: CupertinoIcons.info_circle_fill,
                      chartext: 'Compitetor info Capture',
                      tap: CompetitionCheckOne(),
                    ),
                    Activities(
                      icon: Icons.center_focus_strong_rounded,
                      chartext: 'Focus/NPD Check',
                      tap: FocusNPDCheck(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Activities extends StatelessWidget {
  Activities({this.icon,this.chartext,this.tap});
  final icon;
  final chartext;
  final tap;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
              tap));},
      child: Container(
        height: MediaQuery.of(context).size.height/7.5,
        width: MediaQuery.of(context).size.width/2.15,
        margin: EdgeInsets.only(left: 5,bottom: 10,right: 5),
        decoration: BoxDecoration(color: pink,borderRadius:BorderRadius.circular(10)),
        child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              Icon(icon, size:50.0, color: Color(0xff424B4D)),
              Text(chartext,style: TextStyle(fontSize: 13),),
            ]
        ),
        ),
      ),
    );
  }
}