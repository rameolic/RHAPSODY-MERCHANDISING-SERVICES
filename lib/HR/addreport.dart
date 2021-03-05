import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/availabitiy.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:flutter/cupertino.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Leave Request.dart';
import 'package:merchandising/api/HRapi/empdetailsapi.dart';
import 'package:merchandising/model/leaveresponse.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:merchandising/api/leavestakenapi.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:intl/intl.dart';
import 'package:merchandising/api/HRapi/addingreportapi.dart';

class pickeddate{
  static String startdate;
  static String enddate;
}
class addreporting extends StatelessWidget {
  String feildmanager;
  String merchandiser;
  String startdate;
  String enddate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Text("add Report",style: TextStyle(color: orange),),
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
                    child: DropDownField(
                      onValueChanged: (dynamic value) {
                        merchandiser = value;
                      },
                      value: merchandiser,
                      required: false,
                      hintText: 'Select Merchandiser',
                      items: employees.merchandisers,
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
                    child: DropDownField(
                      onValueChanged: (dynamic value) {
                        feildmanager = value;
                      },
                      value: feildmanager,
                      required: false,
                      hintText: 'Select FeildManager',
                      items: employees.feildmanagers,
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
                    child:StartDate(),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:EndDate(),
                  ),
                  GestureDetector(
                    onTap: (){
                      report.feildmanagerid = 'Emp${feildmanager.replaceAll(new RegExp(r'[^0-9]'),'')}';
                      report.merchandiserid = 'Emp${merchandiser.replaceAll(new RegExp(r'[^0-9]'),'')}';
                      report.startdate = pickeddate.startdate == null ?  DateFormat('"yyyy-MM-dd"').format(DateTime.now()): pickeddate.startdate ;
                      report.enddate = pickeddate.enddate == null ?  DateFormat('"yyyy-MM-dd"').format(DateTime.now()): pickeddate.enddate ;
                      addreport();
                      },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 40, 10, 10),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: orange,
                          borderRadius: BorderRadius.circular(10.00),
                        ),
                        child: Text(
                          'Submit Report',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StartDate extends StatefulWidget {
  @override
  _StartDateState createState() => _StartDateState();
}

class _StartDateState extends State<StartDate> {
  DateTime StartDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: StartDate,
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
    if (picked != null && picked != StartDate)
      setState(() {
        StartDate = picked;
        pickeddate.startdate = DateFormat("yyyy-MM-dd").format(StartDate);
      });
  }
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("End Date",style: TextStyle(fontSize: 16),),
          Spacer(),
          Text("${StartDate.toLocal()}".split(' ')[0],
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

class EndDate extends StatefulWidget {
  @override
  _EndDateState createState() => _EndDateState();
}

class _EndDateState extends State<EndDate> {
  DateTime EndDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: EndDate,
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
    if (picked != null && picked != EndDate)
      setState(() {
        EndDate = picked;
        pickeddate.enddate = DateFormat("yyyy-MM-dd").format(EndDate);
      });
  }
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("End Date",style: TextStyle(fontSize: 16),),
          Spacer(),
          Text("${EndDate.toLocal()}".split(' ')[0],
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