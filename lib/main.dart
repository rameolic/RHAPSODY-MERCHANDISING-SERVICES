
import 'package:merchandising/api/empdetailsapi.dart';

import 'model/database.dart';
import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'login_page.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/merchandiserdashboard.dart';
import 'dart:async';
import 'model/rememberme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/api_service.dart';
import 'package:merchandising/HR/HRdashboard.dart';
import 'model/Location_service.dart';
import 'api/HRapi/hrdashboardapi.dart';
import 'package:merchandising/Fieldmanager/FMdashboard.dart';
import 'api/FMapi/fmdbapi.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      const period = const Duration(seconds: 60);
      Timer.periodic(period, (Timer t) => getLocation());
      const time = const Duration(seconds: 120);
      Timer.periodic(time, (Timer t) => callfrequently());
      await DBRequestmonthly();
      await DBRequestdaily();
      await getLocation();
      await callfrequently();
       getempdetails();
      getstockexpiryproducts();
      runApp(MaterialApp(
          title: 'Rhapsody merchandising solutions',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Colors.white,
            accentColor: orange,),
          home:  DashBoard()
      ));
    }
    else if(userroleid == 3){
      await HRdb();
      await getempdetails();
      runApp(MaterialApp(
          title: 'Rhapsody merchandising solutions',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Colors.white,
            accentColor: orange,),
          home: HRdashboard()
      ));
    }
    else if(userroleid == 5){
      await getFMdb();
      await getempdetails();
      runApp(MaterialApp(
          title: 'Rhapsody merchandising solutions',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Colors.white,
            accentColor: orange,),
          home: FieldManagerDashBoard()
      ));
    }
    else{
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
  else{
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
  static var leaves;
}
