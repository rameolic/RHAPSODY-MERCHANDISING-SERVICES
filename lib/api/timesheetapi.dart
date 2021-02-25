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
    TimeSheetdata.days = [];
    TimeSheetdata.outletname = [];
    TimeSheetdata.checkouttime = [];
    TimeSheetdata.checkintime = [];
    print("called timesheet");
    String data = tsresponse.body;
    var decodeData = jsonDecode(data);
    TimeSheetdata.date = decodeData['data'][0]['date'];
    for(int u=0;u<20;u++){
      dynamic outletname = decodeData['data'][u]['store_name'];
      TimeSheetdata.outletname.add(outletname);
      dynamic checkintime = decodeData['data'][u]['checkin_time'];
      TimeSheetdata.checkintime.add(checkintime);
      dynamic checkouttime = decodeData['data'][u]['checkout_time'];
      TimeSheetdata.checkouttime.add(checkouttime);
      dynamic days = decodeData['data'][u]['day'];
      TimeSheetdata.days.add(days);
    }

  }
  else {
    print(tsresponse.statusCode);
    print("error");
  }
}

class TimeSheetdata{
  static List<dynamic> outletname=[];
  static List<dynamic> checkintime=[];
  static List<dynamic> checkouttime=[];
  static List<dynamic> days=[];
  static var date;
}