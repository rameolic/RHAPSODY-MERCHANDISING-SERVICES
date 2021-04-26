import 'dart:async';
import 'dart:io';
import 'package:merchandising/Merchandiser/merchandiserscreens/Promotion%20Check.dart';
import 'package:merchandising/api/avaiablityapi.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/api/customer_activites_api/visibilityapi.dart';
import 'expiry_report.dart';
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
import 'merchandiserdashboard.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.menu),
                  SizedBox(width: 25,),
                  Text(
                    'Activities',
                    style: TextStyle(color: orange),
                  ),
                ],
              ),
              checkoutbutton(),
            ],
          ),
        ),
        // drawer: Drawer(
        //   child: Menu(),
        //),
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
                          reasons=[];
                          outofStockitems=[];
                          for(int i =0; i<Avaiablity.productname.length;i++){
                            reasons.add('');
                            outofStockitems.add('1');
                          }
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
                          visibilityreasons=[];
                          checkvaluevisibility=[];
                          for(int i =0; i<VisibilityData.productname.length;i++){
                            images.add( File('dummy.txt'));
                            visibilityreasons.add('\"\"');
                            checkvaluevisibility.add(1);
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ShareShelf();
                              },
                            ),
                               // (Route<dynamic> route) => false,
                          );
                          },

                      ),
                      Activities(
                        icon: CupertinoIcons.doc_checkmark_fill,
                        chartext: 'Planogram',
                        tap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PlanogramCheckPhase1();
                              },
                            ),
                               // (Route<dynamic> route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Activities(
                        icon: CupertinoIcons.checkmark_seal_fill,
                        chartext: 'Promotion Check',
                        tap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PromotionCheck();
                              },
                            ),
                            //   (Route<dynamic> route) => false,
                          );
                        },
                      ),
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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Activities(
                        icon: CupertinoIcons.calendar_badge_minus,
                        chartext: 'Products Expiry Info',
                        tap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ExpiryReport();
                              },
                            ),
                            //   (Route<dynamic> route) => false,
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
  bool isApiCallProcess = false;
  bool Availability = false;
  bool Visibility = false;
  bool ShareofShelf = false;
  bool Planogram = false;
  bool compitetorcheck = false;
  bool expiryinfo = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        showDialog(
            context: context,
            builder: (_) => StatefulBuilder(
                builder: (context, setState) {
                  return ProgressHUD(
                    inAsyncCall: isApiCallProcess,
                    opacity: 0.3,
                    child: AlertDialog(
                      backgroundColor: alertboxcolor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(
                              Radius.circular(10.0))),
                      content: Builder(
                        builder: (context) {
                          // Get available height and width of the build area of this widget. Make a choice depending on the size.
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Outlet Survey',style: TextStyle(color: orange,fontSize: 20),),
                              Divider(color: Colors.black,thickness: 0.8,),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Availability == false ? Availability = true : Availability = false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Availability',style: TextStyle(fontSize: 16),),
                                        Spacer(),
                                        Icon(
                                          Availability == true ? CupertinoIcons.check_mark_circled_solid :CupertinoIcons.xmark_circle_fill,
                                          color: Availability == true ? orange : Colors.grey,size:30 , ),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Visibility == false ? Visibility = true : Visibility = false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Visibility',style: TextStyle(fontSize: 16)),
                                        Spacer(),
                                        Icon(
                                            Visibility == true ? CupertinoIcons.check_mark_circled_solid :CupertinoIcons.xmark_circle_fill,
                                            color: Visibility == true ? orange : Colors.grey ,size:30 ),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    ShareofShelf == false ? ShareofShelf = true : ShareofShelf = false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Share of Shelf',style: TextStyle(fontSize: 16)),
                                        Spacer(),
                                        Icon(
                                            ShareofShelf == true ? CupertinoIcons.check_mark_circled_solid :CupertinoIcons.xmark_circle_fill,
                                            color: ShareofShelf == true ? orange : Colors.grey ,size:30 ),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Planogram == false ? Planogram = true : Planogram = false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Planogram',style: TextStyle(fontSize: 16)),
                                        Spacer(),
                                        Icon(
                                            Planogram == true ? CupertinoIcons.check_mark_circled_solid :CupertinoIcons.xmark_circle_fill,
                                            color: Planogram == true ? orange : Colors.grey,size:30  ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    compitetorcheck == false ? compitetorcheck = true : compitetorcheck = false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Compitetor Info Capture',style: TextStyle(fontSize: 16)),
                                        Spacer(),
                                        Icon(
                                            compitetorcheck == true ? CupertinoIcons.check_mark_circled_solid :CupertinoIcons.xmark_circle_fill,
                                            color: compitetorcheck == true ? orange : Colors.grey ,size:30 ),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    expiryinfo == false ? expiryinfo = true : expiryinfo = false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Expiry Info',style: TextStyle(fontSize: 16)),
                                        Spacer(),
                                        Icon(
                                            expiryinfo == true ? CupertinoIcons.check_mark_circled_solid :CupertinoIcons.xmark_circle_fill,
                                            color: expiryinfo == true ? orange : Colors.grey ,size:30 ),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if(Availability && Visibility && ShareofShelf && Planogram && compitetorcheck && expiryinfo){
                                        SubmitCheckout();
                                        checkedoutlet.checkoutlet = true;
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                    DashBoard()));
                                      }
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: orange,borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(child: Text('ok',style: TextStyle(color: Colors.white))),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pop(context, MaterialPageRoute(builder: (BuildContext context) => CustomerActivities()));},
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(child: Text('Cancel',style: TextStyle(color: Colors.white))),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                })
        );

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
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
    );
  }
}