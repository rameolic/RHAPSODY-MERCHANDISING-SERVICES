import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';

Future<void> getPlanogram() async {
  Map body = {
    "time_sheet_id" : "$currenttimesheetid"
  };
  http.Response PlanoResponse = await http.post(PlanogramDetails,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(body),
  );
  if (PlanoResponse.statusCode == 200) {
    print(body);
    PlanoDetails.imageurl = [];
    PlanoDetails.beforeimage = [];
    PlanoDetails.afterimage = [];
    PlanoDetails.brandname = [];
    PlanoDetails.categoryname = [];
    PlanoDetails.categoryid = [];

    print('Planogram Details done');
    String planobody = PlanoResponse.body;
    var decodeddata = jsonDecode(planobody);
    for (int u = 0; u< decodeddata['data'].length; u++) {
      PlanoDetails.image.add('${decodeddata['data'][u]['planogram_img']}');
      //PlanoDetails.imageurl.add('https://rms2.rhapsody.ae/plano_image/${decodeddata['data'][u]['planogram_img']}');
      PlanoDetails.imageurl.add("https://rms2.rhapsody.ae/planogram_image/1619431232.tang_planogram.png");
      PlanoDetails.brandname.add(decodeddata['data'][u]['brand_name']);
      PlanoDetails.opm.add(decodeddata['data'][u]['opm']);
      PlanoDetails.brandid.add(decodeddata['data'][u]['BID']);
      PlanoDetails.categoryname.add(decodeddata['data'][u]['c_name']);
      PlanoDetails.categoryid.add(decodeddata['data'][u]['c_id']);

    }


  }

}


class PlanoDetails{

  static List<String> imageurl = [];
  static List<String> beforeimage = [];
  static List<String> afterimage = [];
  static List<String> brandname = [];
  static List<String> categoryname = [];
  static List<String> image = [];
  static List<int> opm = [];
  static List<int> brandid = [];
  static List<int> categoryid = [];
}





