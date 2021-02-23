
import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/model/distanceinmeters.dart';
import 'package:merchandising/pages/outletdetailes.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/api/jprequest.dart';
import 'package:merchandising/ProgressHUD.dart';


class visitedJourneyListBuilder extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<visitedJourneyListBuilder> {
   List<int> ids = <int>[
    JPResponsevisiteddata.id1,
    JPResponsevisiteddata.id2,
    JPResponsevisiteddata.id3,
    JPResponsevisiteddata.id4,
    JPResponsevisiteddata.id5,
    JPResponsevisiteddata.id6,
    JPResponsevisiteddata.id7,
    JPResponsevisiteddata.id8,
    JPResponsevisiteddata.id9,
    JPResponsevisiteddata.id10,
    JPResponsevisiteddata.id11,
    JPResponsevisiteddata.id12,
    JPResponsevisiteddata.id13,
    JPResponsevisiteddata.id14,
    JPResponsevisiteddata.id15,
    JPResponsevisiteddata.id16,
    JPResponsevisiteddata.id17,
    JPResponsevisiteddata.id18,
    JPResponsevisiteddata.id19,
    JPResponsevisiteddata.id20,
  ];
   List<int> outletids = <int>[
    JPResponsevisiteddata.outletiddata1,
    JPResponsevisiteddata.outletiddata2,
    JPResponsevisiteddata.outletiddata3,
    JPResponsevisiteddata.outletiddata4,
    JPResponsevisiteddata.outletiddata5,
    JPResponsevisiteddata.outletiddata6,
    JPResponsevisiteddata.outletiddata7,
    JPResponsevisiteddata.outletiddata8,
    JPResponsevisiteddata.outletiddata9,
    JPResponsevisiteddata.outletiddata10,
    JPResponsevisiteddata.outletiddata11,
    JPResponsevisiteddata.outletiddata12,
    JPResponsevisiteddata.outletiddata13,
    JPResponsevisiteddata.outletiddata14,
    JPResponsevisiteddata.outletiddata15,
    JPResponsevisiteddata.outletiddata16,
    JPResponsevisiteddata.outletiddata17,
    JPResponsevisiteddata.outletiddata18,
    JPResponsevisiteddata.outletiddata19,
    JPResponsevisiteddata.outletiddata20,
  ];
   List<String> names = <String>[
    JPResponsevisiteddata.outletnamedata1,
    JPResponsevisiteddata.outletnamedata2,
    JPResponsevisiteddata.outletnamedata3,
    JPResponsevisiteddata.outletnamedata4,
    JPResponsevisiteddata.outletnamedata5,
    JPResponsevisiteddata.outletnamedata6,
    JPResponsevisiteddata.outletnamedata7,
    JPResponsevisiteddata.outletnamedata8,
    JPResponsevisiteddata.outletnamedata9,
    JPResponsevisiteddata.outletnamedata10,
    JPResponsevisiteddata.outletnamedata11,
    JPResponsevisiteddata.outletnamedata12,
    JPResponsevisiteddata.outletnamedata13,
    JPResponsevisiteddata.outletnamedata14,
    JPResponsevisiteddata.outletnamedata15,
    JPResponsevisiteddata.outletnamedata16,
    JPResponsevisiteddata.outletnamedata17,
    JPResponsevisiteddata.outletnamedata18,
    JPResponsevisiteddata.outletnamedata19,
    JPResponsevisiteddata.outletnamedata20,
  ];
   List<String> area = <String>[
    JPResponsevisiteddata.outletareadata1,
    JPResponsevisiteddata.outletareadata2,
    JPResponsevisiteddata.outletareadata3,
    JPResponsevisiteddata.outletareadata4,
    JPResponsevisiteddata.outletareadata5,
    JPResponsevisiteddata.outletareadata6,
    JPResponsevisiteddata.outletareadata7,
    JPResponsevisiteddata.outletareadata8,
    JPResponsevisiteddata.outletareadata9,
    JPResponsevisiteddata.outletareadata10,
    JPResponsevisiteddata.outletareadata11,
    JPResponsevisiteddata.outletareadata12,
    JPResponsevisiteddata.outletareadata13,
    JPResponsevisiteddata.outletareadata14,
    JPResponsevisiteddata.outletareadata15,
    JPResponsevisiteddata.outletareadata16,
    JPResponsevisiteddata.outletareadata17,
    JPResponsevisiteddata.outletareadata18,
    JPResponsevisiteddata.outletareadata19,
    JPResponsevisiteddata.outletareadata20,
  ];
  List<String> city = <String>[
    JPResponsevisiteddata.outletcitydata1,
    JPResponsevisiteddata.outletcitydata2,
    JPResponsevisiteddata.outletcitydata3,
    JPResponsevisiteddata.outletcitydata4,
    JPResponsevisiteddata.outletcitydata5,
    JPResponsevisiteddata.outletcitydata6,
    JPResponsevisiteddata.outletcitydata7,
    JPResponsevisiteddata.outletcitydata8,
    JPResponsevisiteddata.outletcitydata9,
    JPResponsevisiteddata.outletcitydata10,
    JPResponsevisiteddata.outletcitydata11,
    JPResponsevisiteddata.outletcitydata12,
    JPResponsevisiteddata.outletcitydata13,
    JPResponsevisiteddata.outletcitydata14,
    JPResponsevisiteddata.outletcitydata15,
    JPResponsevisiteddata.outletcitydata16,
    JPResponsevisiteddata.outletcitydata17,
    JPResponsevisiteddata.outletcitydata18,
    JPResponsevisiteddata.outletcitydata19,
    JPResponsevisiteddata.outletcitydata20,
  ];
   List<String> country = <String>[
    JPResponsevisiteddata.outletcountrydata1,
    JPResponsevisiteddata.outletcountrydata2,
    JPResponsevisiteddata.outletcountrydata3,
    JPResponsevisiteddata.outletcountrydata4,
    JPResponsevisiteddata.outletcountrydata5,
    JPResponsevisiteddata.outletcountrydata6,
    JPResponsevisiteddata.outletcountrydata7,
    JPResponsevisiteddata.outletcountrydata8,
    JPResponsevisiteddata.outletcountrydata9,
    JPResponsevisiteddata.outletcountrydata10,
    JPResponsevisiteddata.outletcountrydata11,
    JPResponsevisiteddata.outletcountrydata12,
    JPResponsevisiteddata.outletcountrydata13,
    JPResponsevisiteddata.outletcountrydata14,
    JPResponsevisiteddata.outletcountrydata15,
    JPResponsevisiteddata.outletcountrydata16,
    JPResponsevisiteddata.outletcountrydata17,
    JPResponsevisiteddata.outletcountrydata18,
    JPResponsevisiteddata.outletcountrydata19,
    JPResponsevisiteddata.outletcountrydata20,
  ];
   List<String> contactnumber = <String>[
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480',
    '+971543086480'
  ];

