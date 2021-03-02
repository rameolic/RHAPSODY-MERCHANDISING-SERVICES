
import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/outletdetailes.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/api/jpskippedapi.dart';
import 'package:merchandising/ProgressHUD.dart';

class SkipedJourneyListBuilder extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SkipedJourneyListBuilder> {
  bool isApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    return  ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }
  Widget _uiSetup(BuildContext context) {
    return todayskipjplist.outletids.length == 0 ? Center(child: Text("you finished visiting every outlet\nthat was assigned to you",textAlign: TextAlign.center,)) :
    ListView.builder(
        itemCount: todayskipjplist.outletids.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async{
              setState(() {
                isApiCallProcess = true;
              });
              outletrequestdata.outletidpressed = todayskipjplist.outletids[index];
              checkinoutdata.checkid = todayskipjplist.id[index];
              var data = await outletwhencheckin();
              if(data != null ){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContextcontext) => OutLet()));
                setState(() {
                  isApiCallProcess = false;
                });
              }else{
                setState(() {
                  isApiCallProcess = false;
                });
              }
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
                        '[${todayskipjplist.storecodes[index]}]',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${todayskipjplist.storenames[index]}',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text('${todayskipjplist.outletarea[index]}',
                          style: TextStyle(
                            fontSize: 15.0,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${todayskipjplist.outletcity[index]}',
                          style: TextStyle(
                            fontSize: 15.0,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${todayskipjplist.outletcountry[index]}',
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
                        Text('${todayskipjplist.contactnumbers[index]}',
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
                            Text('${todayskipjplist.distanceinmeters[index].toStringAsFixed(2)}',
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