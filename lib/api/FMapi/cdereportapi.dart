import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';
import 'package:merchandising/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/offlinedata/sharedprefsdta.dart';
String empreportdata;
Future CDEReportingDetails() async{

    Map DBrequestData = {
      'emp_id': '${DBrequestdata.receivedempid}'
     };
    http.Response EmpReport = await http.post(CDEReportingDet,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
      },
      body: jsonEncode(DBrequestData),
    );
    if (EmpReport.statusCode == 200) {
      print('CDE reporting details done');
      CDEreportdata.cdeempid = [];
      CDEreportdata.startdate = [];
      CDEreportdata.merchandisersid = [];
      CDEreportdata.enddate = [];
      print('reporting details');
      empreportdata = EmpReport.body;
      addempdetailesreport(empreportdata);
      var decodeddata = jsonDecode(empreportdata);
      for (int u = 0; u < decodeddata['data'].length; u++) {
        CDEreportdata.cdeempid.add(decodeddata["data"][u]['cde_id']);
        CDEreportdata.startdate.add(decodeddata["data"][u]['reporting_date']);
        CDEreportdata.enddate.add(decodeddata["data"][u]['reporting_end_date']);
        CDEreportdata.merchandisersid.add(decodeddata["data"][u]['merchandiser_id']);

      }
      print(CDEreportdata.merchandisersid.length);
      print(CDEreportdata.merchandisersid);
      print(CDEreportdata.cdeempid.length);


    }
    if (EmpReport.statusCode != 200) {
      print(EmpReport.body);
    }

}

class CDEreportdata {
  static List<dynamic> cdeempid = [];
  static List<dynamic> startdate=[];
  static List<dynamic> merchandisers = [];
  static List<dynamic> enddate=[];
  static List<dynamic> merchandisersid=[];
  static List<dynamic> fmnames=[];


}