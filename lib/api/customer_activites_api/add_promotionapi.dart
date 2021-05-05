import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';
class AddPromo{
  static var outletid;
  static var timesheetid;
  static var productid = [];
  static var checkvalue = [];
  static var reason = [];


}

Future addPromotion() async{
  Map addpromodata = {
    'outlet_id' : '${AddPromo.outletid}',
    'timesheet_id' : '${AddPromo.timesheetid}',
    'product_id' : '${AddPromo.productid}',
    'check_value' : '${AddPromo.checkvalue}',
    'reason' : '${AddPromo.reason}',
  };
  // http.Response response = await http.post(MercAddPromotion,
  //   headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
  //   },
  //   body: jsonEncode(addpromodata),
  // );
  // print(addpromodata);

}
