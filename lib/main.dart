
import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'pages/login_page.dart';
import 'dart:async';
import 'package:merchandising/api/jpskippedapi.dart';
import 'package:merchandising/api/journeyplanapi.dart';
import 'package:merchandising/api/JPvisitedapi.dart';
import 'model/rememberme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:merchandising/pages/home.dart';
import 'api/api_service.dart';

recallapi(){
  getJourneyPlan();
  getskippedJourneyPlan();
  getvisitedJourneyPlan();
}

Future<void> main() async {
  const seconds = const Duration(seconds: 900);
  Timer.periodic(seconds, (Timer t) => recallapi());
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('useremail');
  var password = prefs.getString('userpassword');
  remembereddata.email = email;
  remembereddata.password = password;
  if(email != null) {
    int statuscode = await getDashBoardData();
    if(statuscode == 200){
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

