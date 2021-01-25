import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'availabitiy.dart';


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
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/15,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10,bottom: 10,right: 5,left: 5),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: pink,
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Icon(
                          Icons.house_sharp,
                          color: iconscolor,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "[5478] CARREFOUR MOE",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("Ground Floor,MOE,E11 Sheikh Zayed Dubai"),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.0),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                    childAspectRatio: 3/1.8,
                    crossAxisCount: 2,
                    children: List.generate(choices.length, (index) {
                      return Center(
                        child: SelectCard(choice: choices[index]),
                      );
                    })),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon,});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Availability', icon: CupertinoIcons.chart_bar_alt_fill,),
  const Choice(title: 'Visibility', icon: CupertinoIcons.eye_solid),
  const Choice(title: 'Share of Shelf', icon: Icons.table_chart_sharp),
  const Choice(title: 'Share of Assortment', icon: Icons.table_rows),
  const Choice(title: 'Promotion Check', icon: CupertinoIcons.checkmark_seal_fill),
  const Choice(title: 'Planogram Check', icon: CupertinoIcons.doc_checkmark_fill),
  const Choice(title: 'Compitetor info Capture', icon: CupertinoIcons.info_circle_fill),
  const Choice(title: 'Focus/NPD Check', icon: Icons.center_focus_strong_rounded),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  Availability()));},
      child: Container(
        margin: EdgeInsets.only(left: 5,bottom: 10,right: 5),
        decoration: BoxDecoration(color: pink,borderRadius:BorderRadius.circular(10)),
        child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              Icon(choice.icon, size:50.0, color: Color(0xff424B4D)),
              Text(choice.title,style: TextStyle(fontSize: 15),),
            ]
        ),
        ),
      ),
    );
  }
}