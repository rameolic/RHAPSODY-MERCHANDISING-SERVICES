

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:merchandising/api/api_service.dart';
import 'package:intl/intl.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/timesheetmonthly.dart';

String today = DateFormat('yyyy-MM-DD').format(DateTime.now());


Future<void> gettimesheetmonthly() async {
  var listOfDates = new List<String>.generate(
      daysInMonth(DateTime(int.parse(DateFormat('yyyy').format(DateTime.now())),
          int.parse(DateFormat('mm').format(DateTime.now())))),
          (i) => "${int.parse(DateFormat('yyyy').format(DateTime.now()))}-${DateFormat('MM').format(DateTime.now())}-${'${i + 1}'.toString().padLeft(2,"0")}");
  Map request = {
    "emp_id": "$Empid",
    "month" : "2021-03-05"
  };
  print(request);
  http.Response dataresponse = await http.post(TSMurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(request),
  );
  if (dataresponse.statusCode == 200) {
    TMmonthly.day1=[];
    TMmonthly.day2=[];
    TMmonthly.day3=[];
    TMmonthly.day4=[];
    TMmonthly.day5=[];
    TMmonthly.day6=[];
    TMmonthly.day7=[];
    TMmonthly.day8=[];
    TMmonthly.day9=[];
    TMmonthly.day10=[];
    TMmonthly.day11=[];
    TMmonthly.day12=[];
    TMmonthly.day13=[];
    TMmonthly.day14=[];
    TMmonthly.day15=[];
    TMmonthly.day16=[];
    TMmonthly.day17=[];
    TMmonthly.day18=[];
    TMmonthly.day19=[];
    TMmonthly.day20=[];
    TMmonthly.day21=[];
    TMmonthly.day22=[];
    TMmonthly.day23=[];
    TMmonthly.day24=[];
    TMmonthly.day25=[];
    TMmonthly.day26=[];
    TMmonthly.day27=[];
    TMmonthly.day28=[];
    TMmonthly.day29=[];
    TMmonthly.day30=[];
    TMmonthly.day31=[];
    String data = dataresponse.body;
    var decodeData = jsonDecode(data);
    print(decodeData['data'].length);
    for (int u=0;u<decodeData['data'].length;u++){
      print(u);
      print('timesheetmonthly done');
      String date = decodeData['data'][u]['date'];
      if(date == listOfDates[1-1]){TMmonthly.day1.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[2-1]){TMmonthly.day2.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[3-1]){TMmonthly.day3.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[4-1]){TMmonthly.day4.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[5-1]){TMmonthly.day5.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[6-1]){TMmonthly.day6.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[7-1]){TMmonthly.day7.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[8-1]){TMmonthly.day8.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[9-1]){TMmonthly.day9.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[10-1]){TMmonthly.day10.add('Outlet:${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[11-1]){TMmonthly.day11.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[12-1]){TMmonthly.day12.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[13-1]){TMmonthly.day13.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[14-1]){TMmonthly.day14.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[15-1]){TMmonthly.day15.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[16-1]){TMmonthly.day16.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[17-1]){TMmonthly.day17.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[18-1]){TMmonthly.day18.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[19-1]){TMmonthly.day19.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[20-1]){TMmonthly.day20.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[21-1]){TMmonthly.day21.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[22-1]){TMmonthly.day22.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[23-1]){TMmonthly.day23.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[24-1]){TMmonthly.day24.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[25-1]){TMmonthly.day25.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[26-1]){TMmonthly.day26.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[27-1]){TMmonthly.day27.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[28-1]){TMmonthly.day28.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[29-1]){TMmonthly.day29.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[30-1]){TMmonthly.day30.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
      if(date == listOfDates[31-1]){TMmonthly.day31.add('Outlet: ${decodeData['data'][u]['store_name']}\n\ncheckin:${decodeData['data'][u]['checkin_time']}\n\ncheckout:${decodeData['data'][u]['checkout_time']}');}
    }


  }else{
    print(dataresponse.body);
  }
}




class TMmonthly{
  static List<String> day1= [];
  static List<String> day2 = [];
  static List<String> day3 = [];
  static List<String> day4 = [];
  static List<String> day5 = [];
  static List<String> day6 = [];
  static List<String> day7 = [];
  static List<String> day8 = [];
  static List<String> day9 = [];
  static List<String> day10 = [];
  static List<String> day11 = [];
  static List<String> day12 = [];
  static List<String> day13 = [];
  static List<String> day14 = [];
  static List<String> day15 = [];
  static List<String> day16 = [];
  static List<String> day17 = [];
  static List<String> day18 = [];
  static List<String> day19 = [];
  static List<String> day20 = [];
  static List<String> day21 = [];
  static List<String> day22 = [];
  static List<String> day23 = [];
  static List<String> day24 = [];
  static List<String> day25 = [];
  static List<String> day26 = [];
  static List<String> day27 = [];
  static List<String> day28 = [];
  static List<String> day29 = [];
  static List<String> day30 = [];
  static List<String> day31 = [];
}