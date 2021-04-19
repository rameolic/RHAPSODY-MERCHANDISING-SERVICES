import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';
Future<void> getmappedoutlets() async {

  http.Response BDResponse = await http.post(outletbrandmapping,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
  );
  if (BDResponse.statusCode == 200){
    print("getBrandDetailsDone");
    String brand = BDResponse.body;
    var decodebrands = jsonDecode(brand);
    for(int u=0;u<decodebrands['data'].length;u++) {
        mapping.id.add(decodebrands['data'][u]['id']);
        mapping.outletname.add('[${decodebrands['data'][u]['store_code']}] ${decodebrands['data'][u]['store_name'].toString()}');
        mapping.brandname.add(decodebrands['data'][u]['brand_name']);
        mapping.outletaddress.add(decodebrands['data'][u]['address'].toString());
        mapping.outletnumber.add(decodebrands['data'][u]['contact_number'].toString());
        mapping.planogramimage.add(decodebrands['data'][u]['planogram_img']);
        mapping.shelf.add(decodebrands['data'][u]['shelf']);
        mapping.target.add(decodebrands['data'][u]['target']);
      }
  }
  if(BDResponse.statusCode != 200){
    print(BDResponse.statusCode);
  }
}

class mapping {
  static List<String> outletname = [];
  static List<dynamic> id = [];
  static List<String> outletaddress = [];
  static List<String> outletnumber = [];
  static List<dynamic> shelf = [];
  static List<dynamic> target = [];
  static List<dynamic> planogramimage = [];
  static List<dynamic> brandname = [];
}