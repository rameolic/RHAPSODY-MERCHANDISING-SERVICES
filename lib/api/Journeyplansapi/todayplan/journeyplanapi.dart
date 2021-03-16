import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../api_service.dart';
import'package:merchandising/model/distanceinmeters.dart';

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
    gettodayjp.storenames=[];
    gettodayjp.distanceinmeters=[];
    gettodayjp.contactnumbers=[];
    gettodayjp.outletcountry=[];
    gettodayjp.outletcity=[];
    gettodayjp.outletarea=[];
    gettodayjp.storecodes=[];
    gettodayjp.id=[];
    gettodayjp.outletlong=[];
    gettodayjp.outletlat=[];
    gettodayjp.outletids=[];
    for(int u=0;u<decodeJPData['data'].length;u++){
      dynamic storename = decodeJPData['data'][u]['store_name'];
      gettodayjp.storenames.add(storename);
      dynamic storecode = decodeJPData['data'][u]['store_code'];
      gettodayjp.storecodes.add(storecode);
      int isschdlue = decodeJPData['data'][u]['scheduled_calls'];
      gettodayjp.isscheduled.add(isschdlue);
      dynamic outletid = decodeJPData['data'][u]['outlet']['outlet_id'];
      gettodayjp.outletids.add(outletid);
      dynamic outletlat = decodeJPData['data'][u]['outlet']['outlet_lat'];
      gettodayjp.outletlat.add(outletlat);
      dynamic outletlong = decodeJPData['data'][u]['outlet']['outlet_long'];
      gettodayjp.outletlong.add(outletlong);
      dynamic outletarea = decodeJPData['data'][u]['outlet']['outlet_area'];
      gettodayjp.outletarea.add(outletarea);
      dynamic outletcity = decodeJPData['data'][u]['outlet']['outlet_city'];
      gettodayjp.outletcity.add(outletcity);
      dynamic outletcountry = decodeJPData['data'][u]['outlet']['outlet_country'];
      gettodayjp.outletcountry.add(outletcountry);
      dynamic tableid = decodeJPData['data'][u]['id'];
      gettodayjp.id.add(tableid);
      dynamic outletcontact = decodeJPData['data'][u]['contact_number'];
      gettodayjp.contactnumbers.add(outletcontact);
    }
    distinmeters();
  }
  else{
    print(JPresponse.statusCode);
  }
}

class gettodayjp{
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
  static List<int> isscheduled=[];
}