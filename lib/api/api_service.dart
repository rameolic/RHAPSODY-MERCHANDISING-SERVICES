import 'package:http/http.dart' as http;
import 'package:merchandising/pages/home.dart';
import 'dart:convert';
import 'package:merchandising/pages/login_page.dart';
import '../model/requestandresponsemodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:merchandising/model/Location_service.dart';

var emailid = loginrequestdata.inputemail;
var password = loginrequestdata.inputpassword;

String DBurl = "https://rms.rhapsody.ae/api/dashboard";
String JPurl = "https://rms.rhapsody.ae/api/today_planned_journey";

Future<void> getDashBoardData() async {
  String url = "https://rms.rhapsody.ae/api/login";
  Map loginData = {
    'email': '$emailid',
    'password': '$password',
  };
  http.Response response = await http.post(url, body: loginData);
  print(loginData);
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
  else if (response.statusCode == 422) {
    print("error");
  }
}

class loginrequestdata {
  static var inputemail;
  static var inputpassword;
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
Map ODrequestData = {
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

void getJourneyPlan() async {
  http.Response JPresponse = await http.post(JPurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(DBrequestData),
  );
  if (JPresponse.statusCode == 200){
    String JPdata = JPresponse.body;
    var decodeJPData = jsonDecode(JPdata);
    JPResponsedata.outletiddata = decodeJPData['data'][0]['outlet']['outlet_id'];
    JPResponsedata.outletnamedata = decodeJPData['data'][0]['outlet']['outlet_name'];
    JPResponsedata.latitudedata = decodeJPData['data'][0]['outlet']['outlet_lat'];
    JPResponsedata.longitudedata = decodeJPData['data'][0]['outlet']['outlet_long'];
    JPResponsedata.outletareadata = decodeJPData['data'][0]['outlet']['outlet_area'];
    JPResponsedata.outletcountrydata = decodeJPData['data'][0]['outlet']['outlet_country'];
    JPResponsedata.outletcitydata = decodeJPData['data'][0]['outlet']['outlet_city'];



    print(JPResponsedata.outletiddata);
  }
  if(JPresponse.statusCode != 200){
    print(JPresponse.statusCode);

  }
}
class JPResponsedata {
  static var outletiddata;
  static var outletnamedata;
  static var contactnumberdata;
  static var latitudedata;
  static var longitudedata;
  static var outletareadata;
  static var outletcountrydata;
  static var outletcitydata;
  static var outlet1distance;
}
void getOutletData() async {
  http.Response ODresponse = await http.post(JPurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(ODrequestData),
  );
  if (ODresponse.statusCode == 200){
    String ODdata = ODresponse.body;
    var decodeODData = jsonDecode(ODdata);
    print(decodeODData);
  }
  if(ODresponse.statusCode != 200){
    print(ODresponse.statusCode);

  }
}

/*
class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "https://rms.rhapsody.ae/api/login";

    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200)  {
      print('Response status code 200');
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );

    }else if(response.statusCode == 422) {
      print('Response status code 422');
      print(response.body);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}

class APIDashBoard {
  APIDashBoard({this.tokendata});
  String tokendata;
  Future<DashBoardResponseModel> dashboard(DashBoardRequestModel requestModel) async {
    String url = "https://rms.rhapsody.ae/api/dashboard";
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokendata',
        },
        body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 401) {
      print(response.body);

     /* return DashBoardResponseModel.fromJson(
        json.decode(response.body),
      );*/
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
*/
