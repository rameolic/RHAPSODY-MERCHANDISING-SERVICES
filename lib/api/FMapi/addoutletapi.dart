import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';
class outletdetails{
  static var outletname;
  static var outletlat;
  static var outletlong;
  static var outletarea;
  static var outletcity;
  static var outletstate;
  static var outletcountry;
}

Future addoutletdetails() async{
  Map outletdetdata = {
    "outlet_name": "${outletdetails.outletname}",
  "outlet_lat": "${outletdetails.outletlat}",
  "outlet_long": "${outletdetails.outletlong}",
  "outlet_area": "${outletdetails.outletarea}",
  "outlet_city": "${outletdetails.outletcity}",
  "outlet_state": "${outletdetails.outletstate}",
  "outlet_country":"${outletdetails.outletcountry}",
  };
  print(outletdetdata);


  http.Response outlets = await http.post(AddOutletsurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(outletdetdata),
  );
  print(outlets.body);
}
