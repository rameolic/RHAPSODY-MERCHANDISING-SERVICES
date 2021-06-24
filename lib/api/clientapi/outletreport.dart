import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';





// ignore: non_constant_identifier_names
Future OutletsForClient() async{
  Map DBrequestData = {
    'emp_id': '${DBrequestdata.receivedempid}'
  };
  http.Response OutletDetails = await http.post(clientoutletsurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(DBrequestData),
  );
  if (OutletDetails.statusCode == 200){
    print("cilent outlets received");
    String outletdetdata = OutletDetails.body;
    var decodeoutlet = jsonDecode(outletdetdata);
    clientoutlets.outletid=[];
    clientoutlets.timesheetid = [];
    clientoutlets.outletname = [];
    clientoutlets.lastvisiteddate = [];
    clientoutlets.checkintime = [];
    clientoutlets.checkouttime = [];
    clientoutlets.checkinlocation = [];
    clientoutlets.checkoutlocation = [];
    clientoutlets.merchandiserid = [];
    for(int u=0;u<decodeoutlet['data'].length;u++) {
      clientoutlets.timesheetid.add(decodeoutlet['data'][u]['id']);
      clientoutlets.outletid.add(decodeoutlet['data'][u]['outlet_id']);
      clientoutlets.outletname.add(decodeoutlet['data'][u]['store_name']);
      clientoutlets.lastvisiteddate.add(decodeoutlet['data'][u]['date']);
      clientoutlets.checkintime.add(decodeoutlet['data'][u]['checkin_time']);
      clientoutlets.checkouttime.add(decodeoutlet['data'][u]['checkout_time']);
      clientoutlets.checkinlocation.add(decodeoutlet['data'][u]['checkin_location']);
      clientoutlets.checkoutlocation.add(decodeoutlet['data'][u]['checkout_location']);
      clientoutlets.merchandiserid.add(decodeoutlet['data'][u]['employee_id']);
      clientoutlets.outletmapingid.add(decodeoutlet['data'][u]['opm_id']);
      clientoutlets.isschedulevisit.add(decodeoutlet['data'][u]['scheduled_calls']);
    }
    print("client outlets received");
    }
  if(OutletDetails.statusCode != 200){
    print(OutletDetails.statusCode);

  }
}

class clientoutlets {
  static List<int> outletid=[];
  static List<dynamic> timesheetid= [];
  static List<String> outletname= [];
  static List<dynamic> lastvisiteddate= [];
  static List<dynamic> checkintime=[];
  static List<dynamic> checkouttime= [];
  static List<dynamic> checkinlocation= [];
  static List<dynamic> checkoutlocation= [];
  static List<dynamic> merchandiserid=[];
  static List<dynamic> outletmapingid =[];
  static List<dynamic> isschedulevisit =[];
}
