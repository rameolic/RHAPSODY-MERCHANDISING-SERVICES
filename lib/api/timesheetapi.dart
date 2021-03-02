import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';
import 'package:intl/intl.dart';


void getTimeSheetdaily() async {
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
    TimeSheetdatadaily.outletname = [];
    TimeSheetdatadaily.checkouttime = [];
    TimeSheetdatadaily.checkintime = [];
    String data = tsresponse.body;
    var decodeData = jsonDecode(data);
    for(int u=0;u<20;u++){
      dynamic outletname = decodeData['data'][u]['store_name'];
      TimeSheetdatadaily.outletname.add(outletname);
      dynamic checkintime = decodeData['data'][u]['checkin_time'];
      TimeSheetdatadaily.checkintime.add(checkintime);
      dynamic checkouttime = decodeData['data'][u]['checkout_time'];
      TimeSheetdatadaily.checkouttime.add(checkouttime);
    }

  }
  else {
    print(tsresponse.statusCode);
    print("error");
  }
}

class TimeSheetdatadaily{
  static List<dynamic> outletname=[];
  static List<dynamic> checkintime=[];
  static List<dynamic> checkouttime=[];
}