import 'package:http/http.dart' as http;
import 'package:merchandising/model/Location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'jpapi.dart';



String DBurl = "https://rms.rhapsody.ae/api/dashboard";
String JPurl = "https://rms.rhapsody.ae/api/today_planned_journey";
String OCurl = "https://rms.rhapsody.ae/api/outlet_details";

Future<void> getDashBoardData() async {
  String url = "https://rms.rhapsody.ae/api/login";
  var emailid = loginrequestdata.inputemail;
  var password = loginrequestdata.inputpassword;
  Map loginData = {
    'email': '$emailid',
    'password': '$password',
  };
  http.Response response = await http.post(url, body: loginData);
  if (response.statusCode == 200) {
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
  'emp_id': '$Empid',
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
  static var monthPlanpercentage;
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
