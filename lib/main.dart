
import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'login_page.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/merchandiserdashboard.dart';
import 'dart:async';
import 'package:merchandising/api/Journeyplansapi/todayplan/journeyplanapi.dart';
import 'package:merchandising/api/Journeyplansapi/todayplan/JPvisitedapi.dart';
import 'package:merchandising/api/Journeyplansapi/todayplan/jpskippedapi.dart';
import 'model/rememberme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/api_service.dart';
import 'package:merchandising/HR/HRdashboard.dart';
import 'model/Location_service.dart';
import 'api/HRapi/hrdashboardapi.dart';
import 'package:merchandising/Fieldmanager/FMdashboard.dart';

recallapi(){
  getJourneyPlan();
  getskippedJourneyPlan();
  getvisitedJourneyPlan();
}

Future<void> main() async {
  const seconds = const Duration(seconds: 900);
  Timer.periodic(seconds, (Timer t) => recallapi());
  const period = const Duration(seconds: 60);
  Timer.periodic(period, (Timer t) => getLocation());
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('useremail');
  var password = prefs.getString('userpassword');
  remembereddata.email = email;
  remembereddata.password = password;
  if(email != null && password != null) {
    int userroleid = await loginapi();
    currentuser.roleid = userroleid;
    print(userroleid);
    if(userroleid == 6){
      await DBRequestmonthly();
      await DBRequestdaily();
      runApp(MaterialApp(
          title: 'Rhapsody merchandising solutions',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Colors.white,
            accentColor: orange,),
          home:  DashBoard()
      ));
    }else if(userroleid == 3){
      await HRdb();
      runApp(MaterialApp(
          title: 'Rhapsody merchandising solutions',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Colors.white,
            accentColor: orange,),
          home: HRdashboard()
      ));
    }else if(userroleid == 5){
      runApp(MaterialApp(
          title: 'Rhapsody merchandising solutions',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Colors.white,
            accentColor: orange,),
          home: FieldManagerDashBoard()
      ));
    }else{
      runApp(MaterialApp(
          title: 'Rhapsody merchandising solutions',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Colors.white,
            accentColor: orange,),
          home: LoginPage()
      ));
    }
  } else{
    runApp(MaterialApp(
        title: 'Rhapsody merchandising solutions',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          accentColor: orange,),
        home: LoginPage()
    ));
  }
}

class currentuser{
  static int roleid;
}

class remaining{
  static int leaves;
}
