import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:merchandising/main.dart';
import 'api_service.dart';
import 'package:intl/intl.dart';

class timesheet{
  static var empid;
  static var empname;
}


Future getTimeSheetdaily() async {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String todaydate = formatter.format(now);
  Map timesheetfm = {
    'emp_id': '${timesheet.empid}',
    'date': '$todaydate',
  };
  Map Timesheetrequest = {
    'emp_id': '${DBrequestdata.receivedempid}',
    'date': '$todaydate',
  };
  print(timesheetfm);
  http.Response tsresponse = await http.post(TSurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: currentuser.roleid == 6 ? jsonEncode(Timesheetrequest) : jsonEncode(timesheetfm),
  );
  print(tsresponse.body);
  if (tsresponse.statusCode == 200) {
    TimeSheetdatadaily.outletname = [];
    TimeSheetdatadaily.checkouttime = [];
    TimeSheetdatadaily.checkintime = [];
    String data = tsresponse.body;
    var decodeData = jsonDecode(data);
    for(int u=0;u<decodeData['data'].length;u++){
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