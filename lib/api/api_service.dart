import 'package:http/http.dart' as http;
import 'package:merchandising/model/Location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:merchandising/api/journeyplanapi.dart';
import 'jpskippedapi.dart';
import 'JPvisitedapi.dart';
import 'empdetailsapi.dart';
import 'package:merchandising/api/leavestakenapi.dart';
import'package:merchandising/api/timesheetapi.dart';


Uri Loginurl = Uri.parse("https://rms2.rhapsody.ae/api/login");
Uri DBdailyurl = Uri.parse("https://rms2.rhapsody.ae/api/dashboard_daily");
Uri DBmonthlyurl = Uri.parse("https://rms2.rhapsody.ae/api/dashboard_monthly");
Uri OCurl = Uri.parse("https://rms2.rhapsody.ae/api/outlet_details");
Uri CICOurl = Uri.parse("https://rms2.rhapsody.ae/api/check_in_out");
Uri TSurl = Uri.parse("https://rms2.rhapsody.ae/api/timesheet_daily");
Uri leaveurl = Uri.parse("https://rms2.rhapsody.ae/api/leave_request");
Uri empdataurl = Uri.parse("https://rms2.rhapsody.ae/api/employee_details");
Uri passwordchangeurl = Uri.parse("https://rms2.rhapsody.ae/api/change_password");
Uri LDurl = Uri.parse("https://rms2.rhapsody.ae/api/leave_details");
Uri JPSkippedurl = Uri.parse("https://rms2.rhapsody.ae/api/today_skipped_journey");
Uri JPVisitedurl = Uri.parse("https://rms2.rhapsody.ae/api/today_completed_journey");
Uri JPurl = Uri.parse("https://rms2.rhapsody.ae/api/today_planned_journey");




Future getDashBoardData() async {
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
    DBrequestdata.emailid =decodeData['user']['email'];
     if(DBrequestdata.receivedtoken != null && DBrequestdata.receivedempid !=null ) {
       DBRequestdaily();
       DBRequestmonthly();
       getJourneyPlan();
       getskippedJourneyPlan();
       getvisitedJourneyPlan();
       getempdetails();
       leaveData();
       getTimeSheet();
     }
  }
  else {
    print(response.statusCode);
    print("error");
    print(response.body);
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
  static var emailid;
}
var token = DBrequestdata.receivedtoken;
var Empid = DBrequestdata.receivedempid;
Map DBrequestData = {
  'emp_id': '$Empid'
};

Future DBRequestdaily() async{
  print(DBrequestData);
  http.Response DBresponse = await http.post(DBdailyurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(DBrequestData),
  );
  if (DBresponse.statusCode == 200){
    print('dashboard daily done');
    String DBdata = DBresponse.body;
    var decodeDBData = jsonDecode(DBdata);
    DBResponsedatadaily.shedulevisits = decodeDBData['SheduleCalls'];
    DBResponsedatadaily.unshedulevisits = decodeDBData['UnSheduleCalls'];
    DBResponsedatadaily.ShedulevisitssDone =decodeDBData['SheduleCallsDone'];
    DBResponsedatadaily.UnShedulevisitsDone = decodeDBData['UnSheduleCallsDone'];
    DBResponsedatadaily.Attendance =decodeDBData['Attendance'];
    DBResponsedatadaily.WorkingTime =decodeDBData['WorkingTime'];
    DBResponsedatadaily.EffectiveTime =decodeDBData['EffectiveTime'];
    DBResponsedatadaily.TravelTime =decodeDBData['TravelTime'];
    DBResponsedatadaily.todayPlanpercentage =decodeDBData['JourneyPlanpercentage'];
  }
  if(DBresponse.statusCode != 200){
    print(DBresponse.statusCode);
  }
}
Future DBRequestmonthly() async{
  http.Response DBresponse = await http.post(DBmonthlyurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(DBrequestData),
  );
  if (DBresponse.statusCode == 200){
    print('dashboard monthly done');
    String DBdata = DBresponse.body;
    var decodeDBData = jsonDecode(DBdata);
    DBResponsedatamonthly.shedulevisits = decodeDBData['SheduleCalls'];
    DBResponsedatamonthly.unshedulevisits = decodeDBData['UnSheduleCalls'];
    DBResponsedatamonthly.ShedulevisitssDone =decodeDBData['SheduleCallsDone'];
    DBResponsedatamonthly.UnShedulevisitsDone = decodeDBData['UnSheduleCallsDone'];
    DBResponsedatamonthly.Attendance =decodeDBData['Attendance'];
    DBResponsedatamonthly.WorkingTime =decodeDBData['WorkingTime'];
    DBResponsedatamonthly.EffectiveTime =decodeDBData['EffectiveTime'];
    DBResponsedatamonthly.TravelTime =decodeDBData['TravelTime'];
    DBResponsedatamonthly.monthPlanpercentage =decodeDBData['JourneyPlanpercentage'];
    DBResponsedatamonthly.leavebalance = decodeDBData['LeaveCount'];
    return DBResponsedatamonthly.leavebalance;
  }
  if(DBresponse.statusCode != 200){
    print(DBresponse.statusCode);
  }
}

