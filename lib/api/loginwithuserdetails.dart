
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class myprofile {
  static var surname;
  static var passportnumber;
  static var nationality;
  static var mobilenumber;
  static var designation;
  static var department;
  static var joiningdate;
  static var visaexpirydate;
  static var passportexpirydate;
  static var visacompanyname;
  static var employeescore;
  static var documents;
  static var loginstatuscode;
}


Future getempdetails() async{
  http.Response DBresponse = await http.post(empdataurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(DBrequestData),
  );
  if (DBresponse.statusCode == 200){
    String empdata = DBresponse.body;
    var decodedempdata = jsonDecode(empdata);
    myprofile.surname =decodedempdata["data"][0]['surname'];
    myprofile.passportnumber =decodedempdata["data"][0]['passport_number'];
    myprofile.nationality = decodedempdata["data"][0]['nationality'];
    myprofile.mobilenumber = decodedempdata["data"][0]['mobile_number'];
    myprofile.designation = decodedempdata["data"][0]['designation'];
    myprofile.department = decodedempdata["data"][0]['department'];
    myprofile.joiningdate = decodedempdata["data"][0]['joining_date'];
    myprofile.passportexpirydate = decodedempdata["data"][0]['passport_exp_date'];
    myprofile.visaexpirydate = decodedempdata["data"][0]['visa_exp_date'];
    myprofile.visacompanyname = decodedempdata["data"][0]['visa_company_name'];
    myprofile.employeescore = decodedempdata["data"][0]['employee_score'];
  }
  if(DBresponse.statusCode != 200){
    print(DBresponse.statusCode);

  }
}