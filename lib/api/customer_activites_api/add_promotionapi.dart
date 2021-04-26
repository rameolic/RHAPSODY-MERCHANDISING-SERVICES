import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';
class AddPromo{
  static int outletid;
  static int timesheetid;
  static var productid ;
  static var  checkvalue ;
  static var reason ;


}

Future addPromotion() async{
  Map addpromodata = {
    "outlet_id": '${AddPromo.outletid}',
    "timesheet_id":'${AddPromo.timesheetid}',
    "product_id":"${AddPromo.productid}",
    "check_value":'${AddPromo.checkvalue}',
    "reason":'${AddPromo.reason}'
  };
  print(addpromodata);
  http.Response response = await http.post(MercAddPromotion,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(addpromodata),
  );
  print(response.body);

}

Future<void> getpromotionaldata() async {
  Map body = {
    "time_sheet_id" : timesheetid
  };
  http.Response competitionresponse = await http.post(MercViewUpdtPromo,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(body),
  );
  if (competitionresponse.statusCode == 200) {
    print(body);
    promodata.brandname = [];
    promodata.productname = [];
    promodata.productid = [];
    promodata.id = [];
    promodata.categoryname = [];
    print('Competion Check Details done');
    String competition = competitionresponse.body;
    var decodeddata = jsonDecode(competition);
    for (int u = 0; u< decodeddata['data'].length; u++) {
      promodata.brandname.add(decodeddata['data'][u]['b_name']);
      promodata.categoryname.add(decodeddata['data'][u]['category_name']);
      promodata.productid.add(decodeddata['data'][u]['product_id']);
      promodata.productname.add(decodeddata['data'][u]['p_name']);
      promodata.id.add(decodeddata['data'][u]['id']);
    }
    print("names: ${promodata.productname}");
  }

}

class promodata{
  static List<String> productname;
  static List<int> productid;
  static List<int> id;
  static List<String> brandname;
  static List<String> categoryname;
}
