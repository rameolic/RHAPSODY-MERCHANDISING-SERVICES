import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';

Future getallempdetails() async{
  Map DBrequestData = {
    'emp_id': '${DBrequestdata.receivedempid}'
  };
  http.Response EmpReport = await http.post(empdetailsurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(DBrequestData),
  );
  if (EmpReport.statusCode == 200){
    print('employee details done');
    String empdata = EmpReport.body;
    var decodedempdata = jsonDecode(empdata);
    employees.fullname = [];
    employees.rolename = [];
    employees.feildmanagers = [];
    employees.merchandisers = [];
    employees.empid = [];
    for(int u=0;u<decodedempdata['data'].length;u++) {
     employees.fullname.add('${decodedempdata["data"][u]['first_name']} ${decodedempdata["data"][u]['surname']}(${decodedempdata["data"][u]['employee_id']})');
     employees.rolename.add(decodedempdata["data"][u]['role'][0]['name']);
     employees.empid.add(decodedempdata["data"][u]['employee_id']);
     decodedempdata['data'][u]['role'][0]['id'] == 5 ? employees.feildmanagers.add('${decodedempdata["data"][u]['first_name']} ${decodedempdata["data"][u]['surname']}(${decodedempdata["data"][u]['employee_id']})'): null;
     decodedempdata['data'][u]['role'][0]['id'] == 6 ? employees.merchandisers.add('${decodedempdata["data"][u]['first_name']} ${decodedempdata["data"][u]['surname']}(${decodedempdata["data"][u]['employee_id']})'): null;
    }
  }
  if(EmpReport.statusCode != 200){
    print(EmpReport.statusCode);

  }
}

class employees {
  static List<String> empid = [];
  static List<String> fullname= [];
  static List<dynamic> rolename= [];
  static List<String> feildmanagers = [];
  static List<String> merchandisers = [];
}