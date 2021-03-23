import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/api/FMapi/merchnamelistapi.dart';
import 'package:merchandising/Fieldmanager/FMdashboard.dart';
import'package:merchandising/api/FMapi/outletapi.dart';
import 'package:merchandising/api/FMapi/addjourneyplan.dart';
import 'package:intl/intl.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:merchandising/ProgressHUD.dart';
class AddJourneyPlan extends StatefulWidget {
  @override
  _AddJourneyPlanState createState() => _AddJourneyPlanState();
}
class _AddJourneyPlanState extends State<AddJourneyPlan> {
  List merchandisers = merchnamelist.firstname.map((String val) {return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();
  String selectedmerchandiser;
  List <int>selectedoutlets;
  List outlets = outletdata.outletname.map((String val) {return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();
  bool pressschdlue = false;
  bool pressunschdle = true;
  bool isApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        child:Scaffold(
          appBar: AppBar(
            backgroundColor: pink,
            iconTheme: IconThemeData(color: orange),
            title: Text("Add Journey Plan",style: TextStyle(color: orange),),
          ),

          body: Stack(
            children: [
              BackGround(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: pink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pressschdlue = true;
                                    pressunschdle = false;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Text(
                                          'Scheduled',
                                          style: TextStyle(
                                            color: pressschdlue == true
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                      Icon(CupertinoIcons.triangle_fill,size: 12,color: Colors.white,),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 1.0),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    color: pressschdlue == true
                                        ? orange
                                        : Colors.white,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pressunschdle = true;
                                    pressschdlue = false;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Text(
                                          'Unscheduled',
                                          style: TextStyle(
                                            color: pressunschdle == false
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                      Icon(CupertinoIcons.triangle_fill,size: 12,color: Colors.white,),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 1.0),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    color: pressunschdle == true
                                        ? orange
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Container(
                            margin: EdgeInsets.only(top: 5,bottom: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SearchableDropdown.single(

                              underline: SizedBox(),
                              items: merchandisers,
                              value: selectedmerchandiser,
                              hint: "Select Merchandiser",
                              searchHint: "Select Merchandiser",
                              onChanged: (value) {
                                setState(() {
                                  selectedmerchandiser = value;
                                });
                              },
                              isExpanded: true,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5,bottom: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SearchableDropdown.multiple(
                              underline: SizedBox(),
                              items: outlets,
                              selectedItems: selectedoutlets,
                              hint: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("Select Outlets"),
                              ),
                              searchHint: "Select Outlets",
                              onChanged: (value) {
                                setState(() {
                                  selectedoutlets = value;
                                  print(selectedoutlets);
                                });
                              },
                              closeButton: (selectedItems) {
                                return (selectedItems.isNotEmpty
                                    ? "Save ${selectedItems.length == 1 ? '"' + outlets[selectedItems.first].value.toString() + '"' : '(' + selectedItems.length.toString() + ')'}"
                                    : "Save without selection");
                              },
                              isExpanded: true,
                            ),
                          ),
                          pressschdlue == true ? schedulejp() :Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(top: 5.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: StartDate(),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                                onTap: () async{
                                  print(pressschdlue);
                                  addunschdulejp.outletid=[];
                                  addschdulejp.outletid=[];
                                  addschdulejp.days = [];
                                  if(pressschdlue == true){
                                    if(selectedoutlets != null &&  selectedmerchandiser != null && selectedmonth != null && selectedweekday != null){
                                      for(int u=0;u<selectedoutlets.length;u++){
                                        addunschdulejp.outletid.add(outletdata.outletid[selectedoutlets[u]]);
                                        addschdulejp.outletid.add(outletdata.outletid[selectedoutlets[u]]);
                                      }
                                      for(int u=0;u<merchnamelist.firstname.length;u++){
                                        if (merchnamelist.firstname[u] == selectedmerchandiser) {
                                          addunschdulejp.empid = merchnamelist.employeeid[u];
                                          addschdulejp.empid = merchnamelist.employeeid[u];
                                        }}
                                      for(int u=0;u<months.length;u++){
                                        if (months[u] == selectedmonth) {
                                          addschdulejp.month = u+1;
                                        }}
                                      for(int u=0;u<selectedweekday.length;u++){
                                        addschdulejp.days.add("\"${weekdays[selectedweekday[u]]}\"");
                                      }
                                      setState(() {
                                        isApiCallProcess = true;
                                      });
                                      await addschdulejourneypaln();
                                      setState(() {
                                        isApiCallProcess = false;
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext
                                              context) =>
                                                  FieldManagerDashBoard()));
                                    }else{
                                      Flushbar(
                                        message: selectedoutlets == null ? "Outlet Should not be Empty" : selectedmerchandiser == null ? "Merchandiser cannot be empty": selectedmonth == null ? "Month cannot be empty" : "days cannot be empty",
                                        duration:  Duration(seconds: 3),
                                      )..show(context);
                                    }

                                  }else{
                                    if(selectedoutlets != null &&  selectedmerchandiser != null && selecteddate != null){
                                    for(int u=0;u<selectedoutlets.length;u++){
                                      addunschdulejp.outletid.add(outletdata.outletid[selectedoutlets[u]]);
                                      addschdulejp.outletid.add(outletdata.outletid[selectedoutlets[u]]);
                                    }
                                    for(int u=0;u<merchnamelist.firstname.length;u++){
                                      if (merchnamelist.firstname[u] == selectedmerchandiser) {
                                        addunschdulejp.empid = merchnamelist.employeeid[u];
                                        addschdulejp.empid = merchnamelist.employeeid[u];
                                      }}
                                    addunschdulejp.date =  DateFormat('yyyy-MM-dd').format(selecteddate);
                                    await addunschdulejourneypaln();
                                  }else{
                                      Flushbar(
                                        message: selectedoutlets == null ? "Outlet Should not be Empty" : selectedmerchandiser == null ? "Merchandiser cannot be empty" : "Date cannot be empty",
                                        duration:  Duration(seconds: 3),
                                      )..show(context);
                                    }
                                  }
                                },
                                child: Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: orange,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text("SAVE",style: TextStyle(color: Colors.white),))),
                          ),


                        ],
                      ),
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

DateTime selecteddate = DateTime.now();
class StartDate extends StatefulWidget {
  @override
  _StartDateState createState() => _StartDateState();
}

class _StartDateState extends State<StartDate> {
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selecteddate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.light(
              primary: orange,
              onPrimary: Colors.white,
              surface: orange,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor:Colors.grey[100],
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != selecteddate)
      setState(() {
        selecteddate = picked;
      });
  }
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("Select Date",style: TextStyle(fontSize: 16),),
          Spacer(),
          Text("${selecteddate.toLocal()}".split(' ')[0],
            style: TextStyle(fontSize: 16),),
          IconButton(
            icon: Icon(CupertinoIcons.calendar,size: 25),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),

    );
  }
}

// ignore: camel_case_types
class schedulejp extends StatefulWidget {
  @override
  _schedulejpState createState() => _schedulejpState();
}
List month = months.map((String val) {return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();
List weekday = weekdays.map((String val) {return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();
List<String> months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
String selectedmonth;
List<String> weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
List<int> selectedweekday;
// ignore: camel_case_types
class _schedulejpState extends State<schedulejp> {
  @override
  Widget build(BuildContext context)  {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5,bottom: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: SearchableDropdown.single(
              closeButton: SizedBox(),
              underline: SizedBox(),
              items: month,
              value: selectedmonth,
              hint: "Select Month",
              searchHint: "Select Month",
              onChanged: (value) {
                setState(() {
                  selectedmonth = value;
                });
              },
              isExpanded: true,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5,bottom: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SearchableDropdown.multiple(
            underline: SizedBox(),
            items: weekday,
            selectedItems: selectedweekday,
            hint: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Select Days"),
            ),
            searchHint: "Select Day",
            onChanged: (value) {
              setState(() {
                selectedweekday = value;
                print(selectedweekday);
              });
            },
            closeButton: (selectedItems) {
              return (selectedItems.isNotEmpty
                  ? "Save ${selectedItems.length == 1 ? '"' + weekday[selectedItems.first].value.toString() + '"' : '(' + selectedItems.length.toString() + ')'}"
                  : "Save without selection");
            },
            isExpanded: true,
          ),
        ),
      ],
    );
  }
}

