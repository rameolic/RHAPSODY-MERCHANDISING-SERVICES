import 'package:http/http.dart' as http;
import 'package:merchandising/model/Location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'jpapi.dart';

Uri Loginurl = Uri.parse("https://rms.rhapsody.ae/api/login");
Uri DBurl = Uri.parse("https://rms.rhapsody.ae/api/dashboard");
Uri JPurl = Uri.parse("https://rms.rhapsody.ae/api/today_planned_journey");
Uri OCurl = Uri.parse("https://rms.rhapsody.ae/api/outlet_details");
Uri CICOurl = Uri.parse("https://rms.rhapsody.ae/api/check_in_out");
Uri TSurl = Uri.parse("https://rms.rhapsody.ae/api/timesheet_daily");

Future<void> getDashBoardData() async {
  var emailid = loginrequestdata.inputemail;
  var password = loginrequestdata.inputpassword;
  Map loginData = {
    'email': '$emailid',
    'password': '$password',
  };
  print(loginData);
  http.Response response = await http.post(Loginurl,
      body: loginData);
  if (response.statusCode == 200) {
    print("LoginDone");
    String data = response.body;
    var decodeData = jsonDecode(data);
    DBrequestdata.receivedtoken =decodeData['token'];
    DBrequestdata.receivedempid = decodeData['user'] ['emp_id'];
    DBrequestdata.empname = decodeData['user'] ['name'];
     if(DBrequestdata.receivedtoken != null && DBrequestdata.receivedempid !=null ) {
       DBRequest();
       getJourneyPlan();

     }
  }
  else {
    print(response.statusCode);
    print("error");
  }
}

class loginrequestdata {
  static var inputemail;
  static var inputpassword;
}
class outletrequestdata {
  static var outletidpressed;
}

class DBrequestdata {
  static var receivedtoken;
  static var receivedempid;
  static var empname;
}
var token = DBrequestdata.receivedtoken;
var Empid = DBrequestdata.receivedempid;
Map DBrequestData = {
  'emp_id': '$Empid'
};

void DBRequest() async{
  http.Response DBresponse = await http.post(DBurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(DBrequestData),
  );
  if (DBresponse.statusCode == 200){
    print('dashboard done');
    String DBdata = DBresponse.body;
    var decodeDBData = jsonDecode(DBdata);
    DBResponsedata.shedulevisits = decodeDBData['SheduleCalls'];
    DBResponsedata.unshedulevisits = decodeDBData['UnSheduleCalls'];
    DBResponsedata.ShedulevisitssDone =decodeDBData['SheduleCallsDone'];
    DBResponsedata.UnShedulevisitsDone = decodeDBData['UnSheduleCallsDone'];
    DBResponsedata.Attendance =decodeDBData['Attendance'];
    DBResponsedata.WorkingTime =decodeDBData['WorkingTime'];
    DBResponsedata.EffectiveTime =decodeDBData['EffectiveTime'];
    DBResponsedata.TravelTime =decodeDBData['TravelTime'];
    DBResponsedata.monthPlanpercentage =decodeDBData['JourneyPlanpercentage'][0]['month_percentage'];
  }
  if(DBresponse.statusCode != 200){
    print(DBresponse.statusCode);

  }
}

class DBResponsedata {
  static var shedulevisits;
  static var unshedulevisits;
  static var ShedulevisitssDone;
  static var UnShedulevisitsDone;
  static var Attendance;
  static var WorkingTime;
  static var EffectiveTime;
  static var TravelTime;
  static int monthPlanpercentage;
  static int todayPlanpercentage;
}

class chekinoutlet{
  static var checkinoutletid;
  static var checkinoutletname;
  static var checkinlat;
  static var checkinlong;
  static var checkinarea;
  static var checkincity;
  static var checkinstate;
  static var checkincountry;
  static double currentdistance;

}


void outletwhencheckin() async {
  var outletid = outletrequestdata.outletidpressed;
  Map ODrequestDataforcheckin = {
    'outlet_id': '$outletid',
  };
  print(ODrequestDataforcheckin);
  http.Response OCresponse = await http.post(OCurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(ODrequestDataforcheckin),
  );
  if (OCresponse.statusCode == 200){
    String OCdata = OCresponse.body;
    var decodeODData = jsonDecode(OCdata);
    chekinoutlet.checkinoutletid = decodeODData['data'][0]['outlet_id'];
    chekinoutlet.checkinoutletname = decodeODData['data'][0]['outlet_name'];
    chekinoutlet.checkinarea = decodeODData['data'][0]['outlet_area'];
    chekinoutlet.checkincity = decodeODData['data'][0]['outlet_city'];
    chekinoutlet.checkinstate = decodeODData['data'][0]['outlet_state'];
    chekinoutlet.checkincountry = decodeODData['data'][0]['outlet_country'];
    chekinoutlet.checkinlat = decodeODData['data'][0]['outlet_lat'];
    chekinoutlet.checkinlong = decodeODData['data'][0]['outlet_long'];
    chekinoutlet.currentdistance = Geolocator.distanceBetween(lat, long, double.parse(chekinoutlet.checkinlat), double.parse(chekinoutlet.checkinlong));
  }
  if(OCresponse.statusCode != 200){
    print(OCresponse.statusCode);

  }
}

class checkinoutdata{
  static var checkinoutdataname;
  static var checkintime;
  static var checkouttime;
  static var checkinlocation;
  static var checkoutlocation;
  static var checkid;
}

void CheckinCheckout() async {
  var checkid = checkinoutdata.checkid;
  var checkintime = checkinoutdata.checkintime;
  var checkouttime = checkinoutdata.checkouttime;
  var checkinlocation = checkinoutdata.checkinlocation;
  var checkoutlocation = checkinoutdata.checkoutlocation;
  Map checkinoutresponse =
  {
    "id": "$checkid",
    "checkin_time": "$checkintime",
    "checkout_time": "$checkouttime",
    "checkin_location": "$checkinlocation",
    "checkout_location": "$checkoutlocation"
  };
  print(checkinoutresponse);
  http.Response cicoresponse = await http.post(CICOurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(checkinoutresponse),
  );
  print(cicoresponse.statusCode);
}
