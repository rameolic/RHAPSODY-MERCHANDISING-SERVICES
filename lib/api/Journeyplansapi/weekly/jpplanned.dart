import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../api_service.dart';
import'package:merchandising/model/distanceinmeters.dart';

Future<void> getJourneyPlanweekly() async {
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
    getweeklyjp.storenames=[];
    getweeklyjp.distanceinmeters=[];
    getweeklyjp.contactnumbers=[];
    getweeklyjp.outletcountry=[];
    getweeklyjp.outletcity=[];
    getweeklyjp.outletarea=[];
    getweeklyjp.storecodes=[];
    getweeklyjp.id=[];
    getweeklyjp.outletlong=[];
    getweeklyjp.outletlat=[];
    getweeklyjp.outletids=[];
    for(int u=0;u<20;u++){
      dynamic storename = decodeJPData['data'][u]['store_name'];
      getweeklyjp.storenames.add(storename);
      dynamic storecode = decodeJPData['data'][u]['store_code'];
      getweeklyjp.storecodes.add(storecode);
      dynamic outletid = decodeJPData['data'][u]['outlet']['outlet_id'];
      getweeklyjp.outletids.add(outletid);
      dynamic outletlat = decodeJPData['data'][u]['outlet']['outlet_lat'];
      getweeklyjp.outletlat.add(outletlat);
      dynamic outletlong = decodeJPData['data'][u]['outlet']['outlet_long'];
      getweeklyjp.outletlong.add(outletlong);
      dynamic outletarea = decodeJPData['data'][u]['outlet']['outlet_area'];
      getweeklyjp.outletarea.add(outletarea);
      dynamic outletcity = decodeJPData['data'][u]['outlet']['outlet_city'];
      getweeklyjp.outletcity.add(outletcity);
      dynamic outletcountry = decodeJPData['data'][u]['outlet']['outlet_country'];
      getweeklyjp.outletcountry.add(outletcountry);
      dynamic tableid = decodeJPData['data'][u]['id'];
      getweeklyjp.id.add(tableid);
      dynamic outletcontact = decodeJPData['data'][u]['contact_number'];
      getweeklyjp.contactnumbers.add(outletcontact);
    }
    distinmeters();
  }
  else{
    print(JPresponse.statusCode);
  }
}

class getweeklyjp{
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