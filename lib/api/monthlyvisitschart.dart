import 'dart:convert';
import 'api_service.dart';
import 'package:merchandising/api/api_service.dart';
class chartoutletid{
  static var outlet;
}
Future getchartdetails() {
  // Map ODrequestDataforcheckin = {
  //   'outlet_id': '${chartoutletid.outlet}',
  // };
  // print(ODrequestDataforcheckin);
  // http.Response BCResponse = await http.post(ChartUrl,
  //   headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
  //   },
  //   body: jsonEncode(ODrequestDataforcheckin),
  // );
  // if (BCResponse.statusCode == 200){
  //  print(BCResponse.body);
    String chartdata = outletvisitsdata[currentoutletindex];
    var decodedchartdata = jsonDecode(chartdata);
    visits.jan =decodedchartdata["data"][0]['count'];
    visits.feb =decodedchartdata["data"][1]['count'];
    visits.mar = decodedchartdata["data"][2]['count'];
    visits.apr = decodedchartdata["data"][3]['count'];
    visits.may = decodedchartdata["data"][4]['count'];
    visits.jun  = decodedchartdata["data"][5]['count'];
    visits.jul  = decodedchartdata["data"][6]['count'];
    visits.aug  = decodedchartdata["data"][7]['count'];
    visits.sep  = decodedchartdata["data"][8]['count'];
    visits.oct = decodedchartdata["data"][9]['count'];
    visits.nov  = decodedchartdata["data"][10]['count'];
    visits.dec = decodedchartdata["data"][11]['count'];

  //}
//   if(BCResponse.statusCode != 200){
//     print(BCResponse.statusCode);
//
// }
}

class visits{
  static int jan;
  static int feb;
  static int mar;
  static int apr;
  static int may;
  static int jun;
  static int jul;
  static int aug;
  static int sep;
  static int oct;
  static int nov;
  static int dec;
}





class expectedvisits{
  static int jan;
  static int feb;
  static int mar;
  static int apr;
  static int may;
  static int jun;
  static int jul;
  static int aug;
  static int sep;
  static int oct;
  static int nov;
  static int dec;
}

 expectectedvistschart(){
  String chartdata = outletEvisitsdata[currentoutletindex];
  var decodedchartdata = jsonDecode(chartdata);
  expectedvisits.jan =decodedchartdata["data"][0]['count'];
  expectedvisits.feb =decodedchartdata["data"][1]['count'];
  expectedvisits.mar = decodedchartdata["data"][2]['count'];
  expectedvisits.apr = decodedchartdata["data"][3]['count'];
  expectedvisits.may = decodedchartdata["data"][4]['count'];
  expectedvisits.jun  = decodedchartdata["data"][5]['count'];
  expectedvisits.jul  = decodedchartdata["data"][6]['count'];
  expectedvisits.aug  = decodedchartdata["data"][7]['count'];
  expectedvisits.sep  = decodedchartdata["data"][8]['count'];
  expectedvisits.oct = decodedchartdata["data"][9]['count'];
  expectedvisits.nov  = decodedchartdata["data"][10]['count'];
  expectedvisits.dec = decodedchartdata["data"][11]['count'];
  return expectedvisits.dec;
}