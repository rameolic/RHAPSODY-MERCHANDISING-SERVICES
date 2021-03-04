import 'package:flutter/material.dart';
import '../../../Constants.dart';
import 'package:flutter/cupertino.dart';
import '../MenuContent.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Maps_Veiw.dart';
import '../outletdetailes.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/api/Journeyplansapi/weekly/jpplanned.dart';



class WeeklyJourneyListBuilder extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<WeeklyJourneyListBuilder> {
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
    return getweeklyjp.storenames.length == 0 ? Center(child: Text("you dont have any active journey plan\ncontact your manager for more info",textAlign: TextAlign.center,)) :
    ListView.builder(
        itemCount:getweeklyjp.storenames.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async{
              setState(() {
                isApiCallProcess = true;
              });
              outletrequestdata.outletidpressed = getweeklyjp.outletids[index];
              checkinoutdata.checkid = getweeklyjp.id[index];
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
              print(checkinoutdata.checkid);
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '[${getweeklyjp.storecodes[index]}]',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${getweeklyjp.storenames[index]}',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text('${getweeklyjp.outletarea[index]}',
                          style: TextStyle(
                            fontSize: 15.0,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${getweeklyjp.outletcity[index]}',
                          style: TextStyle(
                            fontSize: 15.0,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${getweeklyjp.outletcountry[index]}',
                          style: TextStyle(
                            fontSize: 15.0,
                          )),
                    ],
                  ),
                  Spacer(),
                  Table(
                    children: [
                      TableRow(children: [
                        Text('Contact Number :',
                            style: TextStyle(
                              fontSize: 13.0,
                            )),
                        Text('${getweeklyjp.contactnumbers[index]}',
                            style: TextStyle(color: orange)),
                      ]),
                      TableRow(children: [
                        Text('Distance :',
                            style: TextStyle(
                              fontSize: 13.0,
                            )),
                        Row(
                          children: [
                            Text('${getweeklyjp.distanceinmeters[index].toStringAsFixed(2)}',
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