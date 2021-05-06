import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';
class AddCompData{

  static var timesheetid;
  static var companyname;
  static var itemname;
  static var brandname;
  static var promotype;
  static var promodesc;
  static var mrp ;
  static var sellingprice;
  static var captureimg ;

}

Future addCompetition() async{
  Map addcompetition = {

    'timesheet_id' : currenttimesheetid,
    'company_name': '${AddCompData.companyname}',
    'item_name' : '${AddCompData.itemname}',
    'brand_name' : '${AddCompData.brandname}',
    'promotion_type' : '${AddCompData.promotype}',
    'promotion_description' : '${AddCompData.promodesc}',
    'mrp' : '${AddCompData.mrp}',
    'selling_price' : '${AddCompData.sellingprice}',
    'capture_image' : '${AddCompData.captureimg}',

  };
  print(addcompetition);
  http.Response response = await http.post(AddCompetition,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(addcompetition),
  );
  print(response.body);

}
