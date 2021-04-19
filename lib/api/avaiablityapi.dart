import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';


var timesheetid;
Future<void> Avaiablitity() async {
  Map body = {
    "time_sheet_id" : "$timesheetid"
  };
  http.Response response = await http.post(LDurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(body),
  );
  if (response.statusCode == 200) {
    Avaiablity.productid = [];
    Avaiablity.productname = [];
    Avaiablity.storedetailes = [];
    print('avaiablity done');
    String availabititybody = response.body;
    var decodeddata = jsonDecode(availabititybody);
    for (int u = 0; u< decodeddata['data'].length; u++) {
      Avaiablity.productid.add(decodeddata['data'][u]['product_id']);
      Avaiablity.productname.add(decodeddata['data'][u]['p_name']);
      Avaiablity.storedetailes.add('[${decodeddata['data'][u]['store_code']}] ${decodeddata['data'][u]['store_name']}');
    }
  }
}


class Avaiablity{
  static List<dynamic> productid=[];
  static List<dynamic> productname=[];
  static List<dynamic> storedetailes=[];
}




