import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:merchandising/Fieldmanager/products.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:flutter/cupertino.dart';
import 'Outlets.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/model/leaveresponse.dart';
import 'package:merchandising/Fieldmanager/Store Details.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Leave Request.dart';
import 'package:merchandising/api/FMapi/fmdbapi.dart';
import 'package:merchandising/Fieldmanager/addjp.dart';
import 'package:merchandising/api/FMapi/storedetailsapi.dart';
import 'package:merchandising/api/FMapi/outletapi.dart';
import 'package:merchandising/api/leavestakenapi.dart';
import 'merchandiserslist.dart';
import 'package:merchandising/api/FMapi/merchnamelistapi.dart';
import 'package:merchandising/api/FMapi/merc_leave_details.dart';
import 'chatusers.dart';
import 'package:merchandising/api/myattendanceapi.dart';
import 'package:merchandising/model/myattendance.dart';
import 'package:merchandising/api/FMapi/add_brandapi.dart';
import 'package:merchandising/api/FMapi/brand_detailsapi.dart';
import 'package:merchandising/api/FMapi/category_detailsapi.dart';
import 'package:merchandising/api/FMapi/product_detailsapi.dart';


class FieldManagerDashBoard extends StatefulWidget {
  @override
  _FieldManagerDashBoardState createState() => _FieldManagerDashBoardState();
}

class _FieldManagerDashBoardState extends State<FieldManagerDashBoard> {
  bool isApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: ProgressHUD(
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: pink,
              iconTheme: IconThemeData(color: orange),
              title: Image(
              height: 30,
              image: AssetImage('images/rmsLogo.png'),
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
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        height: 181,
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: containerscolor,
                        ),
                        child: Column(
                          children: [
                            Text("Performance Indicator", style: TextStyle(
                                fontSize: 16),),
                            SizedBox(height: 10,),
                            Table(
                              border: TableBorder.symmetric(
                                inside: BorderSide(color: Colors.grey),
                              ),
                              columnWidths: {
                                0: FractionColumnWidth(.35),
                              },
                              children: [
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 14.0),
                                      child: Center(
                                        child: Text(
                                          "Merchandisers",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Text(
                                            FMdashboarddata.merchtotal.toString(), style: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Total",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Text(FMdashboarddata.merchpresent.toString(), style: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Present",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Text(
                                            FMdashboarddata.merchabsent.toString(), style: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Absent",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 14.0),
                                      child: Center(
                                        child: Text(
                                          "Total Outlets",
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Text(
                                            FMdashboarddata.mtotaloutlets.toString(), style: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Total",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Text(
                                            FMdashboarddata.mcompoutlets.toString(), style: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Completed",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Text(
                                            FMdashboarddata.mpendingoutlets.toString(), style: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Pending",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 14.0),
                                      child: Center(
                                        child: Text(
                                          "Today Outlets",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Text(
                                            FMdashboarddata.totaloulets.toString(), style: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Total",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Text(
                                            FMdashboarddata.compoutlets.toString(), style: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Completed",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Text(
                                            FMdashboarddata.pendingoutlets.toString(), style: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Pending",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap:()async{
                              setState((){
                                isApiCallProcess = true;
                              });
                              await getStoreDetails();
                              setState((){
                                isApiCallProcess = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          StoreDetails()));
                            },
                            child: Container(
                              height: 120,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 3.2,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: containerscolor,
                              ),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.shopping_cart,
                                        size: 35,
                                        color: iconscolor,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Stores',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15,),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap:() async{
                              setState(() {
                                isApiCallProcess = true;
                              });
                              await getFMoutletdetails();
                              setState(() {
                                isApiCallProcess = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Oulets()));
                            },
                            child: Container(
                              height: 120,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 3.2,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: containerscolor,
                              ),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.building_2_fill,
                                        size: 35,
                                        color: iconscolor,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Outlets',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()async{
                              setState(() {
                                isApiCallProcess = true;
                              });
                              await getmerchnamelist();
                              await getFMoutletdetails();
                              setState(() {
                                isApiCallProcess = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AddJourneyPlan()));
                            },
                            child: Container(
                              height: 120,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 3.2,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: containerscolor,
                              ),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.bus,
                                        size: 35,
                                        color: iconscolor,
                                      ),

                                      SizedBox(height: 10),
                                      Text(
                                        'Journey Plan',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap:()async{
                              setState(() {
                                isApiCallProcess = true;
                              });
                              await getmerchnamelist();
                              setState(() {
                                isApiCallProcess = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MerchandisersList()));
                            },
                            child: Container(
                              height: 120,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 3.2,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: containerscolor,
                              ),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_chart,
                                        size: 35,
                                        color: iconscolor,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Time Sheet',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15,),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()async{
                              setState(() {
                                isApiCallProcess = true;
                              });
                              await getBrandDetails();
                              await getemployeestoaddbrand();
                              await getCategoryDetails();
                              await getProductDetails();
                              await getFMoutletdetails();

                              setState(() {
                                isApiCallProcess = false;
                              });
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (BuildContext context) => Products()));
                            },
                            child: Container(
                              height: 120,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 3.2,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: containerscolor,
                              ),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.barcode,
                                        size: 35,
                                        color: iconscolor,
                                      ),

                                      SizedBox(height: 10),
                                      Text(
                                        'Products',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap:()async{
                              setState(() {
                                isApiCallProcess = true;
                              });
                              await merchleavedetails();
                              setState(() {
                                isApiCallProcess = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ResponsetoLeave()));
                            },
                            child: Container(
                              height: 120,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 3.2,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: containerscolor,
                              ),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(FMdashboarddata.leaveresponsetotal.toString(),style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                                      SizedBox(height: 10),
                                      Text(
                                        'Leave Response',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Text("My Activity", style: TextStyle(color: containerscolor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: ()async{
                              setState(() {
                                isApiCallProcess =true;
                              });
                              await getmyattandance();
                              setState(() {
                                isApiCallProcess = false;
                              });
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (BuildContext context) => MyAttendance()));
                            },
                            child: Container(
                              height: 120,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.6,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: containerscolor,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("My Attendance",style: TextStyle(fontSize: 15.0),),
                                  Text(FMdashboarddata.attendance.toString(), style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 30),),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async{
                              setState(() {
                                isApiCallProcess = true;
                              });
                              await leaveData();
                              setState(() {
                                isApiCallProcess = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext
                                      context) =>
                                          leavestatusPage()));
                            },
                            child: Container(
                              height: 120,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 1.75,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: containerscolor,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Apply Leave"),
                                  Text(FMdashboarddata.leavebalance.toString(), style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 30),),
                                  Text("Total available Leave's",style: TextStyle(fontSize: 15),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 125,
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.03,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: containerscolor,
                        ),
                        child: Row(
                          children: [
                            Spacer(flex: 2,),
                            Icon(
                              CupertinoIcons.sun_max,
                              color: Colors.black,
                              size: 50,
                            ),
                            Spacer(flex: 2),
                            Text(
                              'Welcome to the new merchendiser\ninterface of RMS. '
                                  'Hope to have a\ngreat day ahead!',
                              style: new TextStyle(fontSize: 15
                              ),
                            ),
                            Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    child: FloatingActionButton(
                      onPressed: ()async{
                        setState(() {
                          isApiCallProcess = true;
                        });
                        await getmerchnamelist();
                        setState(() {
                          isApiCallProcess = false;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext
                                context) =>
                                    ChatUsers()));
                      },
                      backgroundColor: orange,
                      elevation: 10.0,
                      child: Icon(CupertinoIcons.chat_bubble_2_fill,color: pink,),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ),
    );
  }
}



