import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';
class AddVisiData{
  static var outletid;
  static var timesheetid;
  static List<dynamic> productid = [];
  static List<dynamic> brandid=[];
  static List<dynamic> brandname=[];
  static List<dynamic> categoryname=[];
  static List<dynamic> productname=[];
  static List<dynamic> checkvalue = [];
  static List<dynamic> reason = [];
  static var outletpdtmap;
}

Future addVisibilitydata() async{
  Map addvisibility = {
    'outlet_id' : AddVisiData.outletid,
    'timesheet_id' : AddVisiData.timesheetid,
    'outlet_products_mapping_id' : AddVisiData.outletpdtmap,
    'product_id' : AddVisiData.productid,
    'brand_id' : AddVisiData.brandid,
    'brand_name' : AddVisiData.brandname,
    'category_name' : AddVisiData.categoryname,
    'product_name' : AddVisiData.productname,
    'check_value' : AddVisiData.checkvalue,
    'reason' : AddVisiData.reason,
  };
  // http.Response availresponse = await http.post(AddVisibility,
  //   headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
  //   },
  //   body: jsonEncode(addvisibility),
  // );
  print(addvisibility);

}
