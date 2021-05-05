import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';

Future<void> getcompinfo() async {
  http.Response response = await http.post(getcompdetails,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
  );
  if (response.statusCode == 200) {
    competitiondata.company = [];
    competitiondata.brand = [];
    competitiondata.promotion = [];
    String body = response.body;
    var decodeddata = jsonDecode(body);
    for (int u = 0; u< decodeddata['data'].length; u++) {
      competitiondata.company.add(decodeddata['data'][u]['company_name']);
      competitiondata.brand.add(decodeddata['data'][u]['brand_name']);
      competitiondata.promotion.add(decodeddata['data'][u]['promotion_type']);
      competitiondata.descrptn.add(decodeddata['data'][u]['promotion_description']);
    }
    print(competitiondata.company);
  }

}


class competitiondata{
  static List<String> company=[];
  static List<String> brand=[];
  static List<String> promotion=[];
  static List<String> descrptn=[];
}