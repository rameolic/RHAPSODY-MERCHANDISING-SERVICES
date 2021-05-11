import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';


Future<void> Avaiablitity() async {
  Map body = {
    "time_sheet_id" : "$currenttimesheetid"
  };
  http.Response response = await http.post(AvailabilityDetails,
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
    Avaiablity.brand = [];
    Avaiablity.category = [];
    Avaiablity.checkvalue = [];
    Avaiablity.reason = [];
    print('avaiablity done');
    String availabititybody = response.body;
    var decodeddata = jsonDecode(availabititybody);
    for (int u = 0; u< decodeddata['data'].length; u++) {
      Avaiablity.productid.add(decodeddata['data'][u]['product_id']);
      Avaiablity.brand.add(decodeddata['data'][u]['b_name']);
      Avaiablity.category.add(decodeddata['data'][u]['c_name']);
      Avaiablity.productname.add(decodeddata['data'][u]['p_name']);
      print(decodeddata['data'][u]['is_available']);
      if(decodeddata['data'][u]['is_available'] != null){
        Avaiablity.checkvalue.add(int.parse(decodeddata['data'][u]['is_available']));
      }else{
        Avaiablity.checkvalue.add(0);
      }
      Avaiablity.storedetailes.add('[${decodeddata['data'][u]['store_code']}] ${decodeddata['data'][u]['store_name']}');
      if(decodeddata['data'][u]['reason'] == null){
        Avaiablity.reason.add('');
      }else{
        Avaiablity.reason.add(decodeddata['data'][u]['reason']);
      }
    }
    Distintbrands = Avaiablity.brand.toSet().toList();
    Distintcategory = Avaiablity.category.toSet().toList();
    print("avaiability : ${Avaiablity.productname}");
  }
}

List Distintcategory;
List Distintbrands;
class Avaiablity{
  static List<dynamic> productid=[];
  static List<String> productname=[];
  static List<String> storedetailes=[];
  static List<String> brand=[];
  static List<String> category=[];
  static List<int> checkvalue=[];
  static List<String> reason=[];

}




