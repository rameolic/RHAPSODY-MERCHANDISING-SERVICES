
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';
import 'jprequest.dart';
import 'package:merchandising/pages/Journeyplan.dart';
import 'package:merchandising/model/Location_service.dart';



Future<void> getvisitedJourneyPlan() async {
  http.Response JPresponse = await http.post(JPVisitedurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(DBrequestData),
  );
  if (JPresponse.statusCode == 200){
    print("visitedjourneyplandone");
    String JPdata = JPresponse.body;
    var decodeJPData = jsonDecode(JPdata);
    JPResponsevisiteddata.outletiddata1 = decodeJPData['data'][0]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata1 = decodeJPData['data'][0]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata1 = decodeJPData['data'][0]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata1 = decodeJPData['data'][0]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata1 = decodeJPData['data'][0]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata1 = decodeJPData['data'][0]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata1 = decodeJPData['data'][0]['outlet']['outlet_city'];
    JPResponsevisiteddata.id1 = decodeJPData['data'][0]['id'];
    JPResponsevisiteddata.outletiddata2 = decodeJPData['data'][1]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata2 = decodeJPData['data'][1]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata2 = decodeJPData['data'][1]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata2 = decodeJPData['data'][1]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata2 = decodeJPData['data'][1]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata2 = decodeJPData['data'][1]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata2 = decodeJPData['data'][1]['outlet']['outlet_city'];
    JPResponsevisiteddata.id2 = decodeJPData['data'][1]['id'];
    JPResponsevisiteddata.outletiddata3 = decodeJPData['data'][2]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata3 = decodeJPData['data'][2]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata3 = decodeJPData['data'][2]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata3 = decodeJPData['data'][2]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata3 = decodeJPData['data'][2]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata3 = decodeJPData['data'][2]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata3 = decodeJPData['data'][2]['outlet']['outlet_city'];
    JPResponsevisiteddata.id3 = decodeJPData['data'][2]['id'];
    JPResponsevisiteddata.outletiddata4 = decodeJPData['data'][3]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata4 = decodeJPData['data'][3]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata4 = decodeJPData['data'][3]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata4 = decodeJPData['data'][3]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata4 = decodeJPData['data'][3]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata4 = decodeJPData['data'][3]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata4 = decodeJPData['data'][3]['outlet']['outlet_city'];
    JPResponsevisiteddata.id4 = decodeJPData['data'][3]['id'];
    JPResponsevisiteddata.outletiddata5 = decodeJPData['data'][4]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata5 = decodeJPData['data'][4]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata5 = decodeJPData['data'][4]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata5 = decodeJPData['data'][4]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata5 = decodeJPData['data'][4]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata5 = decodeJPData['data'][4]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata5 = decodeJPData['data'][4]['outlet']['outlet_city'];
    JPResponsevisiteddata.id5 = decodeJPData['data'][4]['id'];
    JPResponsevisiteddata.outletiddata6 = decodeJPData['data'][5]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata6 = decodeJPData['data'][5]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata6 = decodeJPData['data'][5]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata6 = decodeJPData['data'][5]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata6 = decodeJPData['data'][5]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata6 = decodeJPData['data'][5]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata6 = decodeJPData['data'][5]['outlet']['outlet_city'];
    JPResponsevisiteddata.id6 = decodeJPData['data'][5]['id'];
    JPResponsevisiteddata.outletiddata7 = decodeJPData['data'][6]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata7 = decodeJPData['data'][6]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata7 = decodeJPData['data'][6]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata7 = decodeJPData['data'][6]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata7 = decodeJPData['data'][6]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata7 = decodeJPData['data'][6]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata7 = decodeJPData['data'][6]['outlet']['outlet_city'];
    JPResponsevisiteddata.id7 = decodeJPData['data'][6]['id'];
    JPResponsevisiteddata.outletiddata8 = decodeJPData['data'][7]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata8 = decodeJPData['data'][7]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata8 = decodeJPData['data'][7]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata8 = decodeJPData['data'][7]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata8 = decodeJPData['data'][7]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata8 = decodeJPData['data'][7]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata8 = decodeJPData['data'][7]['outlet']['outlet_city'];
    JPResponsevisiteddata.id8 = decodeJPData['data'][7]['id'];
    JPResponsevisiteddata.outletiddata9 = decodeJPData['data'][8]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata9 = decodeJPData['data'][8]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata9 = decodeJPData['data'][8]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata9 = decodeJPData['data'][8]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata9 = decodeJPData['data'][8]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata9 = decodeJPData['data'][8]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata9 = decodeJPData['data'][8]['outlet']['outlet_city'];
    JPResponsevisiteddata.id9 = decodeJPData['data'][8]['id'];
    JPResponsevisiteddata.outletiddata10 = decodeJPData['data'][9]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata10 = decodeJPData['data'][9]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata10 = decodeJPData['data'][9]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata10 = decodeJPData['data'][9]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata10 = decodeJPData['data'][9]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata10 = decodeJPData['data'][9]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata10 = decodeJPData['data'][9]['outlet']['outlet_city'];
    JPResponsevisiteddata.id10 = decodeJPData['data'][9]['id'];
    JPResponsevisiteddata.outletiddata11 = decodeJPData['data'][10]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata11 = decodeJPData['data'][10]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata11 = decodeJPData['data'][10]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata11 = decodeJPData['data'][10]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata11 = decodeJPData['data'][10]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata11 = decodeJPData['data'][10]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata11 = decodeJPData['data'][10]['outlet']['outlet_city'];
    JPResponsevisiteddata.id11 = decodeJPData['data'][10]['id'];
    JPResponsevisiteddata.outletiddata12 = decodeJPData['data'][11]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata12 = decodeJPData['data'][11]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata12 = decodeJPData['data'][11]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata12 = decodeJPData['data'][11]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata12 = decodeJPData['data'][11]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata12 = decodeJPData['data'][11]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata12 = decodeJPData['data'][11]['outlet']['outlet_city'];
    JPResponsevisiteddata.id12 = decodeJPData['data'][11]['id'];
    JPResponsevisiteddata.outletiddata13 = decodeJPData['data'][12]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata13 = decodeJPData['data'][12]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata13 = decodeJPData['data'][12]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata13 = decodeJPData['data'][12]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata13 = decodeJPData['data'][12]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata13 = decodeJPData['data'][12]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata13 = decodeJPData['data'][12]['outlet']['outlet_city'];
    JPResponsevisiteddata.id13 = decodeJPData['data'][12]['id'];
    JPResponsevisiteddata.outletiddata14 = decodeJPData['data'][13]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata14 = decodeJPData['data'][13]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata14= decodeJPData['data'][13]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata14 = decodeJPData['data'][13]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata14 = decodeJPData['data'][13]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata14 = decodeJPData['data'][13]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata14 = decodeJPData['data'][13]['outlet']['outlet_city'];
    JPResponsevisiteddata.id14 = decodeJPData['data'][13]['id'];
    JPResponsevisiteddata.outletiddata15 = decodeJPData['data'][14]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata15 = decodeJPData['data'][14]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata15 = decodeJPData['data'][14]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata15 = decodeJPData['data'][14]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata15 = decodeJPData['data'][14]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata15 = decodeJPData['data'][14]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata15 = decodeJPData['data'][14]['outlet']['outlet_city'];
    JPResponsevisiteddata.id15 = decodeJPData['data'][14]['id'];
    JPResponsevisiteddata.outletiddata16 = decodeJPData['data'][15]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata16 = decodeJPData['data'][15]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata16 = decodeJPData['data'][15]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata16 = decodeJPData['data'][15]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata16 = decodeJPData['data'][15]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata16 = decodeJPData['data'][15]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata16 = decodeJPData['data'][15]['outlet']['outlet_city'];
    JPResponsevisiteddata.id16 = decodeJPData['data'][15]['id'];
    JPResponsevisiteddata.outletiddata17 = decodeJPData['data'][16]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata17 = decodeJPData['data'][16]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata17 = decodeJPData['data'][16]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata17 = decodeJPData['data'][16]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata17 = decodeJPData['data'][16]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata17 = decodeJPData['data'][16]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata17 = decodeJPData['data'][16]['outlet']['outlet_city'];
    JPResponsevisiteddata.id17 = decodeJPData['data'][16]['id'];
    JPResponsevisiteddata.outletiddata18 = decodeJPData['data'][17]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata18 = decodeJPData['data'][17]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata18 = decodeJPData['data'][17]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata18 = decodeJPData['data'][17]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata18 = decodeJPData['data'][17]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata18 = decodeJPData['data'][17]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata18 = decodeJPData['data'][17]['outlet']['outlet_city'];
    JPResponsevisiteddata.id18 = decodeJPData['data'][17]['id'];
    JPResponsevisiteddata.outletiddata19 = decodeJPData['data'][18]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata19 = decodeJPData['data'][18]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata19 = decodeJPData['data'][18]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata19 = decodeJPData['data'][18]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata19 = decodeJPData['data'][18]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata19 = decodeJPData['data'][18]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata19 = decodeJPData['data'][18]['outlet']['outlet_city'];
    JPResponsevisiteddata.id19 = decodeJPData['data'][18]['id'];
    JPResponsevisiteddata.outletiddata20 = decodeJPData['data'][19]['outlet']['outlet_id'];
    JPResponsevisiteddata.outletnamedata20 = decodeJPData['data'][19]['outlet']['outlet_name'];
    JPResponsevisiteddata.latitudedata20 = decodeJPData['data'][19]['outlet']['outlet_lat'];
    JPResponsevisiteddata.longitudedata20 = decodeJPData['data'][19]['outlet']['outlet_long'];
    JPResponsevisiteddata.outletareadata20 = decodeJPData['data'][19]['outlet']['outlet_area'];
    JPResponsevisiteddata.outletcountrydata20 = decodeJPData['data'][19]['outlet']['outlet_country'];
    JPResponsevisiteddata.outletcitydata20 = decodeJPData['data'][19]['outlet']['outlet_city'];
    JPResponsevisiteddata.id20 = decodeJPData['data'][19]['id'];
  }
  if(JPresponse.statusCode != 200){
    print(JPresponse.statusCode);
  }
}


