import 'package:merchandising/Fieldmanager/addjp.dart';
import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';


class FMJouneyplan extends StatefulWidget {
  @override
  _FMJouneyplanState createState() => _FMJouneyplanState();
}

class _FMJouneyplanState extends State<FMJouneyplan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: orange),
        backgroundColor: containerscolor,
        title: Text(
          "Journey Plan",
          style: TextStyle(color: orange),
        ),
      ),
      drawer: Drawer(
      child: Menu(),
    ),
      body: Stack(
        children: [
          BackGround(),
          Container(
            child: Column(
              children: [
                ListJourneyPlan(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(15.0),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => AddJourneyPlan()));
                },
                backgroundColor: pink,
                elevation: 8.0,
                child: Icon(
                  Icons.add,
                  color: orange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListJourneyPlan extends StatefulWidget {
  @override
  _ListJourneyPlanState createState() => _ListJourneyPlanState();
}

class _ListJourneyPlanState extends State<ListJourneyPlan> {
  static final List<String> serialno = <String>[
    "1",
    "2",
  ];
  static final List<String> merchandisername = <String>[
    "name1",
    "name2",
  ];
  static final List<String> day = <String>[
    "64.98753",
    "73.903215",
  ];
  static final List<String> location = <String>[
    "42.87687",
    "34.09866",
  ];
  static final List<String> status = <String>[
    "Completed",
    "Pending",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: serialno.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 150,
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      'Serial No :',
                      style: TextStyle(
                          fontSize: 15.0,),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('${serialno[index]}'),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text('Merchandiser Name:',
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text('${merchandisername[index]}',
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text('Day :',
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text('${day[index]}',
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text('Location :',
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text('${location[index]}',
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text('Status :',
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text('${status[index]}',
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),

              ],
            ),
          );
        });
  }
}
