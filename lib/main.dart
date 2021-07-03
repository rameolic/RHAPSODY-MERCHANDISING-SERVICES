import 'package:merchandising/api/FMapi/nbl_detailsapi.dart';
import 'api/HRapi/empdetailsforreportapi.dart';
import 'package:merchandising/api/empdetailsapi.dart';
import 'api/FMapi/outlet brand mappingapi.dart';
import 'model/database.dart';
import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'login_page.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/merchandiserdashboard.dart';
import 'dart:async';
import 'model/rememberme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/FMapi/relieverdet_api.dart';
import 'api/api_service.dart';
import 'package:merchandising/HR/HRdashboard.dart';
import 'model/Location_service.dart';
import 'api/HRapi/hrdashboardapi.dart';
import 'package:merchandising/Fieldmanager/FMdashboard.dart';
import 'api/FMapi/fmdbapi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/api/FMapi/fmdbapi.dart';
import 'package:merchandising/api/FMapi/storedetailsapi.dart';
import 'package:merchandising/api/FMapi/outletapi.dart';
import 'package:merchandising/api/FMapi/merchnamelistapi.dart';
import 'package:merchandising/api/myattendanceapi.dart';
import 'package:merchandising/api/FMapi/week_off_detailsapi.dart';
import 'package:merchandising/api/FMapi/brand_detailsapi.dart';
import 'package:merchandising/api/FMapi/category_detailsapi.dart';
import 'package:merchandising/api/FMapi/add_brandapi.dart';
import 'package:merchandising/api/FMapi/product_detailsapi.dart';
import'package:merchandising/api/clientapi/outletreport.dart';
import 'clients/client_dashboard.dart';
import'package:merchandising/api/HRapi/empdetailsapi.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FlutterDownloader.initialize(
  //     debug: true // optional: set false to disable printing logs to console
  // );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('useremail');
  var password = prefs.getString('userpassword');
  remembereddata.email = email;
  remembereddata.password = password;
  if(email != null && password != null) {
    fromloginscreen = true;
    int userroleid = await loginapi();
    currentuser.roleid = userroleid;
    print(userroleid);
    if(userroleid == 6){
       DBRequestmonthly();
       await DBRequestdaily();
       getaddedexpiryproducts();
      getempdetails();
      getallempdetails();
      getempdetailsforreport();
      getstockexpiryproducts();
      await getLocation();
      await callfrequently();
       const period = const Duration(seconds: 60);
       Timer.periodic(period, (Timer t) => getLocation());
       const time = const Duration(seconds: 120);
       Timer.periodic(time, (Timer t) => callfrequently());
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
      getempdetails();
      getWeekoffdetails();
      getBrandDetails();
      getemployeestoaddbrand();
      getCategoryDetails();
      getProductDetails();
      getmyattandance();
      getmerchnamelist();
      getFMdb();
      getStoreDetails();
      getmappedoutlets();
      getallempdetails();
      getRelieverDetails();
      OutletsForClient();
      await getFMoutletdetails();


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
    else if (userroleid == 7){
      await OutletsForClient();
      await getallempdetails();
      await getmerchnamelist();
      runApp(MaterialApp(
          title: 'Rhapsody merchandising solutions',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: Colors.white,
            accentColor: orange,),
          home: ClientDB()
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
