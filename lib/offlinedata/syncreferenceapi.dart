import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/offlinedata/syncdata.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:merchandising/offlinedata/sharedprefsdta.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/merchandiserdashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_launcher_icons/constants.dart';
import 'dart:convert';
import 'package:merchandising/Constants.dart';
import 'package:intl/intl.dart';
import 'package:merchandising/api/Journeyplansapi/todayplan/journeyplanapi.dart';
import 'package:merchandising/api/Journeyplansapi/todayplan/jpskippedapi.dart';
import 'package:merchandising/api/Journeyplansapi/todayplan/JPvisitedapi.dart';
import 'package:merchandising/api/Journeyplansapi/weekly/jpplanned.dart';
import 'package:merchandising/api/Journeyplansapi/weekly/jpskipped.dart';
import 'package:merchandising/api/Journeyplansapi/weekly/jpvisited.dart';
import 'package:merchandising/api/empdetailsapi.dart';
import 'package:merchandising/model/database.dart';
import 'package:merchandising/api/HRapi/empdetailsforreportapi.dart';
import 'package:merchandising/api/HRapi/empdetailsapi.dart';
DateTime lastsyncedon;
DateTime lastsyncedendtime;
Duration difference;
List<Uri>urlstosync=[];
List<Map>bodytosync=[];
List<String>sucessmsgaftersync=[];

syncingreferencedata()async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  lastsyncedon = DateTime.parse(prefs.getString('lastsyncedondate'));
  if(lastsyncedon!=null){
    lastsyncedendtime = DateTime.parse(prefs.getString('lastsyncedonendtime'));
     difference = DateTime.now().difference(lastsyncedendtime);
     print("difference: ${difference.inMinutes}");
     print("${DateFormat('yyyy-MM-dd').format(lastsyncedon)} = ${DateFormat('yyyy-MM-dd').format(DateTime.now())}");
  }
    if (currentlysyncing && onlinemode.value) {
      currentlysyncing = true;
      currentstep = 0;
      print("Syncing");
      var date = DateTime.now();
      var starttime = DateTime.now();
      loginfromloginpage = false;
      await loginapi();
      progress.value = 55;
      await getJourneyPlan();
      progress.value = 60;
      getallempdetails();
      getempdetails();
      progress.value = 65;
      getaddedexpiryproducts();
      getstockexpiryproducts();
      getempdetailsforreport();
      DBRequestmonthly();
      getskippedJourneyPlan();
      getvisitedJourneyPlan();
      getJourneyPlanweekly();
      getSkipJourneyPlanweekly();
      getVisitJourneyPlanweekly();
      Expectedchartvisits();
      chartvisits();
      await getalljpoutletsdata();
      progress.value = 90;
      await DBRequestdaily();
      progress.value = 95;
      currentlysyncing = false;
      var endtime = DateTime.now();
      await lastsynced(date, starttime, endtime);
      progress.value = 98;
    }else{
      DBRequestmonthly();
      getaddedexpiryproducts();
      getempdetails();
      getempdetailsforreport();
      getstockexpiryproducts();
      await DBRequestdaily();
      await callfrequently();
      getempdetails();
      getallempdetails();
      getaddedexpiryproducts();
      getstockexpiryproducts();
      getempdetailsforreport();
      getJourneyPlan();
      getskippedJourneyPlan();
      getvisitedJourneyPlan();
      getSkipJourneyPlanweekly();
      getVisitJourneyPlanweekly();
      getJourneyPlanweekly();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      offlineoutletdeatiles = prefs.getStringList('alljpoutlets');
      outletvisitsdata = prefs.getStringList('alljpoutletschart');
      outletEvisitsdata = prefs.getStringList('alljpoutletsEchart');
      const time = const Duration(seconds: 120);
      Timer.periodic(time, (Timer t) => callfrequently());
    }
}


getalljpoutletsdata()async{
  offlineoutletdeatiles=[];
  print("length:${gettodayjp.outletids.length}");
  for(int i=0;i<gettodayjp.outletids.length;i++){
    progress.value++;
    int outletid = gettodayjp.outletids[i];
    Map ODrequestDataforcheckin = {
      "emp_id": "${DBrequestdata.receivedempid}",
      'outlet_id': '$outletid',
    };
    print(ODrequestDataforcheckin);
    http.Response OCresponse = await http.post(OCurl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
      },
      body: jsonEncode(ODrequestDataforcheckin),
    );
    if(OCresponse.statusCode == 200){
      offlineoutletdeatiles.add(OCresponse.body);
    }
  }
  Addjpoutletsdetailesdata(offlineoutletdeatiles);
}
chartvisits()async{
  outletvisitsdata=[];
  for(int i=0;i<gettodayjp.outletids.length;i++){
    int outletid = gettodayjp.outletids[i];
    Map ODrequestDataforcheckin = {
      'outlet_id': outletid,
    };
    print(ODrequestDataforcheckin);
    http.Response OCResponse = await http.post(ChartUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
      },
      body: jsonEncode(ODrequestDataforcheckin),
    );
    if(OCResponse.statusCode == 200){
      outletvisitsdata.add(OCResponse.body);
    }
  }
  Addjpoutletschartdetailesdata(outletvisitsdata);
}

Expectedchartvisits()async{
  outletEvisitsdata=[];
  for(int i=0;i<gettodayjp.outletids.length;i++){
    int outletid = gettodayjp.outletids[i];
    Map ODrequestDataforcheckin = {
      'outlet_id': outletid,
    };
    print(ODrequestDataforcheckin);
    http.Response OCResponse = await http.post(expectedvisitchart,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
      },
      body: jsonEncode(ODrequestDataforcheckin),
    );
    if(OCResponse.statusCode == 200){
      outletEvisitsdata.add(OCResponse.body);
    }
  }
  AddjpoutletsEchartdetailesdata(outletEvisitsdata);
}

