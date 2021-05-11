import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api_service.dart';

class AddPlanoData{
  static var outletid;
  static var timesheetid;
  static List<dynamic> outletpdtmapid=[];
  static List<dynamic> brandid=[];
  static List<dynamic> brandname=[];
  static List<dynamic> planoimage=[];
  static List<dynamic> beforeimage = [];
  static List<dynamic> afterimage = [];
  static List<dynamic> categoryname = [];

}

Future addPlanogramdata() async{
  Map addplano = {
    "outlet_id" : AddPlanoData.outletid,
    "timesheet_id" : AddPlanoData.timesheetid,
    "outlet_products_mapping_id" : AddPlanoData.outletpdtmapid,
    "brand_id" : AddPlanoData.brandid,
    "brand_name" : AddPlanoData.brandname,
    "category_name": AddPlanoData.categoryname,
    "plano_image" : AddPlanoData.planoimage,
    "before_image" : AddPlanoData.beforeimage,
    "after_image" : AddPlanoData.afterimage,
  };
  http.Response planoresponse = await http.post(AddPlanogram,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(addplano),
  );

  print(jsonEncode(addplano));
  print(planoresponse.body);

  // print("Add Planogram Done");

}