  int itemsno() {
    outletids.forEach((elements) => (null));
    int count = 0;
    for (final outletid in names) {
      if (outletid != null) {
        count++;
      }
    }
    print(count);
    return count;
  }

  bool isApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    return  ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.1,
    );
  }
  Widget _uiSetup(BuildContext context) {
    return itemsno() == 0 ? Center(child: Text("you haven't finished any outlet\n start your journey from planned journey Plan",textAlign: TextAlign.center,)) :
    ListView.builder(
        itemCount:itemsno(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 120,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '[${outletids[index]}]',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${names[index]}',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text('${area[index]}',
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text('${city[index]}',
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text('${country[index]}',
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
                Spacer(),
                Table(
                  children: [
                    TableRow(children: [
                      Text('Contact Number',
                          style: TextStyle(
                            fontSize: 13.0,
                          )),
                      Text(":"),
                      Text('${contactnumber[index]}',
                          style: TextStyle(color: orange)),
                    ]),
                    TableRow(children: [
                      Text('Distance',
                          style: TextStyle(
                            fontSize: 13.0,
                          )),
                      Text(":"),
                      Row(
                        children: [
                          Text('100',//${distancenum[index]}
                              style: TextStyle(color: orange)),
                          Text("KM", style: TextStyle(color: orange))
                        ],
                      ),
                    ]),
                  ],
                ),
              ],
            ),
          );
        });
  }
}