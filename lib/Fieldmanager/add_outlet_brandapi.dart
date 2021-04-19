import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:merchandising/api/api_service.dart';
class brandmap{
  static var outletid;
  static var brandid;
  static var shelf;
  static var target;
  static var myfile;
}

Future addbrandmap() async{
  Map storedata = {
    'outlet_id' : '${brandmap.outletid}',
    'brand_id' : '${brandmap.brandid}',
    'shelf' : '${brandmap.shelf}',
    'target' : '${brandmap.target}',
    'myfile' : '${brandmap.myfile}'

  };
  /*http.Response ouletbrandmap = await http.post(Addoutletbrandmap,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(storedata),
  );
print(ouletbrandmap.body);*/
  print("Add Stores Done");
}
