import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'outletdetailes.dart';
import '../../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'availabitiy.dart';
import 'shareofshelf.dart';
import 'PlanogramcheckPhase1.dart';
import 'NPD Check.dart';
import 'CompetitionCheckOne.dart';
import 'Visibility.dart';
import 'OutletSurvey.dart';
import 'Journeyplan.dart';
import 'package:merchandising/model/Location_service.dart';


class CustomerActivities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child:Scaffold(
        appBar: AppBar(
          backgroundColor: containerscolor,
          iconTheme: IconThemeData(color: orange),
          title: Row(
            children: [
              Text(
                'Customer Activities',
                style: TextStyle(color: orange),
              ),
              Spacer(),
              checkoutbutton(),
            ],
          ),
        ),
        drawer: Drawer(
          child: Menu(),
        ),
        body: Stack(
          children: [
            BackGround(),
            SingleChildScrollView(
              child: Column(
                children: [
                  OutletDetails(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Activities(
                        icon: CupertinoIcons.chart_bar_alt_fill,
                        chartext: 'Availability',
                        tap: (){
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) {
                                return Availability();
                              },
                            ),
                                (Route<dynamic> route) => false,
                          );

                          },
                      ),
                      Activities(
                        icon: CupertinoIcons.eye_solid,
                        chartext: 'Visibility',
                        tap: (){
                          for(int i =0; i<listitems.length;i++){
                            images.add( File('dummy.txt'));
                          }
                          print(images.length);
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) {
                                return VisibilityOne();
                              },
                            ),
                                (Route<dynamic> route) => false,
                          );
                         /* Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  VisibilityOne(),));*/
                                  },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Activities(
                        icon: Icons.table_chart_sharp,
                        chartext: 'Share of Shelf',
                        tap: (){
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) {
                                return ShareShelf();
                              },
                            ),
                                (Route<dynamic> route) => false,
                          );
                          },

                      ),
                      Activities(
                        icon: Icons.table_rows,
                        chartext: 'Share of Assortment',
                        tap: (){},
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Activities(
                        icon: CupertinoIcons.checkmark_seal_fill,
                        chartext: 'Promotion Check',
                        tap: (){},
                      ),
                      Activities(
                        icon: CupertinoIcons.doc_checkmark_fill,
                        chartext: 'Planogram Check',
                        tap:(){
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) {
                                return PlanogramCheckPhase1();
                              },
                            ),
                                (Route<dynamic> route) => false,
                          );
                          },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Activities(
                        icon: CupertinoIcons.info_circle_fill,
                        chartext: 'Compitetor info Capture',
                        tap: (){
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) {
                                return CompetitionCheckOne();
                              },
                            ),
                                (Route<dynamic> route) => false,
                          );
                         },
                      ),
                      Activities(
                        icon: Icons.center_focus_strong_rounded,
                        chartext: 'Focus/NPD Check',
                        tap: (){
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) {
                                return FocusNPDCheck();
                              },
                            ),
                                (Route<dynamic> route) => false,
                          );
                          },

                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Activities(
                        icon: Icons.delivery_dining,
                        chartext: 'Delivery',
                        tap: (){},
                      ),
                      Activities(
                        icon: CupertinoIcons.list_bullet_below_rectangle,
                        chartext: 'Outlet Survey',
                        tap: (){
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) {
                                return OutletSurveySubmit();
                              },
                            ),
                                (Route<dynamic> route) => false,
                          );
                          },

                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Activities extends StatelessWidget {
  Activities({this.icon,this.chartext,this.tap});
  final icon;
  final chartext;
  final tap;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: tap,
      child: Container(
        width: MediaQuery.of(context).size.width/2.15,
        margin: EdgeInsets.only(left: 5,bottom: 10,right: 5),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(color: pink,borderRadius:BorderRadius.circular(10)),
        child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              Icon(icon, size:50.0, color: Color(0xff424B4D)),
              Text(chartext,style: TextStyle(fontSize: 13),),
            ]
        ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class checkoutbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        SubmitCheckout();
        checkedoutlet.checkoutlet = true;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    JourneyPlan()));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.00),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xffFFDBC1),
          borderRadius: BorderRadius.circular(10.00),
        ),
        child: Text(
          'Check out',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}