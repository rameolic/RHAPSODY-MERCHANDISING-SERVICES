import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';

Future<void> getvisitedJourneyPlan() async {
  http.Response jPresponse = await http.post(JPVisitedurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(DBrequestData),
  );
  if (jPresponse.statusCode == 200){
    print("visitedjourneyplandone");
    String JPdata = jPresponse.body;
    var decodeJPData = jsonDecode(JPdata);
    todayvisjplist.storenames=[];
    todayvisjplist.distanceinmeters=[];
    todayvisjplist.contactnumbers=[];
    todayvisjplist.outletcountry=[];
    todayvisjplist.outletcity=[];
    todayvisjplist.outletarea=[];
    todayvisjplist.storecodes=[];
    todayvisjplist.id=[];
    todayvisjplist.outletlong=[];
    todayvisjplist.outletlat=[];
    todayvisjplist.outletids=[];
    for(int u=0;u<20;u++){
      dynamic storename = decodeJPData['data'][u]['store_name'];
      todayvisjplist.storenames.add(storename);
      dynamic storecode = decodeJPData['data'][u]['store_code'];
      todayvisjplist.storecodes.add(storecode);
      dynamic outletid = decodeJPData['data'][u]['outlet_id'];
      todayvisjplist.outletids.add(outletid);
      dynamic outletlat = decodeJPData['data'][u]['outlet_lat'];
      todayvisjplist.outletlat.add(outletlat);
      dynamic outletlong = decodeJPData['data'][u]['outlet_long'];
      todayvisjplist.outletlong.add(outletlong);
      dynamic outletarea = decodeJPData['data'][u]['outlet_area'];
      todayvisjplist.outletarea.add(outletarea);
      dynamic outletcity = decodeJPData['data'][u]['outlet_city'];
      todayvisjplist.outletcity.add(outletcity);
      dynamic outletcountry = decodeJPData['data'][u]['outlet_country'];
      todayvisjplist.outletcountry.add(outletcountry);
      dynamic tableid = decodeJPData['data'][u]['id'];
      todayvisjplist.id.add(tableid);
      dynamic outletcontact = decodeJPData['data'][u]['contact_number'];
      todayvisjplist.contactnumbers.add(outletcontact);
    }
  }
  else{
    print(jPresponse.statusCode);
  }
}

class todayvisjplist {
  static List<dynamic> storecodes = [];
  static List<dynamic> storenames = [];
  static List<dynamic> outletids = [];
  static List<dynamic> outletlat = [];
  static List<dynamic> outletlong = [];
  static List<dynamic> outletarea = [];
  static List<dynamic> outletcity = [];
  static List<dynamic> outletcountry = [];
  static List<dynamic> id = [];
  static List<dynamic> contactnumbers = [];
  static List<dynamic> distanceinmeters = [];
}