import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';
import 'package:intl/intl.dart';


void getTimeSheet() async {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String todaydate = formatter.format(now);
  Map Timesheetrequest = {
    'emp_id': '$Empid',
    'date': '$todaydate',
  };
  print(Timesheetrequest);
  http.Response tsresponse = await http.post(TSurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(Timesheetrequest),
  );
  if (tsresponse.statusCode == 200) {
    String data = tsresponse.body;
    var decodeData = jsonDecode(data);
    TimeSheetdata.date = decodeData['data'][0]['date'];
    TimeSheetdata.checkintime = decodeData['data'][0]['checkin_time'];
    print(TimeSheetdata.checkintime);
    TimeSheetdata.checkouttime = decodeData['data'][0]['checkout_time'];
    TimeSheetdata.outletname = decodeData['data'][0]['outlet']['outlet_name'];
    TimeSheetdata.checkintime2 = decodeData['data'][1]['checkin_time'];
    TimeSheetdata.checkouttime2 = decodeData['data'][1]['checkout_time'];
    print(TimeSheetdata.checkintime2);
    TimeSheetdata.outletname2 = decodeData['data'][1]['outlet']['outlet_name'];
    TimeSheetdata.checkintime3 = decodeData['data'][2]['checkin_time'];
    TimeSheetdata.checkouttime3 = decodeData['data'][2]['checkout_time'];
    print(TimeSheetdata.checkintime3);
    TimeSheetdata.outletname3 = decodeData['data'][2]['outlet']['outlet_name'];
    TimeSheetdata.checkintime4 = decodeData['data'][3]['checkin_time'];
    print(TimeSheetdata.checkintime4);
    TimeSheetdata.checkouttime4 = decodeData['data'][3]['checkout_time'];
    TimeSheetdata.outletname4 = decodeData['data'][3]['outlet']['outlet_name'];
    TimeSheetdata.checkintime5 = decodeData['data'][4]['checkin_time'];
    print(TimeSheetdata.checkintime5);
    TimeSheetdata.checkouttime5 = decodeData['data'][4]['checkout_time'];
    TimeSheetdata.outletname5 = decodeData['data'][4]['outlet']['outlet_name'];
    TimeSheetdata.checkintime6 = decodeData['data'][5]['checkin_time'];
    TimeSheetdata.checkouttime6 = decodeData['data'][5]['checkout_time'];
    print(TimeSheetdata.checkintime6);
    TimeSheetdata.outletname6 = decodeData['data'][5]['outlet']['outlet_name'];
    TimeSheetdata.checkintime7 = decodeData['data'][6]['checkin_time'];
    print(TimeSheetdata.checkintime7);
    TimeSheetdata.checkouttime7 = decodeData['data'][6]['checkout_time'];
    TimeSheetdata.outletname7 = decodeData['data'][6]['outlet']['outlet_name'];
    TimeSheetdata.checkintime8 = decodeData['data'][7]['checkin_time'];
    TimeSheetdata.checkouttime8 = decodeData['data'][7]['checkout_time'];
    print(TimeSheetdata.checkintime8);
    TimeSheetdata.outletname8 = decodeData['data'][7]['outlet']['outlet_name'];
    TimeSheetdata.checkintime9 = decodeData['data'][8]['checkin_time'];
    TimeSheetdata.checkouttime9 = decodeData['data'][8]['checkout_time'];
    TimeSheetdata.outletname9 = decodeData['data'][8]['outlet']['outlet_name'];
    TimeSheetdata.checkintime10 = decodeData['data'][9]['checkin_time'];
    TimeSheetdata.checkouttime10 = decodeData['data'][9]['checkout_time'];
    TimeSheetdata.outletname10 = decodeData['data'][9]['outlet']['outlet_name'];


  }
  else {
    print(tsresponse.statusCode);
    print("error");
  }
}

class TimeSheetdata{
  static var outletname;
  static var checkintime;
  static var checkouttime;
  static var outletname2;
  static var checkintime2;
  static var checkouttime2;
  static var outletname3;
  static var checkintime3;
  static var checkouttime3;
  static var outletname4;
  static var checkintime4;
  static var checkouttime4;
  static var outletname5;
  static var checkintime5;
  static var checkouttime5;
  static var outletname6;
  static var checkintime6;
  static var checkouttime6;
  static var outletname7;
  static var checkintime7;
  static var checkouttime7;
  static var outletname8;
  static var checkintime8;
  static var checkouttime8;
  static var outletname9;
  static var checkintime9;
  static var checkouttime9;
  static var outletname10;
  static var checkintime10;
  static var checkouttime10;

  static var date;
}