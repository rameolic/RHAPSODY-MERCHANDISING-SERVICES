import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:merchandising/api/api_service.dart';

class AddShareData{
  static var outletid;
  static var timesheetid;
  static List<dynamic> categoryid=[];
  static List<dynamic> categoryname=[];
  static List<dynamic> totalshare=[];
  static List<dynamic> share=[];
  static List<dynamic> target = [];
  static List<dynamic> actual = [];
  static List<dynamic> actualpercent = [];
  static List<String> reason = [];

}

Future addShareofshelfdata() async{
  Map addshare = {
    'outlet_id' : AddShareData.outletid,
    'timesheet_id' : AddShareData.timesheetid,
    'category_name' : AddShareData.categoryname,
    'outlet_products_mapping_id': comid,
    'category_id' : AddShareData.categoryid,
    'total_share' : AddShareData.totalshare,
    'share' : AddShareData.share,
    'target' : AddShareData.target,
    'actual' : AddShareData.actualpercent,
    "reason" : AddShareData.reason,
   };
  print(jsonEncode(addshare));
  http.Response shareresponse = await http.post(AddShareofshelf,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(addshare),
  );
  print(shareresponse.body);
}
