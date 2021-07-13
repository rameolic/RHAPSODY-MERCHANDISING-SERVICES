import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:merchandising/offlinedata/syncreferenceapi.dart';
import 'package:flutter/widgets.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Customers Activities.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:merchandising/api/timesheetapi.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/model/rememberme.dart';
import 'package:intl/intl.dart';
import 'package:merchandising/model/merchandiserschatusers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Leave Request.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Time Sheet.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:flushbar/flushbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:merchandising/api/timesheetmonthly.dart';
import 'package:merchandising/api/Journeyplansapi/weekly/jpskipped.dart';
import 'package:merchandising/api/Journeyplansapi/weekly/jpvisited.dart';
import 'package:merchandising/api/Journeyplansapi/weekly/jpplanned.dart';
import 'package:merchandising/api/Journeyplansapi/todayplan/journeyplanapi.dart';
import 'package:merchandising/api/clientapi/stockexpirydetailes.dart';
import 'package:merchandising/api/Journeyplansapi/todayplan/jpskippedapi.dart';
import 'package:merchandising/api/Journeyplansapi/todayplan/JPvisitedapi.dart';
import 'package:merchandising/model/distanceinmeters.dart';
import 'package:merchandising/api/leavestakenapi.dart';
import 'package:merchandising/model/chatscreen.dart';

import 'package:merchandising/api/customer_activites_api/visibilityapi.dart';
import 'package:merchandising/api/customer_activites_api/share_of_shelf_detailsapi.dart';
import 'package:merchandising/api/customer_activites_api/competition_details.dart';
import 'package:merchandising/api/customer_activites_api/promotion_detailsapi.dart';
import 'package:merchandising/api/avaiablityapi.dart';
import 'package:merchandising/api/customer_activites_api/Competitioncheckapi.dart';
import 'package:merchandising/api/customer_activites_api/planogramdetailsapi.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'package:location_permissions/location_permissions.dart';
import 'package:merchandising/model/Location_service.dart';
import 'package:merchandising/api/FMapi/nbl_detailsapi.dart';
import 'package:merchandising/api/FMapi/nbl_detailsapi.dart';
import 'dart:io' show Platform;
import 'package:merchandising/offlinedata/syncsendapi.dart';

class SyncScreen extends StatefulWidget {

  @override
  _SyncScreenState createState() => _SyncScreenState();
}
int currentstep = 50;
bool isApiCallProcess = false;
class _SyncScreenState extends State<SyncScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
          valueListenable: onlinemode,
          builder: (context, value, child) {
            return AbsorbPointer(
        absorbing: currentlysyncing,
        child: ProgressHUD(
          opacity: 0.3,
          inAsyncCall: isApiCallProcess,
          child:  Scaffold(
                appBar: AppBar(
                  backgroundColor: pink,
                  iconTheme: IconThemeData(color: orange),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Synchronize", style: TextStyle(color: orange),),
                          EmpInfo()
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          if(onlinemode.value){
                              print("tapped");
                              setState(() {
                                isApiCallProcess = true;
                                currentlysyncing = true;
                              });
                              if (message.length > 0) {
                                await syncingsenddata();
                              }
                              await syncingreferencedata();
                              setState(() {
                                isApiCallProcess = false;
                                currentlysyncing = false;
                              });
                            }else{
                            Flushbar(
                              message:
                              "Make sure you had an active internet",
                              duration: Duration(seconds: 3),
                            )..show(context);
                          }
                          },
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: onlinemode.value ? orange : iconscolor,
                            borderRadius: BorderRadius.circular(10.00),
                          ),
                          child: Text(
                            'Sync Now',
                            style: TextStyle(color: Colors.white
                                , fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                drawer: Drawer(
                  child: Menu(),
                ),
                body: OfflineNotification(
                  body : Stack(
                    children: [
                      BackGround(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.fromLTRB(5.0, 10, 5.0, 10.0),
                              padding: EdgeInsets.fromLTRB(5.0, 10, 5.0, 10.0),
                              child: Text("Activities ready for Synchronize",
                                style: TextStyle(fontSize: 12),)),
                          Expanded(
                            child: message.length > 0 ? ListView.builder(
                              //shrinkWrap: true,
                              //physics: NeverScrollableScrollPhysics(),
                                itemCount: message.length,
                                //reverse: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 40.0, right: 40.0),
                                          child: Divider(
                                              thickness: 0.5, color: pink),
                                        ),
                                        Text(
                                          "${message.reversed.toList()[index]}",
                                          softWrap: true,
                                          style: TextStyle(color: Colors.white),
                                          textAlign: TextAlign.center,),
                                        // Row(
                                        //   children: [
                                        //     Spacer(),
                                        //     Text("${logtime[index]}"),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  );
                                }) : Center(child: Text("No activities to sync")),
                          )
                        ],
                      ),
                    ],
                  ),
                )
            ),
          ),
      );
  });
  }
}
