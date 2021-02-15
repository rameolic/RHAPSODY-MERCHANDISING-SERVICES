import 'package:flutter/material.dart';
import 'MenuContent.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/pages/home.dart';
import 'package:intl/intl.dart';

class leavelogic {
  static DateTime StratDate;
}


class LeaveRequest extends StatefulWidget {
  @override
  _LeaveRequestState createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {
  DateTime tomoroww = DateTime.now().add(Duration(days: 1));
  DateTime StratDate = DateTime.now().add(Duration(days: 1));
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: StratDate,
        firstDate: tomoroww,
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
    if (picked != null && picked != StratDate)
      setState(() {
        StratDate = picked;
        leavelogic.StratDate =picked;
      });
    leave.startdate = DateFormat('yyyy-MM-dd').format(StratDate);
  }
  bool valuefirst = false;
  TextEditingController reasoninputcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Row(
          children: [
            Text(
              'Leave Request',
              style: TextStyle(color: orange),
            ),
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
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Start Date",style: TextStyle(fontSize: 16),),
                            Spacer(),
                            Text(
                              "${StratDate.toLocal()}".split(' ')[0],
                              style: TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              icon: Icon(CupertinoIcons.calendar),
                              onPressed: () => _selectDate(context),
                            ),
                          ],
                        ),

                        Container(

                          child: EndDate(),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text("Leave Type",style: TextStyle(fontSize: 16),),
                        Spacer(),
                        LeaveReqDropDown(),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reason",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          maxLines: 3,
                          controller: reasoninputcontroller,
                          cursorColor: grey,
                          decoration: new InputDecoration(
                            focusColor: grey,
                            hintText: "Type your Reason here",
                            hintStyle: TextStyle(
                              color: grey,
                              fontSize: 16.0,
                            ),
                        ),
                        ),],
                    ),
                  ),
                  Container(
                    child: Container(
                      child:  Row(
                        children: [
                          SizedBox(width: 5,),
                          Transform.scale(
                            scale: 0.8,
                            child: Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.deepOrange,
                              value: this.valuefirst,
                              onChanged: (bool value) {
                                setState(() {
                                  this.valuefirst = value;
                                });
                              },
                            ),
                          ),
                          Text("I accept the terms and conditions",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      if( valuefirst == true && reasoninputcontroller.text!= "" ){
                         leave.reason = reasoninputcontroller.text;
                         leaverequest();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) => DashBoard()));
                      }
                      else if(valuefirst == false){
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
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
                                            "Alert",
                                            style: TextStyle(
                                                fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10.00,
                                          ),
                                          Text(
                                              "Please accept the terms and conditions",
                                              style: TextStyle(fontSize: 13.6)),
                                          SizedBox(
                                            height: 10.00,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext context) =>
                                                              LeaveRequest()));
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                    color:orange,
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  margin: EdgeInsets.only(right: 10.00),
                                                  child: Center(child: Text("ok",style: TextStyle(color: Colors.white),)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ));
                      }
                        
                        else {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
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
                                            "Alert",
                                            style: TextStyle(
                                                fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10.00,
                                          ),
                                          Text(
                                              "Reason can not be empty",
                                              style: TextStyle(fontSize: 13.6)),
                                          SizedBox(
                                            height: 10.00,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext context) =>
                                                              LeaveRequest()));
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                    color:orange,
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  margin: EdgeInsets.only(right: 10.00),
                                                  child: Center(child: Text("ok",style: TextStyle(color: Colors.white),)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ));
                      }
                    },
                    child:Center(
                      child:
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 40, 10, 10),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(10.00),
                          ),
                          child: Text(
                            'Request Leave',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),)
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LeaveReqDropDown extends StatefulWidget {
  @override
  _LeaveReqDropDownState createState() => _LeaveReqDropDownState();
}

class _LeaveReqDropDownState extends State<LeaveReqDropDown> {
  @override
  int dropDownValue = 0;
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        dropdownColor: Colors.white,
        value: dropDownValue,
        onChanged: (int newVal) {
          setState(() {
            dropDownValue = newVal;
            print(dropDownValue);
            if(dropDownValue == 0){
              leave.type = "Loss_of_Pay";
            }
            if(dropDownValue == 1){
              leave.type = "Sick_leave";
            }
            if(dropDownValue == 2){
              leave.type = "Annual_Leave";
            }
          });
        },
        items:
        DBResponsedatamonthly.leavebalance == 0 ?
            [
              DropdownMenuItem(
                value: 0,
                child: Text('Loss of Pay'),
              ),
            ]
            :
            [
              DropdownMenuItem(
                value: 0,
                child: Text('Loss of Pay'),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text('Sick Leave'),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text('Annual Leave'),
              ),
            ],
      ),
    );
  }
}
class EndDate extends StatefulWidget {
  @override
  _EndDateState createState() => _EndDateState();
}

class _EndDateState extends State<EndDate> {
  DateTime tomoroww = DateTime.now().add(Duration(days: 1) );
  DateTime ENDdate = DateTime.now().add(Duration(days: 1));
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: leavelogic.StratDate,
        firstDate: leavelogic.StratDate,
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
    if (picked != null && picked != EndDate)
      setState(() {
        ENDdate = picked;
      });
    leave.enddate = DateFormat('yyyy-MM-dd').format(ENDdate);
    print(leave.enddate);
  }
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("End Date",style: TextStyle(fontSize: 16),),
          Spacer(),
          Text("${ENDdate.toLocal()}".split(' ')[0],
          style: TextStyle(fontSize: 16),),
          IconButton(
            icon: Icon(CupertinoIcons.calendar),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),

    );
  }
}
