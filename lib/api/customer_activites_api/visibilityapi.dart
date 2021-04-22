import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/api/FMapi/brand_detailsapi.dart';

Future<void> getVisibility() async {
  Map body = {
    "time_sheet_id" : "331"//"${timesheetid.id}"
  };
  http.Response VisibilityResponse = await http.post(VisibilityDetails,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(body),
  );
  if (VisibilityResponse.statusCode == 200) {
    print(body);
    VisibilityData.outletid = [];
    VisibilityData.timesheetid = [];
    VisibilityData.productid = [];
    VisibilityData.brandid = [];
    VisibilityData.productname = [];
    VisibilityData.brandname = [];
    VisibilityData.categoryname = [];
    VisibilityData.isavailable = [];
    VisibilityData.reason = [];
    VisibilityData.imageurl = [];

    print('Visibility done');

    String availabititybody = VisibilityResponse.body;
    var decodeddata = jsonDecode(availabititybody);
    for (int u = 0; u< decodeddata['data'].length; u++) {
      VisibilityData.productname.add(decodeddata['data'][u]['p_name']);
      VisibilityData.imageurl.add('https://rms2.rhapsody.ae/product_image/${decodeddata['data'][u]['Image_url']}');
      VisibilityData.brandname.add(decodeddata['data'][u]['b_name']);
      VisibilityData.categoryname.add(decodeddata['data'][u]['c_name']);
      VisibilityData.productid.add(decodeddata['data'][u]['product_id']);
      VisibilityData.mappingid = decodeddata['data'][u]['outlet_products_mapping_id'];
    }
    await getBrandDetails();
    VisibilityData.brandid=[];
    for(int u = 0; u<VisibilityData.brandname.length; u++){
      VisibilityData.brandid.add(BrandData.brandid[BrandData.brandname.indexOf(VisibilityData.brandname[u])]);
    }
  }

}


class VisibilityData{
  static var mappingid;
  static List<dynamic> outletid=[];
  static List<dynamic> timesheetid=[];
  static List<dynamic> productid=[];
  static List<dynamic> brandid=[];
  static List<String> productname=[];
  static List<String> brandname = [];
  static List<String> categoryname = [];
  static List<dynamic> isavailable=[];
  static List<dynamic> reason=[];
  static List<String> imageurl = [];
}





