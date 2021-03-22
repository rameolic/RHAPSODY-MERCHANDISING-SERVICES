import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';

Future getempdetailsforreport() async{
  Map DBrequestData = {
  'emp_id': '${DBrequestdata.receivedempid}'
};
  http.Response EmpReport = await http.post(reportingdataurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(DBrequestData),
  );
  if (EmpReport.statusCode == 200){
    print('reporting details done');
    reporting.feildmanager = [];
    reporting.startdate = [];
    reporting.merchandisers = [];
    reporting.enddate = [];
    print('reporting details');
    String empdata = EmpReport.body;
    var decodeddata = jsonDecode(empdata);
    for(int u=0;u<decodeddata['data'].length;u++) {
      reporting.merchandisers.add('${decodeddata["data"][u]['employee']['first_name']} ${decodeddata["data"][u]['employee']['surname']}(${decodeddata["data"][u]['employee']['employee_id']})');
      reporting.feildmanager.add(decodeddata["data"][u]['reporting_to_emp_id']);
      reporting.startdate.add(decodeddata["data"][u]['reporting_date']);
      reporting.enddate.add(decodeddata["data"][u]['reporting_end_date']);
    }
  }
  if(EmpReport.statusCode != 200){
    print(EmpReport.body);
  }
}

class reporting {
  static List<dynamic> feildmanager = [];
  static List<dynamic> startdate=[];
  static List<dynamic> merchandisers = [];
  static List<dynamic> enddate=[];
}