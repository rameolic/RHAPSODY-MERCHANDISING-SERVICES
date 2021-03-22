import 'package:http/http.dart' as http;
import 'package:merchandising/model/Location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:merchandising/main.dart';
import 'package:merchandising/model/rememberme.dart';
import 'package:merchandising/api/monthlyvisitschart.dart';

Uri ChartUrl = Uri.parse("https://rms2.rhapsody.ae/api/outlet_chart");
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
Uri empdetailsurl = Uri.parse("https://rms2.rhapsody.ae/api/employee_details_for_report");
Uri reportingdataurl = Uri.parse("https://rms2.rhapsody.ae/api/reporting_to_details");
Uri addreportaurl = Uri.parse("https://rms2.rhapsody.ae/api/add_reporting");
Uri holidaysdataurl = Uri.parse("https://rms2.rhapsody.ae/api/holidays_details");
Uri addholidayurl = Uri.parse("https://rms2.rhapsody.ae/api/add_holidays");
Uri WJPPlannedurl = Uri.parse("https://rms2.rhapsody.ae/api/week_planned_journey");
Uri WJPSkippedurl = Uri.parse("https://rms2.rhapsody.ae/api/week_skipped_journey");
Uri WJPVisitedurl = Uri.parse("https://rms2.rhapsody.ae/api/week_completed_journey");
Uri TSMurl = Uri.parse("https://rms2.rhapsody.ae/api/timesheet_monthly");
Uri HRdburl = Uri.parse("https://rms2.rhapsody.ae/api/hr_dashboard");
Uri visitsurl = Uri.parse("https://rms2.rhapsody.ae/api/outlet_chart");
Uri MercNameList = Uri.parse("https://rms2.rhapsody.ae/api/merchandiser_under_fieldmanager_details");
Uri Storedetailsurl = Uri.parse("https://rms2.rhapsody.ae/api/store_details");
Uri AddStoreurl = Uri.parse("https://rms2.rhapsody.ae/api/add_store");
Uri StoreDetailsurl = Uri.parse("https://rms2.rhapsody.ae/api/store_details");
Uri FMDashBoardurl = Uri.parse("https://rms2.rhapsody.ae/api/fieldmanager_dashboard");
Uri AddOutletsurl = Uri.parse("https://rms2.rhapsody.ae/api/add_outlet");
Uri FMJPurl = Uri.parse("https://rms2.rhapsody.ae/api/journey");
Uri MercLeaveDetails = Uri.parse("https://rms2.rhapsody.ae/api/merchandiser_leave_details");
Uri AddEmployee = Uri.parse("https://rms2.rhapsody.ae/api/add_employee");
Uri unschdulejp = Uri.parse("https://rms2.rhapsody.ae/api/add_unscheduled_journeyplan");
Uri designation = Uri.parse("https://rms2.rhapsody.ae/api/all_roles");
Uri schdulejp = Uri.parse("https://rms2.rhapsody.ae/api/add_scheduled_journeyplan");
Uri Attendance = Uri.parse("https://rms2.rhapsody.ae/api/attendance_monthly");


class loggedin{
  static var email;
  static var password;
}

Future loginapi() async {
  loggedin.email = remembereddata.email == null ? loginrequestdata.inputemail : remembereddata.email;
  loggedin.password =remembereddata.password == null ? loginrequestdata.inputpassword : remembereddata.password;
  Map loginData = {
    'email': '${loggedin.email}',
    'password': '${loggedin.password}',
  };
  print(loginData);
  http.Response response = await http.post(Loginurl,
      body: loginData);
  if (response.statusCode == 200) {
    loggedin.email =null;
    loggedin.password=null;
    userpassword.password = loggedin.password;
    print("LoginDone");
    getLocation();
    String data = response.body;
    var decodeData = jsonDecode(data);
    DBrequestdata.receivedtoken =decodeData['token'];
    DBrequestdata.receivedempid = decodeData['user'] ['emp_id'];
    DBrequestdata.empname = decodeData['user'] ['name'];
    DBrequestdata.emailid =decodeData['user']['email'];
    currentuser.roleid = decodeData['user']['role_id'];
    print(DBrequestdata.empname);

    return currentuser.roleid;
  }
  else {
    print(response.statusCode);
    print("error");
    print(response.body);
    return currentuser.roleid;
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


Future DBRequestdaily() async{
  Map DBrequestData = {
    'emp_id': '${DBrequestdata.receivedempid}'
  };
  print(DBrequestData);
  http.Response DBresponse = await http.post(DBdailyurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
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
    return  DBResponsedatadaily.todayPlanpercentage;
  }
  if(DBresponse.statusCode != 200){
    print(DBresponse.statusCode);
  }
}
Future DBRequestmonthly() async{
  Map DBrequestData = {
    'emp_id': '${DBrequestdata.receivedempid}'
  };
  http.Response DBresponse = await http.post(DBmonthlyurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${{DBrequestdata.receivedtoken}}',
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
    remaining.leaves = DBResponsedatamonthly.leavebalance;
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


Future outletwhencheckin() async { 
  var outletid = outletrequestdata.outletidpressed;
  chartoutletid.outlet = outletrequestdata.outletidpressed;
  Map ODrequestDataforcheckin = {
    "emp_id": "${DBrequestdata.receivedempid}",
    'outlet_id': '$outletid',
  };
  print(ODrequestDataforcheckin);
  http.Response OCresponse = await http.post(OCurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
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
    return getchartdetails();
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


void checkin() async {
  var checkid = checkinoutdata.checkid;
  var checkintime = checkinoutdata.checkintime;
  var checkinlocation = checkinoutdata.checkinlocation;
  Map checkinoutresponse =
  {
    "id": "$checkid",
    "checkin_time": "$checkintime",
    "checkin_location": "$checkinlocation",
  };
  print(checkinoutresponse);
  http.Response cicoresponse = await http.post(CICOurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(checkinoutresponse),
  );
  if(cicoresponse.statusCode == 200){
    print(cicoresponse.body);
  }else{
    print(cicoresponse.body);
  }
}
void checkout() async {
  var checkid = checkinoutdata.checkid;
  var checkouttime = checkinoutdata.checkouttime;
  var checkoutlocation = checkinoutdata.checkoutlocation;
  Map checkinoutresponse =
  {
    "id": "$checkid",
    "checkout_time": "$checkouttime",
    "checkout_location": "$checkoutlocation",
  };
  print(checkinoutresponse);
  http.Response cicoresponse = await http.post(CICOurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(checkinoutresponse),
  );
  if(cicoresponse.statusCode == 200){
    print(cicoresponse.body);
    DBRequestdaily();
    DBRequestmonthly();
  }else{
    print(cicoresponse.body);
  }
}


Future leaverequest() async {
  var leavetype = leave.type;
  var startdate = leave.startdate;
  var enddate = leave.enddate;
  var reason = leave.reason;
  var image = leave.image;
  Map leaverequestbody =
  {
    'emp_id': '${DBrequestdata.receivedempid}',
    "leavetype": "$leavetype",
    "leavestartdate": "$startdate",
    "leaveenddate": "$enddate",
    "reason": "$reason",
    "image":"data:image/jpg;base64,$image",
  };
  print(leaverequestbody);
  http.Response leaveresponse = await http.post(leaveurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
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
static var image;
}

class userpassword{
  static var password;
}

Future changepassword() async{
  var newpassword = change.password;
  Map requestchangepassword =
  {
    'emp_id': '${DBrequestdata.receivedempid}',
    "password": "$newpassword"
  };
  http.Response changedpasswordresponse = await http.post(passwordchangeurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
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

