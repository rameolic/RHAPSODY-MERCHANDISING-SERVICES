import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';
class AddAvail{
  static var outletid;
  static var timesheetid;
  static List<dynamic> productid = [];
  static List<dynamic> brandname=[];
  static List<dynamic> categoryname=[];
  static List<dynamic> productname=[];
  static List<dynamic> checkvalue = [];
  static List<dynamic> reason = [];
}

Future addAvailability() async{
  Map addavailability = {
    "outlet_id" : currentoutletid,
    "timesheet_id" : currenttimesheetid,
    "product_id" : AddAvail.productid,
    "brand_name" : AddAvail.brandname,//jsonEncode(AddAvail.brandname),
    "category_name" : AddAvail.categoryname,//jsonEncode(AddAvail.categoryname),
    "product_name" : AddAvail.productname,//jsonEncode(AddAvail.productname),
    "check_value" : AddAvail.checkvalue,
    "reason" : AddAvail.reason
  };
  print(jsonEncode(addavailability));
  http.Response availresponse = await http.post(AddAvailability,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(addavailability),
  );
  print(availresponse.body);

  print("Add Availability Done");
}
