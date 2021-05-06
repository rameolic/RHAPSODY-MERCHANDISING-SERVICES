import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';
class AddPromo{
  static List<int> productid = [];
  static List<int> checkvalue = [];
  static List<String> reason = [];


}

Future addPromotion() async{
  Map addpromodata = {
    'outlet_id' : currentoutletid,
    'timesheet_id' : currenttimesheetid,
    'product_id' : AddPromo.productid,
    'check_value' : AddPromo.checkvalue,
    'reason' : AddPromo.reason
  };

  print(jsonEncode(addpromodata));
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
