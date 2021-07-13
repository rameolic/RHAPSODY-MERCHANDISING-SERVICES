import 'dart:convert';
import 'package:http/http.dart' as http;
import '/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/offlinedata/sharedprefsdta.dart';

var JPvisiteddata;
Future<void> getvisitedJourneyPlan() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  JPvisiteddata = prefs.getString('todayvisited');
  if(JPvisiteddata == null|| currentlysyncing) {
    Map DBrequestData = {'emp_id': '${DBrequestdata.receivedempid}'};
    http.Response jPresponse = await http.post(
      JPVisitedurl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
      },
      body: jsonEncode(DBrequestData),
    );
    if (jPresponse.statusCode == 200) {
      print("visitedjourneyplandone");
      JPvisiteddata = jPresponse.body;
      addtodayvisited(JPvisiteddata);
      var decodeJPData = jsonDecode(JPvisiteddata);
      todayvisjplist.storenames = [];
      todayvisjplist.contactnumbers = [];
      todayvisjplist.outletcountry = [];
      todayvisjplist.outletcity = [];
      todayvisjplist.outletarea = [];
      todayvisjplist.storecodes = [];
      todayvisjplist.id = [];
      todayvisjplist.outletids = [];
      for (int u = 0; u < decodeJPData['data'].length; u++) {
        todayvisjplist.storenames.add(decodeJPData['data'][u]['store_name']);
        todayvisjplist.storecodes.add(decodeJPData['data'][u]['store_code']);
        todayvisjplist.outletids.add(decodeJPData['data'][u]['outlet_id']);
        todayvisjplist.outletarea.add(decodeJPData['data'][u]['outlet_area']);
        todayvisjplist.outletcity.add(decodeJPData['data'][u]['outlet_city']);
        todayvisjplist.outletcountry.add(decodeJPData['data'][u]['outlet_country']);
        todayvisjplist.id.add(decodeJPData['data'][u]['id']);
        todayvisjplist.contactnumbers.add(decodeJPData['data'][u]['contact_number']);
      }
    } else {
      print(jPresponse.statusCode);
    }
  }else{
    var decodeJPData = jsonDecode(JPvisiteddata);
    todayvisjplist.storenames = [];
    todayvisjplist.contactnumbers = [];
    todayvisjplist.outletcountry = [];
    todayvisjplist.outletcity = [];
    todayvisjplist.outletarea = [];
    todayvisjplist.storecodes = [];
    todayvisjplist.id = [];
    todayvisjplist.outletids = [];
    for (int u = 0; u < decodeJPData['data'].length; u++) {
      todayvisjplist.storenames.add(decodeJPData['data'][u]['store_name']);
      todayvisjplist.storecodes.add(decodeJPData['data'][u]['store_code']);
      todayvisjplist.outletids.add(decodeJPData['data'][u]['outlet_id']);
      todayvisjplist.outletarea.add(decodeJPData['data'][u]['outlet_area']);
      todayvisjplist.outletcity.add(decodeJPData['data'][u]['outlet_city']);
      todayvisjplist.outletcountry.add(decodeJPData['data'][u]['outlet_country']);
      todayvisjplist.id.add(decodeJPData['data'][u]['id']);
      todayvisjplist.contactnumbers.add(decodeJPData['data'][u]['contact_number']);
    }
  }
}

class todayvisjplist {
  static List<dynamic> storecodes = [];
  static List<dynamic> storenames = [];
  static List<dynamic> outletids = [];
  static List<dynamic> outletarea = [];
  static List<dynamic> outletcity = [];
  static List<dynamic> outletcountry = [];
  static List<dynamic> id = [];
  static List<dynamic> contactnumbers = [];
}