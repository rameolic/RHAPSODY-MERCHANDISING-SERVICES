import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';
import 'jprequest.dart';
import 'package:merchandising/pages/Journeyplan.dart';

Future<void> getJourneyPlan() async {
  http.Response JPresponse = await http.post(JPurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(DBrequestData),
  );
  if (JPresponse.statusCode == 200){
    print('journey plan done');
    String JPdata = JPresponse.body;
    var decodeJPData = jsonDecode(JPdata);
    for(int u=0;u<20;u++){
      dynamic storename = decodeJPData['data'][u]['store_name'];
      print(storename);
      todayjplists.storenames.add(storename);
      dynamic storecode = decodeJPData['data'][u]['store_code'];
      todayjplists.storecodes.add(storecode);
      dynamic outletid = decodeJPData['data'][u]['outlet']['outlet_id'];
      todayjplists.outletids.add(outletid);
      dynamic outletlat = decodeJPData['data'][u]['outlet']['outlet_lat'];
      todayjplists.outletlat.add(outletlat);
      dynamic outletlong = decodeJPData['data'][u]['outlet']['outlet_long'];
      todayjplists.outletlong.add(outletlong);
      dynamic outletarea = decodeJPData['data'][u]['outlet']['outlet_area'];
      todayjplists.outletarea.add(outletarea);
      dynamic outletcity = decodeJPData['data'][u]['outlet']['outlet_city'];
      todayjplists.outletcity.add(outletcity);
      dynamic outletcountry = decodeJPData['data'][u]['outlet']['outlet_country'];
      todayjplists.outletcountry.add(outletcountry);
      dynamic tableid = decodeJPData['data'][u]['id'];
      todayjplists.id.add(tableid);
      dynamic outletcontact = decodeJPData['data'][u]['contact_number'];
      todayjplists.contactnumbers.add(outletcontact);
    }
  }
  else{
    print(JPresponse.statusCode);
  }
}


class todayjplists{
  static List<dynamic> storecodes=[];
  static List<dynamic> storenames=[];
  static List<dynamic> outletids=[];
  static List<dynamic> outletlat=[];
  static List<dynamic> outletlong=[];
  static List<dynamic> outletarea=[];
  static List<dynamic> outletcity=[];
  static List<dynamic> outletcountry=[];
  static List<dynamic> id=[];
  static List<dynamic> contactnumbers=[];
  static List<dynamic> distanceinmeters=[];
}