import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/api/timesheetapi.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Time Sheet.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/api/timesheetmonthly.dart';
import 'package:merchandising/api/FMapi/merchnamelistapi.dart';


class MerchandisersList extends StatefulWidget {
  @override
  _MerchandisersListState createState() => _MerchandisersListState();
}

class _MerchandisersListState extends State<MerchandisersList> {
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: pink,
          iconTheme: IconThemeData(color: orange),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Timesheet",style: TextStyle(color: orange),),
              EmpInfo()
            ],
          ),
        ),
        // drawer: Drawer(
        //   child: Menu(),
        // ),
        body: Stack(
          children: [
            BackGround(),
            Column(
              children: [
                SizedBox(height: 10.0,),
                ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: merchnamelist.firstname.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap:()async{
                          print(merchnamelist.employeeid[index]);
                          timesheet.empid = merchnamelist.employeeid[index];
                          timesheet.empname = merchnamelist.name[index];
                          setState(() {
                            isApiCallProcess = true;
                          });
                          await getTimeSheetdaily();
                          await gettimesheetmonthly();
                          setState(() {
                            isApiCallProcess = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // ignore: non_constant_identifier_names
                                  builder: (BuildContextcontext) => TimeSheetList()));
                        },
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.fromLTRB(10.0,0,10,10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Merchandiser : ${merchnamelist.name[index]}',
                                    style: TextStyle(
                                        fontSize: 16.0,color: orange
                                    )),
                                SizedBox(height: 5),
                                Text('Emp ID : ${merchnamelist.employeeid[index]}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    )),
                              ],
                            )),
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


