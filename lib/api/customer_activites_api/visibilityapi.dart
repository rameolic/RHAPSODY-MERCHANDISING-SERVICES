import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/api/FMapi/brand_detailsapi.dart';

Future<void> getVisibility() async {
  Map body = {
    "time_sheet_id" : "$currenttimesheetid"
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
    VisibilityData.productid = [];
    VisibilityData.brandid = [];
    VisibilityData.productname = [];
    VisibilityData.categoryid = [];
    VisibilityData.categoryname = [];
    VisibilityData.isavailable = [];
    VisibilityData.reason = [];
    VisibilityData.imageurl = [];
    VisibilityData.mappingid ;

    print('Visibility done');

    String availabititybody = VisibilityResponse.body;
    var decodeddata = jsonDecode(availabititybody);
    for (int u = 0; u< decodeddata['data'].length; u++) {
      VisibilityData.productname.add(decodeddata['data'][u]['p_name']);
      VisibilityData.imageurl.add('https://rms2.rhapsody.ae/product_image/${decodeddata['data'][u]['Image_url']}');
      VisibilityData.categoryid.add(decodeddata['data'][u]['c_id']);
      VisibilityData.categoryname.add(decodeddata['data'][u]['category_name']);
      VisibilityData.productid.add(decodeddata['data'][u]['product_id']);
      VisibilityData.mappingid=decodeddata['data'][u]['opm'];
    }
    await getBrandDetails();
    // VisibilityData.brandid=[];
    // for(int u = 0; u<VisibilityData.categoryid.length; u++){
    //   //VisibilityData.brandid.add(BrandData.brandid[BrandData.brandname.indexOf(VisibilityData.categoryid[u])]);
    // }
  }

}


class VisibilityData{
  static var mappingid;
  static List<int> productid=[];
  static List<int> brandid=[];
  static List<String> productname=[];
  static List<int> categoryid = [];
  static List<String> categoryname = [];
  static List<int> isavailable=[];
  static List<String> reason=[];
  static List<String> imageurl = [];
}





