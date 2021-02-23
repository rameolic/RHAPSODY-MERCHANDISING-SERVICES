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
    for(int u=0;u>0;u++){
      dynamic storename = decodeJPData['data'][u]['store_name'];
      globallist.storenames.add(storename);
      dynamic storecode = decodeJPData['data'][u]['store_code'];
      globallist.storecodes.add(storecode);
      dynamic outletid = decodeJPData['data'][u]['outlet']['outlet_id'];
      globallist.outletids.add(outletid);
      dynamic outletlat = decodeJPData['data'][u]['outlet']['outlet_lat'];
      globallist.outletlat.add(outletlat);
      dynamic outletlong = decodeJPData['data'][u]['outlet']['outlet_long'];
      globallist.outletlong.add(outletlong);
      dynamic outletarea = decodeJPData['data'][u]['outlet']['outlet_area'];
      globallist.outletarea.add(outletarea);
      dynamic outletcity = decodeJPData['data'][u]['outlet']['outlet_city'];
      globallist.outletcity.add(outletcity);
      dynamic outletcountry = decodeJPData['data'][u]['outlet']['outlet_country'];
      globallist.outletcountry.add(outletcountry);
      dynamic tableid = decodeJPData['data'][u]['id'];
      globallist.id.add(tableid);
      dynamic outletcontact = decodeJPData['data'][u]['contact_number'];
      globallist.contactnumbers.add(outletcontact);
    }
  }
  else{
    print(JPresponse.statusCode);
  }
}


class globallist{
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