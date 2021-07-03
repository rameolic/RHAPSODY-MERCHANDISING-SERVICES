import 'dart:async';
import 'dart:io';
import 'package:merchandising/api/Journeyplansapi/todayplan/journeyplanapi.dart';
import 'package:merchandising/api/customer_activites_api/add_promotionapi.dart';
import 'package:merchandising/api/customer_activites_api/share_of_shelf_detailsapi.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Promotion%20Check.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/merchandiserdashboard.dart';
import 'package:merchandising/api/avaiablityapi.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/api/customer_activites_api/visibilityapi.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/model/camera.dart';
import 'expiry_report.dart';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'outletdetailes.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/merchandiserdashboard.dart';
import 'package:merchandising/api/api_service.dart';
import '../../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'availabitiy.dart';
import 'shareofshelf.dart';
import 'package:merchandising/api/customer_activites_api/planogramdetailsapi.dart';
import 'PlanogramcheckPhase1.dart';
import 'NPD Check.dart';
import 'CompetitionCheckOne.dart';
import 'package:merchandising/api/FMapi/nbl_detailsapi.dart';
import 'Visibility.dart';
import 'OutletSurvey.dart';
import 'Journeyplan.dart';
import 'package:merchandising/model/Location_service.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/upload_live_pic.dart';
import 'package:merchandising/api/FMapi/outlet brand mappingapi.dart';
import 'package:merchandising/Fieldmanager/ViewPDF.dart';
import 'package:merchandising/model/Location_service.dart';
import 'package:merchandising/api/customer_activites_api/Competitioncheckapi.dart';
import 'package:merchandising/api/customer_activites_api/competition_details.dart';
import 'package:merchandising/api/customer_activites_api/promotion_detailsapi.dart';
import 'package:intl/intl.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Journeyplan.dart';
import 'package:merchandising/api/clientapi/stockexpirydetailes.dart';
import 'package:merchandising/api/customer_activites_api/add_competitionapi.dart';

List<bool> CheckList = [];
List<String> CheckListItems = task.list;

class CustomerActivities extends StatefulWidget {
  @override
  _CustomerActivitiesState createState() => _CustomerActivitiesState();
}

