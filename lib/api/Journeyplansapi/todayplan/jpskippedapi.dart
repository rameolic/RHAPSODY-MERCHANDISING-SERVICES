
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../api_service.dart';

Future<void> getskippedJourneyPlan() async {
  Map DBrequestData = {
    'emp_id': '${DBrequestdata.receivedempid}'
  };
  http.Response JPresponse = await http.post(JPSkippedurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(DBrequestData),
  );
  if (JPresponse.statusCode == 200){
    print("skippedjourneyplandone");
    String JPdata = JPresponse.body;
    var decodeJPData = jsonDecode(JPdata);
    todayskipjplist.storenames=[];
    todayskipjplist.distanceinmeters=[];
    todayskipjplist.contactnumbers=[];
    todayskipjplist.outletcountry=[];
    todayskipjplist.outletcity=[];
    todayskipjplist.outletarea=[];
    todayskipjplist.storecodes=[];
    todayskipjplist.id=[];
    todayskipjplist.outletlong=[];
    todayskipjplist.outletlat=[];
    todayskipjplist.outletids=[];
    for(int u=0;u<decodeJPData['data'].length;u++){
      dynamic storename = decodeJPData['data'][u]['store_name'];
      todayskipjplist.storenames.add(storename);
      dynamic storecode = decodeJPData['data'][u]['store_code'];
      todayskipjplist.storecodes.add(storecode);
      dynamic outletid = decodeJPData['data'][u]['outlet_id'];
      print(outletid);
      todayskipjplist.outletids.add(outletid);
      dynamic outletlat = decodeJPData['data'][u]['outlet_lat'];
      todayskipjplist.outletlat.add(outletlat);
      dynamic outletlong = decodeJPData['data'][u]['outlet_long'];
      todayskipjplist.outletlong.add(outletlong);
      dynamic outletarea = decodeJPData['data'][u]['outlet_area'];
      todayskipjplist.outletarea.add(outletarea);
      dynamic outletcity = decodeJPData['data'][u]['outlet_city'];
      todayskipjplist.outletcity.add(outletcity);
      dynamic outletcountry = decodeJPData['data'][u]['outlet_country'];
      todayskipjplist.outletcountry.add(outletcountry);
      dynamic tableid = decodeJPData['data'][u]['id'];
      todayskipjplist.id.add(tableid);
      dynamic outletcontact = decodeJPData['data'][u]['contact_number'];
      todayskipjplist.contactnumbers.add(outletcontact);
    }
  }
  else{
    print(JPresponse.statusCode);
  }
}


class todayskipjplist{
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