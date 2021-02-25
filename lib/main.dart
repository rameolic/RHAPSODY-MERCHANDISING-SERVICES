
import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'pages/login_page.dart';
import 'dart:async';
import 'package:merchandising/api/jpskippedapi.dart';
import 'package:merchandising/api/journeyplanapi.dart';
import 'package:merchandising/api/JPvisitedapi.dart';

void main() {
  const seconds = const Duration(seconds: 900);
  Timer.periodic(seconds, (Timer t) => recallapi());
  runApp(MyApp());
}
recallapi(){
  getJourneyPlan();
  getskippedJourneyPlan();
  getvisitedJourneyPlan();
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rhapsody merchandising solutions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        accentColor: orange,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22.0, color: orange),
          headline2: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: orange,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.blueAccent,
          ),
        ),
      ),
      home: SplashScreen()
        //DashBoard(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            BackGround(),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80,),
                    Hero(
                      tag: 'logo',
                      child: Image(
                        width: MediaQuery.of(context).size.width/1.3,
                        image: AssetImage('images/rmsLogo.png'),
                      ),
                    ),
                    SizedBox(height: 40,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContextcontext) =>
                            //DashBoard()
                           LoginPage()
                        ));
                      },
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.all(15.0),
                        margin: EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          color: pink,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 16, color: orange),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