class _CustomerActivitiesState extends State<CustomerActivities> {
  final GlobalKey<_CustomerActivitiesState> _pdfViewerKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  Offset count = Offset(20.0, 20.0);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: ProgressHUD(
        opacity: 0.3,
        color: orange,
        inAsyncCall: isApiCallProcess,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: containerscolor,
            iconTheme: IconThemeData(color: orange),
            title: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Activities',
                      style: TextStyle(color: orange),
                    ),
                    EmpInfo()
                  ],
                ),
                Spacer(),
                IconButton(
                    icon: Icon(
                      CupertinoIcons.refresh_circled_solid,
                      color: orange,
                      size: 30,
                    ),
                    onPressed: () async {
                      setState(() {
                        isApiCallProcess = true;
                      });
                      getNBLdetails();
                      getTaskList();
                      getAvaiablitity();
                      getVisibility();
                      getcompinfo();
                      getPlanogram();
                      Addedstockdataformerch();
                      getShareofshelf();
                      getCompetition();
                      await getPromotionDetails();
                      setState(() {
                        isApiCallProcess = false;
                      });
                    }),
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
                          completedicon:
                              CupertinoIcons.check_mark_circled_solid,
                          iconcolor: avaliabilitycheck ? Colors.green : pink,
                          icon: CupertinoIcons.chart_bar_alt_fill,
                          chartext: 'Availability',
                          tap: () {
                            print(CheckListItems);
                            print(task.list);
                            reasons = [];
                            outofStockitems = [];
                            for (int i = 0;
                                i < Avaiablity.productname.length;
                                i++) {
                              reasons.add('');
                              outofStockitems.add(1);
                            }
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return AvailabilityScreen();
                                },
                              ),
                              //  (Route<dynamic> route) => false,
                            );
                          },
                        ),
                        Activities(
                          completedicon:
                              CupertinoIcons.check_mark_circled_solid,
                          iconcolor: visibilitycheck ? Colors.green : pink,
                          icon: CupertinoIcons.eye_solid,
                          chartext: 'Visibility',
                          tap: () {
                            checkvaluevisibility = [];
                            visibilityreasons = [];
                            for (int i = 0;
                                i < VisibilityData.productname.length;
                                i++) {
                              images.add(File('dummy.txt'));
                              visibilityreasons.add('');
                              checkvaluevisibility.add(1);
                            }
                            print(images.length);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return VisibilityOne();
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
                          completedicon:
                              CupertinoIcons.check_mark_circled_solid,
                          iconcolor: shareofshelfcheck ? Colors.green : pink,
                          icon: Icons.table_chart_sharp,
                          chartext: 'Share of Shelf',
                          tap: () {
                            actualpercent = [];
                            for (int i = 0; i < ShareData.share.length; i++) {
                              actualpercent.add(0.0);
                            }
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
                          completedicon:
                              CupertinoIcons.check_mark_circled_solid,
                          iconcolor: planocheck ? Colors.green : pink,
                          icon: CupertinoIcons.doc_checkmark_fill,
                          chartext: 'Planogram',
                          tap: () {
                            beforeimages = [];
                            afterimages = [];
                            beforeimagesencode = [];
                            afterimagesencode = [];
                            for (int i = 0;
                                i < PlanoDetails.brandname.length;
                                i++) {
                              beforeimages.add(File('dummy.txt'));
                              afterimages.add(File('dummy.txt'));
                              beforeimagesencode.add('dummy.txt');
                              afterimagesencode.add('dummy.txt');
                            }
                            print(beforeimages.length);
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
                          completedicon:
                              CupertinoIcons.check_mark_circled_solid,
                          iconcolor: promocheck ? Colors.green : pink,
                          icon: CupertinoIcons.checkmark_seal_fill,
                          chartext: 'Promotion Check',
                          tap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return PromotionCheck();
                                },
                              ),
                              //(Route<dynamic> route) => false,
                            );
                          },
                        ),
                        Activities(
                          completedicon:
                              CupertinoIcons.check_mark_circled_solid,
                          iconcolor: compcheck ? Colors.green : pink,
                          chartext: 'Compitetor info Capture',
                          icon: CupertinoIcons.info_circle_fill,
                          tap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return CompetitionCheckOne();
                                },
                              ),
                              //  (Route<dynamic> route) => false,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Activities(
                          completedicon:
                              CupertinoIcons.check_mark_circled_solid,
                          iconcolor: expirycheck ? Colors.green : pink,
                          icon: CupertinoIcons.calendar_badge_minus,
                          chartext: 'Products Expiry Info',
                          tap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ExpiryReport();
                                },
                              ),
                              //(Route<dynamic> route) => false,
                            );
                          },
                        ),
                        Activities(
                          completedicon:
                              CupertinoIcons.check_mark_circled_solid,
                          iconcolor: checklist ? Colors.green : pink,
                          icon: CupertinoIcons.text_badge_checkmark,
                          chartext: 'CheckList',
                          tap: () {
                            print(task.list.length);
                            if (0 == 0) {
                              setState(() {
                                changecheckoutcolor = false;
                              });
                              CheckList = [];
                              imagescl = [];
                              encodeimagecl = [];

                              for (int i = 0; i < task.list.length; i++) {
                                CheckList.add(false);
                                imagescl.add(File('dummy.txt'));
                                encodeimagecl.add('dummy.txt');
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          UploadLivePhoto()));
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              NBlFloatingButton(),
              // SafeArea(
              //   child: Align(
              //     alignment: Alignment.bottomRight,
              //     child: GestureDetector(
              //       onTap: ()async{
              //         checkin();
              //         var breakends = DateTime.now();
              //         print(breakends);
              //         splitbreak.citime=checkinoutdata.checkintime;
              //         splitbreak.cotime=DateFormat('HH:mm:ss').format(breakends);
              //         splitbreak.type="Break";
              //         splitbreak.jtimeid="";
              //         // splitbreak.jtimeid=jtimeidco;
              //         setState(() {
              //           isApiCallProcess=true;
              //         });
              //
              //         await merchbreak();
              //
              //         setState(() {
              //           isApiCallProcess=false;
              //         });
              //
              //
              //
              //
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (BuildContext context) =>
              //                     BreakTime(
              //                     )));
              //       },
              //       child: Container(
              //           decoration: BoxDecoration(color: pink,
              //               borderRadius: BorderRadius.circular(10.0)),
              //           margin: EdgeInsets.all(10.0),
              //           padding: EdgeInsets.all(10.0),
              //           child: Text("BREAK",style: TextStyle(color: Colors.black),)),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class BreakTime extends StatefulWidget {
  @override
  _BreakTimeState createState() => _BreakTimeState();
}

class _BreakTimeState extends State<BreakTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGround(),
          ProgressHUD(
              inAsyncCall: isApiCallProcess,
              opacity: 0.3,
              child: AlertDialog(
                backgroundColor: alertboxcolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                content: Builder(
                  builder: (context) {
                    // Get available height and width of the build area of this widget. Make a choice depending on the size.
                    return Container(
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Break Time",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                                "Once you have finished your Break Time\n Tap on Continue to start your Work"),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    checkin();
                                    var breakends = DateTime.now();
                                    print(breakends);
                                    splitbreak.citime =
                                        checkinoutdata.checkintime;
                                    splitbreak.cotime = DateFormat('HH:mm:ss')
                                        .format(breakends);
                                    splitbreak.type = "Break";
                                    splitbreak.jtimeid = "";
                                    // splitbreak.jtimeid=jtimeidco;
                                    setState(() {
                                      isApiCallProcess = true;
                                    });
                                    await merchbreak();
                                    setState(() {
                                      isApiCallProcess = false;
                                    });
                                    Navigator.pop(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                CustomerActivities()));
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: orange,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        "Continue Work",
                                        style: TextStyle(color: pink),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}

bool iseverythingchecked = false;
bool changecheckoutcolor = false;

class Activities extends StatelessWidget {
  Activities(
      {this.icon, this.chartext, this.tap, this.completedicon, this.iconcolor});
  final icon;
  final chartext;
  final tap;
  final completedicon;
  final iconcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.15,
        margin: EdgeInsets.only(left: 5, bottom: 10, right: 5),
        padding: EdgeInsets.all(10.0),
        decoration:
            BoxDecoration(color: pink, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(completedicon, color: iconcolor, size: 20.0),
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(icon, size: 50.0, color: Color(0xff424B4D)),
                    Text(
                      chartext,
                      style: TextStyle(fontSize: 13),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}

bool isApiCallProcess = false;

bool Availability = false;

bool Visibility = false;

bool ShareofShelf = false;

bool Planogram = false;

bool compitetorcheck = false;
bool promotion = false;
bool expiryinfo = false;
bool checklist = false;

class checkoutbutton extends StatefulWidget {
  @override
  _checkoutbuttonState createState() => _checkoutbuttonState();
}

class _checkoutbuttonState extends State<checkoutbutton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print("printed");

        showDialog(
            context: context,
            builder: (_) => StatefulBuilder(builder: (context, setState) {
                  return ProgressHUD(
                    inAsyncCall: isApiCallProcess,
                    opacity: 0.3,
                    child: AlertDialog(
                      backgroundColor: alertboxcolor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      content: Builder(
                        builder: (context) {
                          // Get available height and width of the build area of this widget. Make a choice depending on the size.
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Outlet Survey',
                                style: TextStyle(color: orange, fontSize: 20),
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 0.8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Availability == false
                                        ? Availability = true
                                        : Availability = false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Availability',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Availability == true
                                              ? CupertinoIcons
                                                  .check_mark_circled_solid
                                              : CupertinoIcons
                                                  .xmark_circle_fill,
                                          color: Availability == true
                                              ? orange
                                              : Colors.grey,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Visibility == false
                                        ? Visibility = true
                                        : Visibility = false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Visibility',
                                            style: TextStyle(fontSize: 16)),
                                        Spacer(),
                                        Icon(
                                            Visibility == true
                                                ? CupertinoIcons
                                                    .check_mark_circled_solid
                                                : CupertinoIcons
                                                    .xmark_circle_fill,
                                            color: Visibility == true
                                                ? orange
                                                : Colors.grey,
                                            size: 30),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    ShareofShelf == false
                                        ? ShareofShelf = true
                                        : ShareofShelf = false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Share of Shelf',
                                            style: TextStyle(fontSize: 16)),
                                        Spacer(),
                                        Icon(
                                            ShareofShelf == true
                                                ? CupertinoIcons
                                                    .check_mark_circled_solid
                                                : CupertinoIcons
                                                    .xmark_circle_fill,
                                            color: ShareofShelf == true
                                                ? orange
                                                : Colors.grey,
                                            size: 30),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Planogram == false
                                        ? Planogram = true
                                        : Planogram = false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Planogram',
                                            style: TextStyle(fontSize: 16)),
                                        Spacer(),
                                        Icon(
                                            Planogram == true
                                                ? CupertinoIcons
                                                    .check_mark_circled_solid
                                                : CupertinoIcons
                                                    .xmark_circle_fill,
                                            color: Planogram == true
                                                ? orange
                                                : Colors.grey,
                                            size: 30),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    compitetorcheck == false
                                        ? compitetorcheck = true
                                        : compitetorcheck = false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Compitetor Info Capture',
                                            style: TextStyle(fontSize: 16)),
                                        Spacer(),
                                        Icon(
                                            compitetorcheck == true
                                                ? CupertinoIcons
                                                    .check_mark_circled_solid
                                                : CupertinoIcons
                                                    .xmark_circle_fill,
                                            color: compitetorcheck == true
                                                ? orange
                                                : Colors.grey,
                                            size: 30),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    expiryinfo == false
                                        ? expiryinfo = true
                                        : expiryinfo = false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Expiry Info',
                                            style: TextStyle(fontSize: 16)),
                                        Spacer(),
                                        Icon(
                                            expiryinfo == true
                                                ? CupertinoIcons
                                                    .check_mark_circled_solid
                                                : CupertinoIcons
                                                    .xmark_circle_fill,
                                            color: expiryinfo == true
                                                ? orange
                                                : Colors.grey,
                                            size: 30),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      Availability == true
                                          ? OutletSurveySubmit.availability = 1
                                          : OutletSurveySubmit.availability = 0;
                                      Visibility == true
                                          ? OutletSurveySubmit.visibility = 1
                                          : OutletSurveySubmit.visibility = 0;
                                      ShareofShelf == true
                                          ? OutletSurveySubmit.sos = 1
                                          : OutletSurveySubmit.sos = 0;
                                      Planogram == true
                                          ? OutletSurveySubmit.planogram = 1
                                          : OutletSurveySubmit.planogram = 0;
                                      compitetorcheck == true
                                          ? OutletSurveySubmit.competitor = 1
                                          : OutletSurveySubmit.competitor = 0;
                                      promotion == true
                                          ? OutletSurveySubmit.promotioncheck =
                                              1
                                          : OutletSurveySubmit.promotioncheck =
                                              0;
                                      expiryinfo == true
                                          ? OutletSurveySubmit.stockexpiry = 1
                                          : OutletSurveySubmit.stockexpiry = 0;

                                      if (journeydone[ssi] == "done") {
                                        print("entered if");
                                        getTotalJnyTime();
                                        var timeofsci = DateTime.now();
                                        splitbreak.type = "Split Shift";
                                        currenttimesheetid = spltsidco;
                                        splitbreak.citime = "";
                                        splitbreak.cotime =
                                            DateFormat('HH:mm:ss')
                                                .format(timeofsci);
                                        splitbreak.jtimeid =
                                            TotalJnyTime.id[selectJTID];

                                        print(splitbreak.jtimeid);

                                        setState(() {
                                          isApiCallProcess = true;
                                        });
                                        await merchbreak();
                                        await getTotalJnyTime();
                                        setState(() {
                                          isApiCallProcess = false;
                                        });

                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        JourneyPlan()));
                                      } else {
                                        print("entered else");

                                        SubmitCheckout();
                                        sendtaskresponse();
                                        workingid != null
                                            ? workingid = null
                                            : workingid = workingid;
                                        checkedoutlet.checkoutlet = true;
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        JourneyPlan()));
                                      }
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: orange,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                          child: Text('ok',
                                              style: TextStyle(
                                                  color: Colors.white))),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  CustomerActivities()));
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                          child: Text('Cancel',
                                              style: TextStyle(
                                                  color: Colors.white))),
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
                }));
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