class DBResponsedatadaily {
  static var shedulevisits;
  static var unshedulevisits;
  static var ShedulevisitssDone;
  static var UnShedulevisitsDone;
  static var Attendance;
  static var WorkingTime;
  static var EffectiveTime;
  static var TravelTime;
  static int todayPlanpercentage;
}

class DBResponsedatamonthly{
  static var shedulevisits;
  static var unshedulevisits;
  static var ShedulevisitssDone;
  static var UnShedulevisitsDone;
  static var Attendance;
  static var WorkingTime;
  static var EffectiveTime;
  static var TravelTime;
  static int monthPlanpercentage;
  static var leavebalance;
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
  static var checkinaddress;
  static var contactnumber;
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
    chekinoutlet.checkinoutletid = decodeODData['data'][0]['store'][0]["store_code"];
    chekinoutlet.checkinoutletname = decodeODData['data'][0]['store'][0]["store_name"];
    chekinoutlet.checkinaddress = decodeODData['data'][0]['store'][0]["address"];
    chekinoutlet.contactnumber = decodeODData['data'][0]['store'][0]["contact_number"];
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
  if(cicoresponse.statusCode == 200){
    getTimeSheet();
    DBRequestdaily();
    DBRequestmonthly();
  }else{
    print(cicoresponse.body);
  }
}


void leaverequest() async {
  var leavetype = leave.type;
  var startdate = leave.startdate;
  var enddate = leave.enddate;
  var reason = leave.reason;
  Map leaverequestbody =
  {
    'emp_id': '$Empid',
    "leavetype": "$leavetype",
    "leavestartdate": "$startdate",
    "leaveenddate": "$enddate",
    "reason": "$reason",
  };
  print(leaverequestbody);
  http.Response leaveresponse = await http.post(leaveurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(leaverequestbody),
  );
  print(leaveresponse.statusCode);
  if(leaveresponse.statusCode == 200 ){
    print(jsonDecode(leaveresponse.body));
  }
}

class leave {
static var type;
static var startdate;
static var enddate;
static var reason;
}

class password{
  static var userpassword;
}

Future changepassword() async{
  var newpassword = change.password;
  Map requestchangepassword =
  {
    'emp_id': '$Empid',
    "password": "$newpassword"
  };
  http.Response changedpasswordresponse = await http.post(passwordchangeurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(requestchangepassword),
  );
  print(requestchangepassword);
  print(changedpasswordresponse.statusCode);
  if(changedpasswordresponse.statusCode == 200 ){
    print(jsonDecode(changedpasswordresponse.body));
  }
}

class change{
  static var password;
}

