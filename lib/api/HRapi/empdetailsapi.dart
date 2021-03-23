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
class updatedata{
  static bool employee = false;
  static var empid;
}

Future getempdata() async{
  Map request = {
    'emp_id': '${updatedata.empid}'
  };
  print(request);
  http.Response EmpReport = await http.post(empdataurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(request),
  );
  if (EmpReport.statusCode == 200){
    String empdata = EmpReport.body;
    var decodedempdata = jsonDecode(empdata);
    for(int u=0;u<decodedempdata['data'].length;u++) {
      employeedata.firstname = decodedempdata['data'][u]['first_name'];
      employeedata.middlename = decodedempdata['data'][u]['middle_name'];
      employeedata.surname = decodedempdata['data'][u]['surname'];
      employeedata.passportno = decodedempdata['data'][u]['passport_number'];
      employeedata.nationality = decodedempdata['data'][u]['nationality'];
      employeedata.gender = decodedempdata['data'][u]['gender'];
      employeedata.codes = decodedempdata['data'][u]['codes'];
      employeedata.emiratesid = decodedempdata['data'][u]['emirates_id'];
      employeedata.mobileno = decodedempdata['data'][u]['mobile_number'];
      employeedata.email = decodedempdata['data'][u]['email'];
      employeedata.designation = decodedempdata['data'][u]['designation'];
      employeedata.departmant = decodedempdata['data'][u]['department'];
      employeedata.joiningdate = decodedempdata['data'][u]['joining_date'];
      employeedata.visaexpdate = decodedempdata['data'][u]['visa_exp_date'];
      employeedata.passportexpdate = decodedempdata['data'][u]['passport_exp_date'];
      employeedata.medicalinsno = decodedempdata['data'][u]['medical_ins_no'];
      employeedata.medicalinsexpdate = decodedempdata['data'][u]['medical_ins_exp_date'];
      employeedata.visacompanyname = decodedempdata['data'][u]['visa_company_name'];
    }
  }
  if(EmpReport.statusCode != 200){
    print(EmpReport.statusCode);
  }
}
class employeedata{
  static var firstname;
  static var middlename;
  static var surname;
  static var passportno;
  static var nationality;
  static var gender;
  static var codes;
  static var emiratesid;
  static var mobileno;
  static var email;
  static var designation;
  static var departmant;
  static var joiningdate;
  static var visaexpdate;
  static var passportexpdate;
  static var medicalinsno;
  static var medicalinsexpdate;
  static var visacompanyname;
}