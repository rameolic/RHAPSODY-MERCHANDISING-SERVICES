
import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/model/distanceinmeters.dart';
import 'package:merchandising/pages/outletdetailes.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/api/jprequest.dart';
import 'package:merchandising/ProgressHUD.dart';

class SkipedJourneyListBuilder extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SkipedJourneyListBuilder> {
  List<int> ids = <int>[
    JPResponseskippeddata.id1,
    JPResponseskippeddata.id2,
    JPResponseskippeddata.id3,
    JPResponseskippeddata.id4,
    JPResponseskippeddata.id5,
    JPResponseskippeddata.id6,
    JPResponseskippeddata.id7,
    JPResponseskippeddata.id8,
    JPResponseskippeddata.id9,
    JPResponseskippeddata.id10,
    JPResponseskippeddata.id11,
    JPResponseskippeddata.id12,
    JPResponseskippeddata.id13,
    JPResponseskippeddata.id14,
    JPResponseskippeddata.id15,
    JPResponseskippeddata.id16,
    JPResponseskippeddata.id17,
    JPResponseskippeddata.id18,
    JPResponseskippeddata.id19,
    JPResponseskippeddata.id20,
  ];
 List<int> outletids = <int>[
    JPResponseskippeddata.outletiddata1,
    JPResponseskippeddata.outletiddata2,
    JPResponseskippeddata.outletiddata3,
    JPResponseskippeddata.outletiddata4,
    JPResponseskippeddata.outletiddata5,
    JPResponseskippeddata.outletiddata6,
    JPResponseskippeddata.outletiddata7,
    JPResponseskippeddata.outletiddata8,
    JPResponseskippeddata.outletiddata9,
    JPResponseskippeddata.outletiddata10,
    JPResponseskippeddata.outletiddata11,
    JPResponseskippeddata.outletiddata12,
    JPResponseskippeddata.outletiddata13,
    JPResponseskippeddata.outletiddata14,
    JPResponseskippeddata.outletiddata15,
    JPResponseskippeddata.outletiddata16,
    JPResponseskippeddata.outletiddata17,
    JPResponseskippeddata.outletiddata18,
    JPResponseskippeddata.outletiddata19,
    JPResponseskippeddata.outletiddata20,
  ];
  List<String> names = <String>[
    JPResponseskippeddata.outletnamedata1,
    JPResponseskippeddata.outletnamedata2,
    JPResponseskippeddata.outletnamedata3,
    JPResponseskippeddata.outletnamedata4,
    JPResponseskippeddata.outletnamedata5,
    JPResponseskippeddata.outletnamedata6,
    JPResponseskippeddata.outletnamedata7,
    JPResponseskippeddata.outletnamedata8,
    JPResponseskippeddata.outletnamedata9,
    JPResponseskippeddata.outletnamedata10,
    JPResponseskippeddata.outletnamedata11,
    JPResponseskippeddata.outletnamedata12,
    JPResponseskippeddata.outletnamedata13,
    JPResponseskippeddata.outletnamedata14,
    JPResponseskippeddata.outletnamedata15,
    JPResponseskippeddata.outletnamedata16,
    JPResponseskippeddata.outletnamedata17,
    JPResponseskippeddata.outletnamedata18,
    JPResponseskippeddata.outletnamedata19,
    JPResponseskippeddata.outletnamedata20,
  ];
 List<String> area = <String>[
    JPResponseskippeddata.outletareadata1,
    JPResponseskippeddata.outletareadata2,
    JPResponseskippeddata.outletareadata3,
    JPResponseskippeddata.outletareadata4,
    JPResponseskippeddata.outletareadata5,
    JPResponseskippeddata.outletareadata6,
    JPResponseskippeddata.outletareadata7,
    JPResponseskippeddata.outletareadata8,
    JPResponseskippeddata.outletareadata9,
    JPResponseskippeddata.outletareadata10,
    JPResponseskippeddata.outletareadata11,
    JPResponseskippeddata.outletareadata12,
    JPResponseskippeddata.outletareadata13,
    JPResponseskippeddata.outletareadata14,
    JPResponseskippeddata.outletareadata15,
    JPResponseskippeddata.outletareadata16,
    JPResponseskippeddata.outletareadata17,
    JPResponseskippeddata.outletareadata18,
    JPResponseskippeddata.outletareadata19,
    JPResponseskippeddata.outletareadata20,
  ];
  List<String> city = <String>[
    JPResponseskippeddata.outletcitydata1,
    JPResponseskippeddata.outletcitydata2,
    JPResponseskippeddata.outletcitydata3,
    JPResponseskippeddata.outletcitydata4,
    JPResponseskippeddata.outletcitydata5,
    JPResponseskippeddata.outletcitydata6,
    JPResponseskippeddata.outletcitydata7,
    JPResponseskippeddata.outletcitydata8,
    JPResponseskippeddata.outletcitydata9,
    JPResponseskippeddata.outletcitydata10,
    JPResponseskippeddata.outletcitydata11,
    JPResponseskippeddata.outletcitydata12,
    JPResponseskippeddata.outletcitydata13,
    JPResponseskippeddata.outletcitydata14,
    JPResponseskippeddata.outletcitydata15,
    JPResponseskippeddata.outletcitydata16,
    JPResponseskippeddata.outletcitydata17,
    JPResponseskippeddata.outletcitydata18,
    JPResponseskippeddata.outletcitydata19,
    JPResponseskippeddata.outletcitydata20,
  ];
  List<String> country = <String>[
    JPResponseskippeddata.outletcountrydata1,
    JPResponseskippeddata.outletcountrydata2,
    JPResponseskippeddata.outletcountrydata3,
    JPResponseskippeddata.outletcountrydata4,
    JPResponseskippeddata.outletcountrydata5,
    JPResponseskippeddata.outletcountrydata6,
    JPResponseskippeddata.outletcountrydata7,
    JPResponseskippeddata.outletcountrydata8,
    JPResponseskippeddata.outletcountrydata9,
    JPResponseskippeddata.outletcountrydata10,
    JPResponseskippeddata.outletcountrydata11,
    JPResponseskippeddata.outletcountrydata12,
    JPResponseskippeddata.outletcountrydata13,
    JPResponseskippeddata.outletcountrydata14,
    JPResponseskippeddata.outletcountrydata15,
    JPResponseskippeddata.outletcountrydata16,
    JPResponseskippeddata.outletcountrydata17,
    JPResponseskippeddata.outletcountrydata18,
    JPResponseskippeddata.outletcountrydata19,
    JPResponseskippeddata.outletcountrydata20,
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
    int outletscount = 0;
    for (final outletid in names) {
      if (outletid != null) {
        outletscount++;
      }
    }
    return outletscount;
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
    return itemsno() == 0 ? Center(child: Text("you finished visiting every outlet\nthat was assigned to you",textAlign: TextAlign.center,)) :
    ListView.builder(
        itemCount: itemsno(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                isApiCallProcess = true;
              });
              outletrequestdata.outletidpressed = outletids[index];
              outletwhencheckin();
              checkinoutdata.checkid = ids[index];
              Future.delayed(const Duration(seconds: 3), () {
                if (chekinoutlet.checkinlat != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContextcontext) => OutLet()));
                  setState(() {
                    isApiCallProcess = false;
                  });
                } else if (chekinoutlet.checkinlat != null) {
                  Future.delayed(const Duration(seconds: 5), () {
                    setState(() {
                      isApiCallProcess = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContextcontext) => OutLet()));
                  });
                }
                else{
                  setState(() {
                    isApiCallProcess = false;
                  });
                }
              });
            },
            child: Container(
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
            ),
          );
        });
  }
}